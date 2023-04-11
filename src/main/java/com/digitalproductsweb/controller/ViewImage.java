package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Image;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/image")
public class ViewImage extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ImageDAO imageDAO = new ImageDAO();
        Image image = imageDAO.getImageById(id);
        request.setAttribute("image", image);
        request.getRequestDispatcher("/view-image.jsp").forward(request, response);
    }

}
