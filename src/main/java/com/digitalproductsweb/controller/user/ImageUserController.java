package com.digitalproductsweb.controller.user;

import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Image;
import com.digitalproductsweb.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class ImageUserController extends HttpServlet {

    private ImageDAO imageDAO;

    public void init() {
        imageDAO = new ImageDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        action = action == null ? "" : action;
        switch (action) {
            case "create":
                RequestDispatcher createDispatcher = request.getRequestDispatcher("/user/create-image.jsp");
                createDispatcher.forward(request, response);
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Image image = imageDAO.getImageById(id);
                request.setAttribute("image", image);

                RequestDispatcher editDispatcher = request.getRequestDispatcher("/user/edit-image.jsp");
                editDispatcher.forward(request, response);
                break;

            default:
                List<Image> images = imageDAO.getImagesByUserId(user.getId());
                request.setAttribute("images", images);
                request.getRequestDispatcher("/user/images.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        User user = (User) session.getAttribute("user");
        action = action == null ? "" : action;
        switch (action) {
            case "create":
                String title = request.getParameter("title");
                String filePath = request.getParameter("filePath");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));

                Image image = new Image(user, title, filePath, description, price);
                imageDAO.createImage(image);

                response.sendRedirect("/user/images.jsp");
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                String updatedTitle = request.getParameter("title");
                String updatedFilePath = request.getParameter("filePath");
                String updatedDescription = request.getParameter("description");
                double updatedPrice = Double.parseDouble(request.getParameter("price"));

                Image updatedImage = imageDAO.getImageById(id);
                updatedImage.setTitle(updatedTitle);
                updatedImage.setFilePath(updatedFilePath);
                updatedImage.setDescription(updatedDescription);
                updatedImage.setPrice(updatedPrice);
                imageDAO.updateImage(updatedImage);

                response.sendRedirect("/user/images.jsp");
                break;

            case "delete":
                int imageId = Integer.parseInt(request.getParameter("id"));
                imageDAO.deleteImage(imageId);
                response.sendRedirect("/user/images.jsp");
                break;

            default:
                response.sendRedirect("/user/images.jsp");
                break;
        }
    }
}
