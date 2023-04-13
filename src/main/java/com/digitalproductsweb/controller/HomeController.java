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
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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

            // Get all image IDs from the albums
            List<Integer> albumImageIds = albumDAO.getAlbumImageIds();
            Set<Integer> albumImageIdSet = new HashSet<>(albumImageIds);

            // Filter out images that are in albums
            List<Image> filteredImages = new ArrayList<>();

            for (Image image : images) {
                if (!albumImageIdSet.contains(image.getId())) {
                    filteredImages.add(image);
                }
            }

            // Get first image from each album and add it to a new list
            List<Image> albumCoverImages = new ArrayList<>();
            for (Album album : albums) {
                Image albumCoverImage = albumDAO.getAlbumCoverImage(album.getId());
                albumCoverImages.add(albumCoverImage);
            }

            request.setAttribute("images", filteredImages);
            request.setAttribute("albums", albums);
            request.setAttribute("albumsCoverImages", albumCoverImages);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
