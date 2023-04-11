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
import java.sql.Date;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // check password
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        if (!password.equals(confirm_password)) {
            response.sendRedirect("register.jsp?error=Passwords do not match");
            return;
        }
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setPhone(request.getParameter("phone"));
        user.setLocation(request.getParameter("location"));
        Date created_at = new Date(System.currentTimeMillis());
        Date updated_at = new Date(System.currentTimeMillis());
        user.setCreated_at(created_at);
        user.setUpdated_at(updated_at);

        UserDAO userDAO = new UserDAO();
        if (userDAO.usernameExists(user.getUsername())) {
            response.sendRedirect("register.jsp?error=Username already exists");
            return;
        }
        if (userDAO.emailExists(user.getEmail())) {
            response.sendRedirect("register.jsp?error=Email already exists");
            return;
        }
        userDAO.createUser(user);
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        response.sendRedirect("/");
    }
}
