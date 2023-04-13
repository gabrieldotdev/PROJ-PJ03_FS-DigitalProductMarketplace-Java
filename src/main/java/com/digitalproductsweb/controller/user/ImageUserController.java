package com.digitalproductsweb.controller.user;

import com.cloudinary.utils.ObjectUtils;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Image;
import com.digitalproductsweb.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig()
public class ImageUserController extends HttpServlet {

    private ImageDAO imageDAO;
    private Cloudinary cloudinary;

    public void init() {
        imageDAO = new ImageDAO();
        cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "dojg2yifd", "api_key", "737779159834995", "api_secret", "f6H3n3Xolpah03LWnW64N8BwZbA", "secure", true));
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }
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
        // check user logged
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        switch (action) {
            case "create":
                // Read form parameters
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));

                // Upload photo to Cloudinary
                Part photo = request.getPart("file");
                String filePath;
                if (photo != null) {
                    // Upload photo to Cloudinary
                    byte[] bytes = photo.getInputStream().readAllBytes();
                    Map uploadResult = cloudinary.uploader().uploadLarge(bytes, ObjectUtils.emptyMap());
                    filePath = uploadResult.get("url").toString();
                } else {
                    // No photo provided, redirect to the images page
                    response.sendRedirect(request.getContextPath() + "/user/images");
                    return;
                }

                // Create a new image object and save it to the database
                Image image = new Image(user, title, filePath, description, price);
                imageDAO.createImage(image);

                // Redirect to the images page
                response.sendRedirect(request.getContextPath() + "/user/images");
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                String updatedTitle = request.getParameter("title");
                String updatedDescription = request.getParameter("description");
                double updatedPrice = Double.parseDouble(request.getParameter("price"));

                Image updatedImage = imageDAO.getImageById(id);
                updatedImage.setTitle(updatedTitle);
                updatedImage.setDescription(updatedDescription);
                updatedImage.setPrice(updatedPrice);
                imageDAO.updateImage(updatedImage, false); // pass false to exclude file_path

                response.sendRedirect("/user/images");
                break;


            case "delete":
                int imageId = Integer.parseInt(request.getParameter("id"));
                imageDAO.deleteImage(imageId);
                response.sendRedirect("/user/images");
                break;

            default:
                response.sendRedirect("/user/images");
                break;
        }
    }

}
