package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.Image;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/album")
public class ViewAlbum extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int albumId = Integer.parseInt(request.getParameter("albumId"));
            AlbumDAO albumDAO = new AlbumDAO();
            Album album = albumDAO.getAlbumById(albumId);

            ImageDAO imageDAO = new ImageDAO();
            List<Image> images = imageDAO.getImagesByAlbumId(albumId);

            request.setAttribute("album", album);
            request.setAttribute("images", images);

            request.getRequestDispatcher("/view-album.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
