package com.digitalproductsweb.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.model.Album;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Image;

@WebServlet("/search")
public class SearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("q");
        if (query == null || query.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        try {
            // search images by title
            ImageDAO imageDAO = new ImageDAO();
            List<Image> images = imageDAO.searchImagesByTitle(query);

            // search album by title
            AlbumDAO albumDAO = new AlbumDAO();
            List<Album> albums = albumDAO.searchAlbumsByTitle(query);

            // Get ImageCoverAlbum by AlbumId
            List<Image> albumCoverImages = new ArrayList<>();
            for (Album album : albums) {
                Image albumCoverImage = albumDAO.getAlbumCoverImage(album.getId());
                albumCoverImages.add(albumCoverImage);
            }

            request.setAttribute("images", images);
            request.setAttribute("albums", albums);
            request.setAttribute("query", query);
            request.setAttribute("albumsCoverImages", albumCoverImages);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
