<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <title>Trang chủ</title>
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
                <jsp:include page="components/albumList.jsp"/>
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
</body>
</html>