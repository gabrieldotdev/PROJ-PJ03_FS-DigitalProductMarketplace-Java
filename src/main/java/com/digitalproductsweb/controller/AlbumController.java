package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.AlbumImageDAO;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.AlbumImage;
import com.digitalproductsweb.model.Image;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class AlbumController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlbumController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AlbumController at " +
                    request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "ADD":
                    addAlbum(request, response);
                    break;
                case "LOAD":
                    getById(request, response);
                    break;
                case "UPDATE":
                    updateAlbum(request, response);
                    break;
                case "DELETE":
                    deleteAlbum(request, response);
                    break;
                case "LIST":
                default:
                    listAlbum(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AlbumDAO albumDAO = new AlbumDAO();
        List<Album> albums = albumDAO.getAllAlbums();
        request.setAttribute("albums", albums);
        request.getRequestDispatcher("/album-list.jsp").forward(request, response);
    }

    private void addAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Album album = new Album();
        album.setUser_id(Integer.parseInt(request.getParameter("user_id")));
        album.setTitle(request.getParameter("title"));
        album.setDescription(request.getParameter("description"));
        album.setPrice(Double.parseDouble(request.getParameter("price")));
        album.setCreated_at(new Date(System.currentTimeMillis()));
        album.setUpdated_at(new Date(System.currentTimeMillis()));
        // save to database
        AlbumDAO albumDAO = new AlbumDAO();
        albumDAO.createAlbum(album);

        // Save image to database
        List<AlbumImage> albumImages = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getName().equals("image")) {
                // Create image object
                Image image = new Image();
                image.setUser_id(Integer.parseInt(request.getParameter("user_id")));
                image.setTitle(request.getParameter("title"));
                image.setFile_path(request.getParameter("file_path"));
                image.setDescription(request.getParameter("description"));
                image.setPrice(Double.parseDouble(request.getParameter("price")));
                image.setCreated_at(new Date(System.currentTimeMillis()));
                image.setUpdated_at(new Date(System.currentTimeMillis()));

                // Save image to database
                ImageDAO imageDAO = new ImageDAO();
                imageDAO.createImage(image);

                // Link image to album
                AlbumImage albumImage = new AlbumImage();
                albumImage.setAlbum_id(album.getId());
                albumImage.setImage_id(image.getId());
                albumImages.add(albumImage);
            }
        }
        AlbumImageDAO albumImageDAO = new AlbumImageDAO();
        for (AlbumImage albumImage : albumImages) {
            albumImageDAO.createAlbumImage(albumImage);
        }
        listAlbum(request, response);
    }

    private void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("album_id"));
        AlbumDAO albumDAO = new AlbumDAO();
        AlbumImageDAO albumImageDAO = new AlbumImageDAO();
        Album album = albumDAO.getAlbumById(id);
        List<AlbumImage> albumImages = albumImageDAO.getAlbumImagesByAlbumId(id);
        request.setAttribute("album", album);
        request.setAttribute("albumImages", albumImages);
        request.getRequestDispatcher("/album-form.jsp").forward(request, response);
    }

    private void updateAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Album album = new Album();
        album.setId(Integer.parseInt(request.getParameter("album_id")));
        album.setUser_id(Integer.parseInt(request.getParameter("user_id")));
        album.setTitle(request.getParameter("title"));
        album.setDescription(request.getParameter("description"));
        album.setPrice(Double.parseDouble(request.getParameter("price")));
        album.setCreated_at(new Date(System.currentTimeMillis()));
        album.setUpdated_at(new Date(System.currentTimeMillis()));
        AlbumDAO albumDAO = new AlbumDAO();
        albumDAO.updateAlbum(album);
        listAlbum(request, response);
    }

    private void deleteAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("album_id"));
        AlbumDAO albumDAO = new AlbumDAO();
        AlbumImageDAO albumImageDAO = new AlbumImageDAO();
        albumDAO.deleteAlbum(id);
        albumImageDAO.deleteAlbumImagesByAlbumId(id);
        ImageDAO imageDAO = new ImageDAO();
        imageDAO.deleteImagesByAlbumId(id);
        listAlbum(request, response);
    }
}
