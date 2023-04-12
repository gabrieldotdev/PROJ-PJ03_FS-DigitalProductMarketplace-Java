package com.digitalproductsweb.controller;

import com.digitalproductsweb.DAO.UserDAO;
import com.digitalproductsweb.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        UserDAO userDAO = new UserDAO();
        User user1 = userDAO.login(user);

        if (user1 != null) {
            // save to session
            HttpSession session = req.getSession();
            session.setAttribute("user", user1);
            resp.sendRedirect("/");
        } else {
            resp.sendRedirect("login?error=Invalid login credentials");
        }
    }
}
