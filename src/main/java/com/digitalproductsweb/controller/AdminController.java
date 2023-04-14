package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.AlbumImageDAO;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.DAO.UserDAO;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.Image;
import com.digitalproductsweb.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminController extends HttpServlet {

    private ImageDAO imageDAO;
    private AlbumDAO albumDAO;
    private UserDAO userDAO;
    private AlbumImageDAO albumImageDAO;

    public void init() {
        imageDAO = new ImageDAO();
        albumDAO = new AlbumDAO();
        userDAO = new UserDAO();
        albumImageDAO = new AlbumImageDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String command = request.getParameter("command");
            command = command == null ? "" : command;
            switch (command) {
                case "add":
                    addImage(request, response);
                    break;
                case "load":
                    getImageById(request, response);
                    break;
                case "update":
                    updateImage(request, response);
                    break;
                case "delete":
                    deleteImage(request, response);
                    break;
                case "deleteAlbum":
                    deleteAlbum(request, response);
                    break;
                case "loadAlbum":
                    getAlbumById(request, response);
                    break;
                case "deleteUser":
                    int id = Integer.parseInt(request.getParameter("userId"));
                    userDAO.deleteUser(id);
                    listData(request, response);
                    break;
                default:
                    listData(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listData(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Image> images = imageDAO.getImagesNotInAlbum();
        List<Album> albums = albumDAO.getAllAlbums();
        List<User> users = userDAO.getAllUsers();

        // Get first image from each album and add it to a new list
        List<Image> albumCoverImages = new ArrayList<>();
        for (Album album : albums) {
            Image albumCoverImage = albumDAO.getAlbumCoverImage(album.getId());
            albumCoverImages.add(albumCoverImage);
        }
        request.setAttribute("images", images);
        request.setAttribute("albums", albums);
        request.setAttribute("users", users);
        request.setAttribute("albumsCoverImages", albumCoverImages);
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void addImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Image image = new Image(
                user,
                request.getParameter("title"),
                request.getParameter("file_path"),
                request.getParameter("description"),
                Double.parseDouble(request.getParameter("price")),
                null,
                null
        );

        imageDAO.createImage(image);
        listData(request, response);
    }

    private void getImageById(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Image image = imageDAO.getImageById(id);

        request.setAttribute("image", image);
        request.getRequestDispatcher("/admin/image-edit.jsp").forward(request, response);
    }

    private void updateImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Date updatedAt = new Date(System.currentTimeMillis());

        Image image = new Image(
                Integer.parseInt(request.getParameter("id")),
                null,
                request.getParameter("title"),
                request.getParameter("file_path"),
                request.getParameter("description"),
                Double.parseDouble(request.getParameter("price")),
                null,
                updatedAt
        );

        imageDAO.updateImage(image, true);
        listData(request, response);
    }

    private void deleteImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        imageDAO.deleteImage(id);
        listData(request, response);
    }

    private void deleteAlbum(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("albumId"));
        imageDAO.deleteImagesByAlbumId(id);
        albumImageDAO.deleteAlbumImagesByAlbumId(id);
        albumDAO.deleteAlbum(id);
        listData(request, response);
    }

    private void getAlbumById(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("albumId"));
        Album album = albumDAO.getAlbumById(id);
        List<Image> images = imageDAO.getImagesByAlbumId(id);

        request.setAttribute("album", album);
        request.setAttribute("images", images);
        request.getRequestDispatcher("/admin/album-edit.jsp").forward(request, response);
    }

}
