package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Image;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

public class ImageController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ImageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImageController at " +
                    request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
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
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            processRequest(req, resp);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void listImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ImageDAO imageDAO = new ImageDAO();
        List<Image> images = imageDAO.getAllImages();
        request.setAttribute("images", images);
        request.getRequestDispatcher("images.jsp").forward(request, response);
    }
    private void addImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String title = request.getParameter("title");
        String file_path = request.getParameter("file_path");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Date createdAt = new Date(System.currentTimeMillis());
        Date updatedAt = new Date(System.currentTimeMillis());
        Image image = new Image(user_id, title, file_path, description, price, createdAt, updatedAt);
        ImageDAO imageDAO = new ImageDAO();
        imageDAO.createImage(image);
        listImage(request, response);
    }

    private void getById(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        ImageDAO imageDAO = new ImageDAO();
        Image image = imageDAO.getImageById(id);
        request.setAttribute("image", image);
        request.getRequestDispatcher("update-image.jsp").forward(request, response);
    }

    private void updateImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String file_path = request.getParameter("file_path");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Date updatedAt = new Date(System.currentTimeMillis());
        Image image = new Image(id, title, file_path, description, price, updatedAt);
        ImageDAO imageDAO = new ImageDAO();
        imageDAO.updateImage(image);
        listImage(request, response);
    }

    private void deleteImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        ImageDAO imageDAO = new ImageDAO();
        imageDAO.deleteImage(id);
        listImage(request, response);
    }
}
