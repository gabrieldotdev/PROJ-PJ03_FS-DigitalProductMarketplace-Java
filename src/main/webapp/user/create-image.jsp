<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Image</title>
</head>
<body>
<h1>Create Image</h1>
<form method="POST" action="" enctype="multipart/form-data">
    <input type="hidden" name="action" value="create">
    <div class="form-group">
        <label for="title">Title</label>
        <input type="text" class="form-control" id="title" name="title" required>
    </div>
    <div class="form-group">
        <label for="description">Description</label>
        <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
    </div>
    <div class="form-group">
        <label for="price">Price</label>
        <input type="number" class="form-control" id="price" name="price" step="0.01" min="0" required>
    </div>
    <div class="form-group">
        <label for="file">Select an image to upload</label>
        <input type="file" class="form-control-file" id="file" name="file" accept="image/*" required>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>
