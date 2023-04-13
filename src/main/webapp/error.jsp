<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <title>Title</title>
</head>
<body>
<<<<<<< Updated upstream
<% if (request.getParameter("message") != null) { %>
<p style="color: red;"><%= request.getParameter("error") %></p>
<% } %>
<div class="bg-white py-6 sm:py-8 lg:py-12">
    <div class="mx-auto max-w-screen-2xl px-4 md:px-8">
        <div class="flex flex-col items-center">
            <!-- logo - start -->
            <a href="/" class="mb-8 inline-flex items-center gap-2.5 text-2xl font-bold text-indigo-500 md:text-3xl" aria-label="logo"> ART|GROUP </a>
            <!-- logo - end -->

            <lord-icon src="https://cdn.lordicon.com/qjdnqpiz.json" trigger="loop" class="h-20 w-20"> </lord-icon>
            <h1 class="mb-2 text-center text-2xl font-bold text-gray-800 md:text-3xl">Không thể truy cập</h1>

            <p class="mb-12 max-w-screen-md text-center text-gray-500 md:text-lg">Vì một số lý do nên bạn không thể truy cập tiếp.</p>

            <a
                    href="#"
                    class="inline-block rounded-lg bg-gray-200 px-8 py-3 text-center text-sm font-semibold text-gray-500 outline-none ring-indigo-300 transition duration-100 hover:bg-gray-300 focus-visible:ring active:text-gray-700 md:text-base"
            >Quay lại</a
            >
        </div>
    </div>
</div>
=======
<%--<h1>Trang lỗi</h1>--%>
<h1>ERROR PAGE</h1>
<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>
>>>>>>> Stashed changes
</body>
</html>
