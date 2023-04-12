<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // check if user is already logged in
    if (session.getAttribute("user") != null) {
        response.sendRedirect("/");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Đăng ký</title>
</head>
<body>
<%--<h1>Đăng ký</h1>--%>
<%--<% if (request.getParameter("error") != null) { %>--%>
<%--<p style="color: red;"><%= request.getParameter("error") %></p>--%>
<%--<% } %>--%>
<%--<form action="register" method="post">--%>
<%--    <label for="username">Username:</label>--%>
<%--    <input type="text" id="username" name="username" required><br>--%>

<%--    <label for="email">Email:</label>--%>
<%--    <input type="email" id="email" name="email" required><br>--%>

<%--    <label for="phone">Phone:</label>--%>
<%--    <input type="text" id="phone" name="phone" required><br>--%>

<%--    <label for="location">Location:</label>--%>
<%--    <input type="text" id="location" name="location" required><br>--%>

<%--    <input type="submit" value="Register">--%>
<%--</form>--%>
<%--<jsp:include page="includes/footer.jsp"/>--%>
<div class="flex min-h-screen items-center bg-gray-50 p-6">
    <div class="mx-auto h-full max-w-5xl flex-1 overflow-hidden rounded-lg bg-white shadow-xl">
        <form action="register" method="POST" class="flex flex-col overflow-y-auto md:flex-row">
            <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
                <div class="w-full">
                    <h1 class="mb-4 text-xl font-bold text-indigo-700">Đăng ký</h1>
                    <label class="block text-sm">
                        <span class="font-semibold text-gray-700">Username</span>
                        <input
                                name="username" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="tester"
                        />
                    </label>
                    <label class="mt-4 block text-sm">
                        <span class="font-semibold text-gray-700">Email</span>
                        <input
                                name="email" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="email@uda.vn"
                        />
                    </label>
                    <label class="mt-4 block text-sm">
                        <span class="font-semibold text-gray-700">Số điện thoại</span>
                        <input
                                name="phone" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="0123******"
                        />
                    </label>
                    <label class="mt-4 block text-sm">
                        <span class="font-semibold text-gray-700">Địa chỉ</span>
                        <input
                                name="location" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="Việt Nam"
                        />
                    </label>
                </div>
            </div>
            <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
                <div class="w-full">
                    <label class="block text-sm font-semibold">
                        <span class="text-gray-700">Mật khẩu</span>
                        <input
                                name="password" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="******"
                                type="password"
                        />
                    </label>
                    <label class="mt-4 block text-sm font-semibold">
                        <span class="text-gray-700">Nhập lại mật khẩu</span>
                        <input
                                name="confirm_password" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="******"
                                type="password"
                        />
                    </label>

                    <!-- You should use a button here, as the anchor is only used for the example  -->
                    <button
                            type="submit"
                            class="focus:shadow-outline-purple mt-4 block w-full rounded-lg border border-transparent bg-indigo-600 px-4 py-2 text-center text-sm font-medium leading-5 text-white transition-colors duration-150 hover:bg-indigo-700"
                    >
                        Đăng ký
                    </button>

                    <hr class="my-8" />

                    <p class="mt-1">
                        <a class="text-sm font-medium text-purple-600 hover:underline" href="#"> Đã có tài khoản </a>
                    </p>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
