package controller;

import DAO.AlbumDAO;
import DAO.ImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Album;
import model.Image;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ImageDAO imageDAO = new ImageDAO();
            AlbumDAO albumDAO = new AlbumDAO();
            List<Image> images = imageDAO.getAllImages();
            List<Album> albums = albumDAO.getAllAlbums();
            System.out.println("images: " + images);
            request.setAttribute("images", images);
            request.setAttribute("albums", albums);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
