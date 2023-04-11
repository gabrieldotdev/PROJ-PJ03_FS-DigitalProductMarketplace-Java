<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>View Album</title>
</head>
<body>
<h1>${album.title}</h1>
<p>${album.description}</p>

<h2>Images</h2>
<c:forEach var="image" items="${images}">
  <div>
    <img src="${image.file_path}" height="100"/>
    <p>${image.title}</p>
  </div>
</c:forEach>

</body>
</html>
