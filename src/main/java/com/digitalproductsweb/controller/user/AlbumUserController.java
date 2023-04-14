package com.digitalproductsweb.controller.user;

import com.cloudinary.utils.ObjectUtils;
import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.AlbumImageDAO;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.AlbumImage;
import com.digitalproductsweb.model.Image;
import com.digitalproductsweb.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import com.cloudinary.*;

import java.io.IOException;
import java.sql.Date;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@WebServlet("/user/albums")
public class AlbumUserController extends HttpServlet {

    private AlbumDAO albumDAO;
    private ImageDAO imageDAO;
    private AlbumImageDAO albumImageDAO;
    private Cloudinary cloudinary;

    public void init() {
        albumDAO = new AlbumDAO();
        imageDAO = new ImageDAO();
        albumImageDAO = new AlbumImageDAO();
        cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "dojg2yifd", "api_key", "737779159834995", "api_secret", "f6H3n3Xolpah03LWnW64N8BwZbA", "secure", true));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        action = action == null ? "" : action;
        switch (action) {
            case "create":
                RequestDispatcher createDispatcher = request.getRequestDispatcher("/user/create-album.jsp");
                createDispatcher.forward(request, response);
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Album album = albumDAO.getAlbumById(id);
                if (album.getUser().getId() != user.getId()) {
                    response.sendRedirect("/user/albums");
                    return;
                }
                request.setAttribute("album", album);

                RequestDispatcher editDispatcher = request.getRequestDispatcher("/user/edit-album.jsp");
                editDispatcher.forward(request, response);
                break;

            default:
                List<Album> albums = albumDAO.getAlbumsByUserId(user.getId());
                request.setAttribute("albums", albums);
                request.getRequestDispatcher("/user/albums.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        String action = request.getParameter("action");
        action = action == null ? "" : action;

        switch (action) {
            case "create":
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                Date created_at = new Date(System.currentTimeMillis());
                Date updated_at = new Date(System.currentTimeMillis());

                Album album = new Album(user, title, description, price, created_at, updated_at);
                albumDAO.createAlbum(album);
                // Get the array of uploaded files
                Collection<Part> parts = request.getParts();

                for (Part part : parts) {
                    String titleImg = request.getParameter("title");
                    String descriptionImg = request.getParameter("description");
                    double priceImg = Double.parseDouble(request.getParameter("price"));

                    // Upload photo to Cloudinary
                    if (part != null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
                        byte[] bytes = part.getInputStream().readAllBytes();
                        Map uploadResult = cloudinary.uploader().uploadLarge(bytes, ObjectUtils.emptyMap());
                        String filePath = uploadResult.get("url").toString();

                        // Create a new image object and save it to the database
                        Image image = new Image(user, titleImg, filePath, descriptionImg, priceImg);
                        imageDAO.createImage(image);

                        // Add the image to the album
                        AlbumImage albumImage = new AlbumImage(album.getId(), image.getId());
                        albumImageDAO.createAlbumImage(albumImage);
                    }
                }
                response.sendRedirect("/user/albums");
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                Album updatedAlbum = albumDAO.getAlbumById(id);
                if (updatedAlbum.getUser().getId() != user.getId()) {
                    response.sendRedirect("/user/albums");
                    return;
                }
                String updatedTitle = request.getParameter("title");
                String updatedDescription = request.getParameter("description");
                double updatedPrice = Double.parseDouble(request.getParameter("price"));

                updatedAlbum.setTitle(updatedTitle);
                updatedAlbum.setDescription(updatedDescription);
                updatedAlbum.setPrice(updatedPrice);
                albumDAO.updateAlbum(updatedAlbum);

                response.sendRedirect("/user/albums");
                break;

            case "delete":
                int albumId = Integer.parseInt(request.getParameter("id"));
                Album albumToDelete = albumDAO.getAlbumById(albumId);
                if (albumToDelete.getUser().getId() != user.getId()) {
                    response.sendRedirect("/user/albums");
                    return;
                }
                albumDAO.deleteAlbum(albumId);
                response.sendRedirect("/user/albums");
                break;

            default:
                response.sendRedirect("/user/albums");
                break;
        }
    }
}
