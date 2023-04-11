<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image Gallery</title>
</head>
<jsp:include page="includes/header.jsp"/>
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
            <td><a href="<c:url value="/view/image?id=${image.id}"/>"> Xem ảnh: ${image.id}</a></td>
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
        <th>Thumb</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${albums}" var="album">
        <tr>
            <td><a href="<c:url value="/view/album?albumId=${album.id}"/>">Xem Album ${album.id}</a></td>
            <td>${album.user_id}</td>
            <td>${album.title}</td>
            <td>${album.description}</td>
            <td>${album.price}</td>
            <td>${album.created_at}</td>
            <td>${album.updated_at}</td>
            <td><img src="${album.file_path}"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<jsp:include page="includes/footer.jsp"/>
</html>