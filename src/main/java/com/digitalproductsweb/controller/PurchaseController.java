package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.AlbumDAO;
import com.digitalproductsweb.DAO.ImageDAO;
import com.digitalproductsweb.DAO.PurchaseDAO;
import com.digitalproductsweb.model.Album;
import com.digitalproductsweb.model.Image;
import com.digitalproductsweb.model.Purchase;
import com.digitalproductsweb.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Purchase", value = "/Purchase")
public class PurchaseController extends HttpServlet {
    private PurchaseDAO purchaseDAO;
    private AlbumDAO albumDAO;

    public void init() {
        purchaseDAO = new PurchaseDAO();
        albumDAO = new AlbumDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "login.jsp");
            return;
        }
        int userId = user.getId();
        List<Purchase> purchases = purchaseDAO.getPurchasesByUserId(userId);
        List<Image> albumCoverImages = new ArrayList<>();
        for (Purchase purchase : purchases) {
            Image albumCoverImage = null;
            try {
                albumCoverImage = albumDAO.getAlbumCoverImage(purchase.getAlbum().getId());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            albumCoverImages.add(albumCoverImage);
        }
        request.setAttribute("purchases", purchases);
        request.setAttribute("albumCoverImages", albumCoverImages);
        request.getRequestDispatcher("/purchase.jsp").forward(request, response);
    }
}
