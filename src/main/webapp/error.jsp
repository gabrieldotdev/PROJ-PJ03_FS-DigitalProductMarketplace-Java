<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% if (request.getParameter("message") != null) { %>
<p style="color: red;"><%= request.getParameter("error") %></p>
<% } %>
<h1>Trang lỗi</h1>
</body>
</html>
