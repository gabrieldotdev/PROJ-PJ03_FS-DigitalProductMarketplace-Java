<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image Gallery</title>
</head>
<body>
<h1>Image Gallery</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Title</th>
        <th>File Path</th>
        <th>Description</th>
        <th>Price</th>
        <th>Created At</th>
        <th>Updated At</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${images}" var="image">
        <tr>
            <td>${image.id}</td>
            <td>${image.user_id}</td>
            <td>${image.title}</td>
            <td>${image.file_path}</td>
            <td>${image.description}</td>
            <td>${image.price}</td>
            <td>${image.created_at}</td>
            <td>${image.updated_at}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<h1>ALBUM Gallery</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Price</th>
        <th>Created At</th>
        <th>Updated At</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${albums}" var="image">
        <tr>
            <td>${image.id}</td>
            <td>${image.user_id}</td>
            <td>${image.title}</td>
            <td>${image.description}</td>
            <td>${image.price}</td>
            <td>${image.created_at}</td>
            <td>${image.updated_at}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>