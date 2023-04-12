package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.AlbumImageDAO;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.AlbumImage;
import com.digitalproductsweb.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class AlbumController extends HttpServlet {
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
        request.getRequestDispatcher("/admin/album-list.jsp").forward(request, response);
    }

    private void addAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Album album = new Album();
        album.setUser(user);
        album.setTitle(request.getParameter("title"));
        album.setDescription(request.getParameter("description"));
        album.setPrice(Double.parseDouble(request.getParameter("price")));
        // save to database
        AlbumDAO albumDAO = new AlbumDAO();
        albumDAO.createAlbum(album);
        listAlbum(request, response);
    }

    private void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("albumId"));
        AlbumDAO albumDAO = new AlbumDAO();
        AlbumImageDAO albumImageDAO = new AlbumImageDAO();
        Album album = albumDAO.getAlbumById(id);
        List<AlbumImage> albumImages = albumImageDAO.getAlbumImagesByAlbumId(id);
        request.setAttribute("album", album);
        request.setAttribute("albumImages", albumImages);
        request.getRequestDispatcher("/admin/album-form.jsp").forward(request, response);
    }

    private void updateAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Album album = new Album();
        album.setId(Integer.parseInt(request.getParameter("album_id")));
        album.setTitle(request.getParameter("title"));
        album.setDescription(request.getParameter("description"));
        album.setPrice(Double.parseDouble(request.getParameter("price")));
        AlbumDAO albumDAO = new AlbumDAO();
        albumDAO.updateAlbum(album);
        listAlbum(request, response);
    }

    private void deleteAlbum(HttpServletRequest request, HttpServletResponse response
    ) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("album_id"));
        AlbumDAO albumDAO = new AlbumDAO();
        albumDAO.deleteAlbum(id);
        listAlbum(request, response);
    }
}