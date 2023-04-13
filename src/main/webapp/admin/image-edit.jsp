<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Image-edit</title>
</head>
<body>
<h1>Edit hình ảnh</h1>
<form action="${pageContext.request.contextPath}/admin/image-list?command=UPDATE" method="POST">
    <input type="hidden" name="id" value="${image.id}"/>
    <label for="title">Title:</label>
    <input type="text" name="title" value="${image.title}"/><br>
    <label for="file_path">File Path:</label>
    <input type="text" name="file_path" value="${image.filePath}"/><br>
    <label for="description">Description:</label>
    <textarea name="description">${image.description}</textarea><br>
    <label for="price">Price:</label>
    <input type="text" name="price" value="${image.price}"/><br>
    <input type="submit" value="Save"/>
</form>

</body>
</html>
