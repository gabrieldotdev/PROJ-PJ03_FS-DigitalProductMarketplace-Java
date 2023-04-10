package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Image;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.digitalproductsweb.model.Album;

import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            ImageDAO imageDAO = new ImageDAO();
            AlbumDAO albumDAO = new AlbumDAO();
            List<Image> images = imageDAO.getAllImages();
            List<Album> albums = albumDAO.getAllAlbums();
            request.setAttribute("images", images);
            request.setAttribute("albums", albums);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
