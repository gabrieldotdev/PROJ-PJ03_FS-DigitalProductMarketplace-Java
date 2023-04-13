package com.digitalproductsweb.controller.user;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.DAO.UserDAO;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.Image;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.digitalproductsweb.model.User;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        if (userId == 0) {
            response.sendRedirect("login");
            return;
        }
        User user = null;
        UserDAO userDAO = new UserDAO();
        user = userDAO.getUserById(userId);

        ImageDAO imageDAO = new ImageDAO();
        List<Image> images = imageDAO.getImagesByUserId(userId);

        AlbumDAO albumDAO = new AlbumDAO();
        List<Album> albums = albumDAO.getAlbumsByUserId(userId);
        List<Image> albumCoverImages = new ArrayList<>();
        for (Album album : albums) {
            try {
                Image albumCoverImage = albumDAO.getAlbumCoverImage(album.getId());
                albumCoverImages.add(albumCoverImage);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        request.setAttribute("user", user);
        request.setAttribute("images", images);
        request.setAttribute("albums", albums);
        request.setAttribute("albumCoverImages", albumCoverImages);
        request.getRequestDispatcher("/user/profile.jsp").forward(request, response);
    }
}
