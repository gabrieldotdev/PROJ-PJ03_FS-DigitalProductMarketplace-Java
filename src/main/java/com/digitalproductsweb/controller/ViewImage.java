package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.model.Image;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/image")
public class ViewImage extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ImageDAO imageDAO = new ImageDAO();
        Image image = imageDAO.getImageById(id);
        List<Image> randomImages = imageDAO.getRandom10Images();
        request.setAttribute("image", image);
        request.setAttribute("randomImages", randomImages);
        request.getRequestDispatcher("/view-image.jsp").forward(request, response);
    }

}
