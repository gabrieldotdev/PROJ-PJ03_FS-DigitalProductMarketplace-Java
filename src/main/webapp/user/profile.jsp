<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>User Profile</title>
</head>
<body>
<jsp:include page="/includes/header.jsp"/>
<div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
    <div class="px-4 py-6 sm:px-0">
        <h1 class="text-2xl font-bold mb-2">User Profile</h1>
        <c:if test="${user != null}">
            <p><strong>Username:</strong> ${user.username}</p>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Phone:</strong> ${user.phone}</p>
            <p><strong>Location:</strong> ${user.location}</p>
            <p><strong>Created At:</strong> ${user.created_at}</p>
            <p><strong>Updated At:</strong> ${user.updated_at}</p>
        </c:if>
        <c:if test="${user == null}">
            <p>User not found.</p>
        </c:if>
    </div>
</div>
<jsp:include page="/includes/footer.jsp"/>
</body>
</html>
