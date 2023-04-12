<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.digitalproductsweb.model.User" %>

<%
    // Check user logged
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("/");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <title>Đăng nhập</title>
</head>
<body>

<div class="flex min-h-screen items-center bg-gray-50 p-6">
    <div class="mx-auto h-full max-w-5xl flex-1 overflow-hidden rounded-lg bg-white shadow-xl">
        <div class="flex flex-col overflow-y-auto md:flex-row">
            <div class="relative flex items-center justify-center overflow-hidden rounded-xl md:w-1/2">
                <lord-icon
                        src="https://cdn.lordicon.com/lzwckydi.json"
                        trigger="loop"
                        colors="primary:#e5d1fa,secondary:#121331,tertiary:#ffc738,quaternary:#2ca58d,quinary:#f24c00"
                        stroke="30"
                        style="width: 30rem; height: 30rem"
                >
                </lord-icon>
            </div>
            <form action="login" method="POST" class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">
                <div class="w-full">
                    <h1 class="mb-4 text-xl font-bold text-indigo-700">Đăng nhập</h1>
                    <% if (request.getParameter("error") != null) { %>
                    <p style="color: red;"><%= request.getParameter("error") %></p>
                    <% } %>
                    <label class="block text-sm">
                        <span class="font-semibold text-gray-700">Username</span>
                        <input
                                name="username" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="tester"
                        />
                    </label>
                    <label class="mt-4 block text-sm font-semibold">
                        <span class="text-gray-700">Mật khẩu</span>
                        <input
                                name="password" required
                                class="focus:shadow-outline-gray mt-4 flex w-full items-center justify-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium leading-5 text-gray-700 transition-colors duration-150 hover:border-gray-500 focus:border-gray-500 focus:outline-none active:text-gray-500"
                                placeholder="123456"
                                type="password"
                        />
                    </label>

                    <!-- You should use a button here, as the anchor is only used for the example  -->
                    <button
                            type="submit"
                            class="focus:shadow-outline-purple mt-4 block w-full rounded-lg border border-transparent bg-indigo-600 px-4 py-2 text-center text-sm font-medium leading-5 text-white transition-colors duration-150 hover:bg-indigo-700"
                    >
                        Đăng nhập
                    </button>

                    <hr class="my-8" />

                    <p class="mt-1">
                        <a class="text-sm font-medium text-purple-600 hover:underline" href="#"> Tôi thật lú lẫn - Quên mật khẩu? </a>
                    </p>
                    <p class="mt-1">
                        <a class="text-sm font-medium text-purple-600 hover:underline" href="register.jsp"> Tạo tài khoản </a>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
