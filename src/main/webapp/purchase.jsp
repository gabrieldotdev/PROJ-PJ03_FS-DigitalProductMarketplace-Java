<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Giỏ hàng của bạn</title>
</head>
<body>
<c:choose>
    <c:when test="${empty purchases}">
        <p>Không có mặt hàng nào trong giỏ hàng của bạn.</p>
    </c:when>
    <c:otherwise>
        <h1>Giỏ hàng của bạn</h1>
        <c:forEach items="${purchases}" var="purchase" varStatus="status">
            <c:if test="${not empty purchase.image}">
                <p>Hình ảnh của: ${purchase.image.user.username}</p>
                <p>Tên hình ảnh: ${purchase.image.title}</p>
                <p>Mô tả: ${purchase.image.description}</p>
                <p>Giá tiền: ${purchase.image.price}</p>
                <img src="${purchase.image.filePath}">
            </c:if>
            <c:if test="${not empty purchase.album}">
                <p>Album của: ${purchase.album.user.username}</p>
                <p>Tên album: ${purchase.album.title}</p>
                <p>Mô tả: ${purchase.album.description}</p>
                <p>Giá tiền: ${purchase.album.price}</p>
                <img src="${albumCoverImages[status.index].getFilePath()}">
            </c:if>
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>