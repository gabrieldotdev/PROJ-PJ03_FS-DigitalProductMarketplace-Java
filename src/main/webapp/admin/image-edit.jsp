<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Image-edit</title>
</head>
<body>
<h1>Edit hình ảnh</h1>
<form action="${pageContext.request.contextPath}/admin/image-list?command=UPDATE" method="POST">
    <input type="hidden" name="id" value="${id}"/>
    <input type="text" name="title" value="${title}"/><br>
    <label for="title">Title:</label>
    <label for="file_path">File Path:</label>
    <input type="text" name="file_path" value="${file_path}"/><br>
    <label for="description">Description:</label>
    <textarea name="description">${description}</textarea><br>
    <label for="price">Price:</label>
    <input type="text" name="price" value="${price}"/><br>
    <input type="submit" value="Save"/>
</form>

</body>
</html>
