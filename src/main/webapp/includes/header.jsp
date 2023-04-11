<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.digitalproductsweb.model.User" %>
<html>
<head>
    <title>Header nè</title>
</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user != null) {
%>
<h1>Chào mừng <%=user.getUsername()%> đến với trang web của chúng tôi</h1>
<form action="logout" method="post">
    <input type="submit" value="Đăng xuất">
<%
} else {
%>
<h1>Chào mừng bạn đến với trang web của chúng tôi</h1>
    <a href="<c:url value="/login"/>">Đăng nhập</a>
<%
    }
%>

</body>
</html>
