package com.digitalproductsweb.Filter;

import com.digitalproductsweb.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AdminFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext context = filterConfig.getServletContext();
        context.log("AuthenticationFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        } else {
            User user = (User) session.getAttribute("user");
            if (!user.isAdmin()) {
                req.setAttribute("message", "You are not authorized to access this page");
                req.getRequestDispatcher("/error.jsp").forward(req, res);
                return;
            }
        }
        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}
