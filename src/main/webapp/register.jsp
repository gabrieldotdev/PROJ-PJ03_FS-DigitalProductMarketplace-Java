<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // check if user is already logged in
    if (session.getAttribute("user") != null) {
        response.sendRedirect("/");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
</head>
<jsp:include page="includes/header.jsp"/>
<body>
<h1>Đăng ký</h1>
<% if (request.getParameter("error") != null) { %>
<p style="color: red;"><%= request.getParameter("error") %></p>
<% } %>
<form action="register" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <label for="confirm_password">Confirm Password:</label>
    <input type="password" id="confirm_password" name="confirm_password" required><br>
    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required><br>
    <label for="location">Location:</label>
    <input type="text" id="location" name="location" required><br>
    <input type="submit" value="Register">
</form>
</body>
<jsp:include page="includes/footer.jsp"/>

</html>
