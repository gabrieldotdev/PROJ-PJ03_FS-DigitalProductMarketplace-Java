<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<br/>
<div id="wrapper">
    <div id="header">
        <h1>Home page</h1>
        <h1>${images}</h1>
    </div>
</div>
<div id="container">
    <div id="content">
        <table border="1">
            <thead>
            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Title</th>
                <th>File_path</th>
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
    </div>
</div>
</body>
</html>