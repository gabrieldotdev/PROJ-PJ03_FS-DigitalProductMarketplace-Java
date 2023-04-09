package controller;

import DAO.AlbumDAO;
import DAO.ImageDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Album;
import model.Image;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/")
public class HomeController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            ImageDAO imageDAO = new ImageDAO();
            AlbumDAO albumDAO = new AlbumDAO();
            List<Image> images = imageDAO.getAllImages();
            List<Album> albums = albumDAO.getAllAlbums();
            System.out.println("images: " + images);
            request.setAttribute("images", images);
            request.setAttribute("albums", albums);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
