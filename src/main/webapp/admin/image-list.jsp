<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Image List</title>
</head>
<body>
<h1>Image List</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Price</th>
        <th>Description</th>
        <th>Image</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="image" items="${images}">
        <tr>
            <td>${image.id}</td>
            <td>${image.title}</td>
            <td>${image.price}</td>
            <td>${image.description}</td>
            <td><img src="${image.file_path}" height="100" /></td>
            <td>
                <c:url var="editLink" value="/admin/image-list">
                    <c:param name="command" value="LOAD"/>
                    <c:param name="id" value="${image.id}"/>
                </c:url>
                <a href="${editLink}">Edit</a>

                <c:url var="deleteLink" value="/admin/image-list">
                    <c:param name="command" value="DELETE"/>
                    <c:param name="id" value="${image.id}"/>
                </c:url>
                <a href="${deleteLink}" onclick="if(!(confirm('Sure?'))) return false">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
