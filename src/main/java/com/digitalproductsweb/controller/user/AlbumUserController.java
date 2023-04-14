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
import java.util.*;

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
                List<Image> images = imageDAO.getImagesByUserId(user.getId());
                request.setAttribute("images", images);
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
                request.setAttribute("images", albumImages);
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
                double price = 0;
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                price = Double.parseDouble(request.getParameter("price"));
                Date created_at = new Date(System.currentTimeMillis());
                Date updated_at = new Date(System.currentTimeMillis());
                Album album = new Album(user, title, description, price, created_at, updated_at);
                int albumIdNew = albumDAO.createAlbum(album);
                album.setId(albumIdNew);

                String[] selectedImageIdsString = request.getParameterValues("selectedImageIds");

                if (selectedImageIdsString != null) {
                    for(String imageId : selectedImageIdsString) {
                        int id = Integer.parseInt(imageId);
                        Image image = imageDAO.getImageById(id);
                        System.out.println("ID" + id);
                        System.out.println("Image" + image);
                        System.out.println("Album" + album);
                        AlbumImage albumImage = new AlbumImage(album.getId(), image.getId());
                        albumImageDAO.createAlbumImage(albumImage);
                    }
                } else {
                    response.sendRedirect("/user/albums?action=create");
                    return;
                }


                response.sendRedirect("/user/albums");
                break;

            case "edit":
                System.out.println("LOADING UPDATE");
                int id = Integer.parseInt(request.getParameter("id"));
                Album updatedAlbum = albumDAO.getAlbumById(id);
                if (updatedAlbum.getUser().getId() != user.getId()) {
                    response.sendRedirect("/user/albums");
                    return;
                }
                String updatedTitle = request.getParameter("title");
                String updatedDescription = request.getParameter("description");
                double updatedPrice = Double.parseDouble(request.getParameter("price"));

                String[] selectedImageIds = request.getParameterValues("selectedImageIds");
                System.out.println("selectedImageIds" + selectedImageIds);
                if (selectedImageIds != null) {
                        albumImageDAO.deleteAlbumImagesByAlbumId(updatedAlbum.getId());
                    for(String imageId : selectedImageIds) {
                        albumImageDAO.createAlbumImage(new AlbumImage(updatedAlbum.getId(), Integer.parseInt(imageId)));
                    }
                } else {
                    response.sendRedirect("/user/albums");
                    return;
                }
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
                albumImageDAO.deleteAlbumImagesByAlbumId(albumToDelete.getId());
                albumDAO.deleteAlbum(albumId);
                response.sendRedirect("/user/albums");
                break;

            default:
                response.sendRedirect("/user/albums");
                break;
        }
    }
}
