<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <title>Image Gallery</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <jsp:include page="includes/sidebar.jsp"/>
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen h-screen">
                <jsp:include page="components/category.jsp"/>
                <jsp:include page="components/album.jsp"/>
                <jsp:include page="components/topic.jsp"/>
                <jsp:include page="components/product-list.jsp"/>
            </div>
        </div>
    </main>

</div>

<script>
    ScrollReveal().reveal('.columns-3xs', { delay: 1000 });
    ScrollReveal().reveal('body', { delay: 500 });
</script>
<script>
    $(document).ready(function () {
        $('#myDiscover').click(function () {
            $('#myBox_Discover').toggleClass('hidden');
        });
        $('#myAvatar').click(function () {
            $('#myBox_Avatar').toggleClass('hidden');
        });
        $('#myProducts').hover(function () {
            $('#myBox_Products').toggleClass('hidden');
        });
        $('#close-banner').click(function () {
            $('#myBanner').toggleClass('hidden block');
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Show Sidebar Icon and Title
        // $('#sidebar-icon').show();
        $('#sidebar-home').hide();
        $('#sidebar-about').hide();
        $('#sidebar-admin').hide();

        // Hide Sidebar by Default
        $('#sidebar').addClass('hidden lg:block');

        // Toggle Sidebar on Button Click
        $('#sidebar-toggle').click(function () {
            $('#sidebar').toggleClass('min-w-[16rem]');
            $('#sidebar-home').toggle();
            $('#sidebar-about').toggle();
            $('#sidebar-admin').toggle();
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('#myButton').click(function () {
            $('#myElement').removeClass('hidden');
        });
        $('#closeButton').click(function () {
            $('#myElement').addClass('hidden');
        });
        $('#closeElement').click(function () {
            $('#myElement').addClass('hidden');
        });
    });
</script>
<%--<h1>Image Gallery</h1>--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>User ID</th>--%>
<%--        <th>Title</th>--%>
<%--        <th>File Path</th>--%>
<%--        <th>Description</th>--%>
<%--        <th>Price</th>--%>
<%--        <th>Created At</th>--%>
<%--        <th>Updated At</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach items="${images}" var="image">--%>
<%--        <tr>--%>
<%--            <td><a href="<c:url value="/view/image?id=${image.id}"/>"> Xem ảnh: ${image.id}</a></td>--%>
<%--            <td>${image.user_id}</td>--%>
<%--            <td>${image.title}</td>--%>
<%--            <td>${image.file_path}</td>--%>
<%--            <td>${image.description}</td>--%>
<%--            <td>${image.price}</td>--%>
<%--            <td>${image.created_at}</td>--%>
<%--            <td>${image.updated_at}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--<h1>ALBUM Gallery</h1>--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>User ID</th>--%>
<%--        <th>Title</th>--%>
<%--        <th>Description</th>--%>
<%--        <th>Price</th>--%>
<%--        <th>Created At</th>--%>
<%--        <th>Updated At</th>--%>
<%--        <th>Thumb</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach items="${albums}" var="album">--%>
<%--        <tr>--%>
<%--            <td><a href="<c:url value="/view/album?albumId=${album.id}"/>">Xem Album ${album.id}</a></td>--%>
<%--            <td>${album.user_id}</td>--%>
<%--            <td>${album.title}</td>--%>
<%--            <td>${album.description}</td>--%>
<%--            <td>${album.price}</td>--%>
<%--            <td>${album.created_at}</td>--%>
<%--            <td>${album.updated_at}</td>--%>
<%--            <td><img src="${album.file_path}"></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
</body>
</html>