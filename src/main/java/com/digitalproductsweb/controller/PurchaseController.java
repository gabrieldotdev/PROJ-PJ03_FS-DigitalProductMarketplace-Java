package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.PurchaseDAO;
import com.digitalproductsweb.model.Purchase;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

public class PurchaseController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PurchaseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PurchaseController at " +
                    request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "ADD":
                    addPurchase(request, response);
                    break;
                case "LOAD":
                    getById(request, response);
                    break;
                case "DELETE":
                    deletePurchase(request, response);
                    break;
                case "LIST":
                default:
                    listPurchase(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }

    private void listPurchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        request.setAttribute("LIST_PURCHASE", purchaseDAO.getAllPurchases());
        request.getRequestDispatcher("/purchase-list.jsp").forward(request, response);
    }
    private void addPurchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        int image_id = Integer.parseInt(request.getParameter("image_id"));
        int album_id = Integer.parseInt(request.getParameter("album_id"));
        Date created_at = new Date(System.currentTimeMillis());
        Purchase purchase = new Purchase(user_id, image_id, album_id, created_at);
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        purchaseDAO.createPurchase(purchase);
        listPurchase(request, response);
    }

    private void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        request.setAttribute("PURCHASE", purchaseDAO.getPurchaseById(id));
        request.getRequestDispatcher("/purchase-form.jsp").forward(request, response);
    }

    private void deletePurchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        purchaseDAO.deletePurchase(id);
        listPurchase(request, response);
    }
}
