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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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

                // get all images of the album
                List<Image> albumImages = null;
                try {
                    albumImages = imageDAO.getImagesByAlbumId(album.getId());
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                request.setAttribute("album", album);
                request.setAttribute("albumImages", albumImages);
                RequestDispatcher editDispatcher = request.getRequestDispatcher("/user/edit-album.jsp");
                editDispatcher.forward(request, response);
                break;

            default:
                List<Album> albums = albumDAO.getAlbumsByUserId(user.getId());

                // Get ImageCoverAlbum by AlbumId
                List<Image> albumCoverImages = new ArrayList<>();
                for (Album albumItem : albums) {
                    Image albumCoverImage = null;
                    try {
                        albumCoverImage = albumDAO.getAlbumCoverImage(albumItem.getId());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    albumCoverImages.add(albumCoverImage);
                }
                request.setAttribute("albums", albums);
                request.setAttribute("albumCoverImages", albumCoverImages);
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

                String[] selectedImageIds = request.getParameterValues("selectedImages");
                List<Image> selectedImages = new ArrayList<>();
                if (selectedImageIds != null) {
                    for (String id : selectedImageIds) {
                        int imageId = Integer.parseInt(id);
                        Image image = imageDAO.getImageById(imageId);
                        selectedImages.add(image);
                    }
                }

                Album album = new Album(user, title, description, price, created_at, updated_at);
                albumDAO.createAlbum(album);

                // Add the image to the album
                for (Image image : selectedImages) {
                    AlbumImage albumImage = new AlbumImage(album.getId(), image.getId());
                    albumImageDAO.createAlbumImage(albumImage);
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
