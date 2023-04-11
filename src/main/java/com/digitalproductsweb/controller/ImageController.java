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
            String theCommand = request.getParameter("command");
            switch (theCommand != null ? theCommand : "LIST") {
                case "ADD":
                    addImage(request, response);
                    break;
                case "LOAD":
                    getById(request, response);
                    break;
                case "UPDATE":
                    updateImage(request, response);
                    break;
                case "DELETE":
                    deleteImage(request, response);
                    break;
                case "LIST":
                default:
                    listImage(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Image> images = imageDAO.getImagesNotInAlbum();
        request.setAttribute("images", images);
        request.getRequestDispatcher("/admin/image-list.jsp").forward(request, response);
    }

    private void addImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession();
        int user_id = ((User) session.getAttribute("user")).getId();
        Image image = new Image(
                user_id,
                request.getParameter("title"),
                request.getParameter("file_path"),
                request.getParameter("description"),
                Double.parseDouble(request.getParameter("price"))
        );
        imageDAO.createImage(image);
        listImage(request, response);
    }

    private void getById(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Image image = imageDAO.getImageById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("id", image.getId());
        request.setAttribute("title", image.getTitle());
        request.setAttribute("file_path", image.getFile_path());
        request.setAttribute("description", image.getDescription());
        request.setAttribute("price", image.getPrice());
        request.getRequestDispatcher("/admin/image-edit.jsp").forward(request, response);
    }

    private void updateImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Date updated_at = new Date(System.currentTimeMillis());
        Image image = new Image(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("title"),
                request.getParameter("file_path"),
                request.getParameter("description"),
                Double.parseDouble(request.getParameter("price")),
                updated_at
        );
        imageDAO.updateImage(image);
        listImage(request, response);
    }

    private void deleteImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        imageDAO.deleteImage(Integer.parseInt(request.getParameter("id")));
        listImage(request, response);
    }
}
