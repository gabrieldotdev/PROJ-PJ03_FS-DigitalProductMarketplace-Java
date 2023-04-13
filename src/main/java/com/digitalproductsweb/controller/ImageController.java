package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.ImageDAO;
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
import java.util.List;

public class ImageController extends HttpServlet {

    private ImageDAO imageDAO;

    public void init() {
        imageDAO = new ImageDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String command = request.getParameter("command");
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
                default:
                    listImages(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listImages(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Image> images = imageDAO.getAllImages();
        request.setAttribute("images", images);
        request.getRequestDispatcher("/admin/image-list.jsp").forward(request, response);
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
        listImages(request, response);
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
        listImages(request, response);
    }

    private void deleteImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        imageDAO.deleteImage(id);
        listImages(request, response);
    }
}
