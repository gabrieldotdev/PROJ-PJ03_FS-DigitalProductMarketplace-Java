<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Images</title>
</head>
<body>
<h1>My Images</h1>
<table>
  <thead>
  <tr>
    <th>Title</th>
    <th>Description</th>
    <th>Price</th>
    <th>Image</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${images}" var="image" >
    <tr>
      <td><a href="<c:url value="/image?id=${image.id}"/>">${image.title}</a></td>
      <td>${image.description}</td>
      <td>${image.price}</td>
      <td><img src="${image.filePath}" style="height: 50px"></td>
      <td>
        <a href="<c:url value="/user/images?action=edit&id=${image.id}"/>">Edit</a>
        <form method="post" action="<c:url value="/user/images"/>">
          <input type="hidden" name="id" value="${image.id}" />
          <input type="hidden" name="action" value="delete" />
          <button type="submit">Delete</button>
        </form>

      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<p>
  <a href="<c:url value="/user/images?action=create"/>">Create Image</a>
</p>
</body>
</html>
