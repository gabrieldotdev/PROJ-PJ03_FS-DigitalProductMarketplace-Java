<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.digitalproductsweb.model.User" %>

<%
    // Check user logged
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("/");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
</head>
<jsp:include page="includes/header.jsp"/>
<body>
<h1>Login Page</h1>
<form action="login" method="post">
    <% if (request.getParameter("error") != null) { %>
    <p style="color: red;"><%= request.getParameter("error") %></p>
    <% } %>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <input type="submit" value="Login">
</form>
</body>
<jsp:include page="includes/footer.jsp"/>

</html>
