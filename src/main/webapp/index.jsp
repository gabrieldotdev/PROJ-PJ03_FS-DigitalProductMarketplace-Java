<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
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
</body>
</html>