<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="<c:url value="/user/images"/>">
    <input type="hidden" name="action" value="update" />
    <input type="hidden" name="id" value="${image.id}" />

    <img src="${image.filePath}">
    <label for="title">Title:</label>
    <input type="text" name="title" id="title" value="${image.title}" />

    <label for="description">Description:</label>
    <textarea name="description" id="description">${image.description}</textarea>

    <label for="price">Price:</label>
    <input type="number" name="price" id="price" min="0" step="0.01" value="${image.price}" />
    <p> Ngày tạo: ${image.createdAt}</p>
    <button type="submit">Save Changes</button>
</form>
</body>
</html>
