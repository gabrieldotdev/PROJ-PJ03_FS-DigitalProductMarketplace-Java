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
import java.util.Objects;

@WebServlet(name = "Purchase", value = "/Purchase")
public class PurchaseController extends HttpServlet {
    private PurchaseDAO purchaseDAO;
    private AlbumDAO albumDAO;
    private ImageDAO imageDAO;

    public void init() {
        purchaseDAO = new PurchaseDAO();
        albumDAO = new AlbumDAO();
        imageDAO = new ImageDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productCount = 0;
        double totalPrice = 0.0;
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "login.jsp");
            return;
        }
        int userId = user.getId();
        List<Purchase> purchases = purchaseDAO.getPurchasesByUserId(userId);
        List<Image> albumCoverImages = new ArrayList<>();
        for (Purchase purchase : purchases) {
            if (purchase.getImage() != null) {
                productCount++;
                totalPrice += purchase.getImage().getPrice();
            }
            if (purchase.getAlbum() != null) {
                productCount++;
                totalPrice += purchase.getAlbum().getPrice();
                Image albumCoverImage = null;
                try {
                    albumCoverImage = albumDAO.getAlbumCoverImage(purchase.getAlbum().getId());
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                if (albumCoverImage != null) {
                    albumCoverImages.add(albumCoverImage);
                }
            }
        }

        request.setAttribute("productCount", productCount);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("purchases", purchases);
        request.setAttribute("albumCoverImages", albumCoverImages);
        request.getRequestDispatcher("/purchase.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "login");
            return;
        }
        switch (action) {
            case "ADD":
                String type = request.getParameter("type");
                Purchase purchaseAdd = new Purchase();
                purchaseAdd.setUser(user);
                purchaseAdd.setCreated_at(new Date(System.currentTimeMillis()));
                if (Objects.equals(type, "image")) {
                    int imageId = Integer.parseInt(request.getParameter("imageId"));
                    purchaseAdd.setImage(imageDAO.getImageById(imageId));
                    purchaseAdd.setAlbum(null);
                } else if (Objects.equals(type, "album")) {
                    int albumId = Integer.parseInt(request.getParameter("albumId"));
                    purchaseAdd.setImage(null);
                    purchaseAdd.setAlbum(albumDAO.getAlbumById(albumId));
                }
                purchaseDAO.createPurchase(purchaseAdd);
                response.sendRedirect(request.getContextPath() + "purchase");
                break;
            case "DELETE":
                int purchaseId = Integer.parseInt(request.getParameter("purchaseId"));
                Purchase purchaseDelete = purchaseDAO.getPurchaseById(purchaseId);
                if (purchaseDelete != null) {
                    purchaseDAO.deletePurchase(purchaseId);
                    response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                    response.sendRedirect(request.getContextPath() + "purchase");
                } else {
                    request.setAttribute("error", "Purchase not found");
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    response.sendRedirect("error.jsp");
                }
                break;
        }

    }
}
