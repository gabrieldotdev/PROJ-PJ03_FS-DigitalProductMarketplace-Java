<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.digitalproductsweb.model.User" %>

<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<%
    User user = (User) request.getSession().getAttribute("user");
%>

<header class="sticky top-0 z-40 w-full backdrop-blur transition-colors duration-500 lg:border-b lg:border-slate-900/10">
    <!-- Header content here -->

    <div class="mx-4 border-b border-slate-900/10 py-4 lg:mx-0 lg:border-0 lg:px-8">
        <div class="relative flex items-center">
            <!-- LEFT -->
            <button id="sidebar-toggle" type="menu" class="mr-4 hidden cursor-pointer lg:flex">
                <lord-icon src="https://cdn.lordicon.com/ofwpzftr.json" trigger="hover" class="h-6 w-6"></lord-icon>
            </button>
            <a class="text-md mr-3 flex-none font-bold leading-6 text-indigo-500 md:w-auto" href="/"> Lil Wxs |
                Blogs </a>
            <!-- discoverDropdown -->
            <div class="relative">
                <button id="myDiscover"
                        class="flex items-center space-x-2 rounded-full bg-slate-400/10 px-3 py-1 text-xs font-semibold leading-5 hover:bg-slate-400/20"
                        type="button">
                    Khám phá
                    <svg width="6" height="3" class="ml-2 overflow-visible" aria-hidden="true">
                        <path d="M0 0L3 3L6 0" fill="none" stroke="currentColor" stroke-width="1.5"
                              stroke-linecap="round"></path>
                    </svg>
                </button>
                <div id="myBox_Discover"
                     class="absolute left-1/2 z-10 mt-5 flex hidden w-screen max-w-max -translate-x-1/3 px-4">
                    <div class="max-w-md flex-auto overflow-hidden rounded-3xl bg-white text-sm leading-6 shadow-lg ring-1 ring-gray-900/5">
                        <div class="p-4">
                            <div class="group relative flex items-center gap-x-6 rounded-lg px-4 py-2 hover:bg-gray-50">
                                <div class="flex h-10 w-10 flex-none items-center justify-center rounded-lg bg-gray-50 group-hover:bg-white">
                                    <!-- SVG -->
                                </div>
                                <div>
                                    <a href="#" class="font-semibold text-gray-900">
                                        Chế độ sáng
                                        <span class="absolute inset-0"></span>
                                    </a>
                                    <p class="mt-1 text-gray-600">Get a better</p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid-cols-2 divide-x divide-gray-900/5 bg-gray-50">
                            <a href="#"
                               class="flex items-center justify-center gap-x-2.5 p-3 font-semibold text-gray-900 hover:bg-gray-100">
                                <svg class="h-5 w-5 flex-none text-gray-400" viewBox="0 0 20 20" fill="currentColor"
                                     aria-hidden="true">
                                    <path
                                            fill-rule="evenodd"
                                            d="M2 10a8 8 0 1116 0 8 8 0 01-16 0zm6.39-2.908a.75.75 0 01.766.027l3.5 2.25a.75.75 0 010 1.262l-3.5 2.25A.75.75 0 018 12.25v-4.5a.75.75 0 01.39-.658z"
                                            clip-rule="evenodd"
                                    ></path>
                                </svg>
                                Xem tất cả
                            </a>
                            <a href="#"
                               class="flex items-center justify-center gap-x-2.5 p-3 font-semibold text-gray-900 hover:bg-gray-100">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                     stroke-width="1.5" stroke="currentColor" class="h-5 w-5 flex-none text-gray-500">
                                    <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z"></path>
                                </svg>
                                Cửa hàng
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- searchBtn -->
            <div
                    id="myButton"
                    class="ml-3 hidden cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10 backdrop-blur xl:flex"
            >
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="h-4 w-4">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/>
                </svg>
                <span class="ml-2">Tìm kiếm...</span>
                <span class="ml-2 flex-none text-xs font-semibold">Ctrl K</span>
            </div>
            <!-- searchModel -->

            <!-- ... -->
            <!-- RIGHT -->
            <div class="relative ml-auto hidden items-center lg:flex">
                <nav class="text-sm font-semibold leading-6 text-slate-700">
                    <ul class="flex items-center space-x-4">
                        <li>
                            <a class="flex items-center gap-2 hover:text-indigo-500" href="#">
                                <lord-icon src="https://cdn.lordicon.com/tyvtvbcy.json" trigger="loop"
                                           class="h-6 w-6"></lord-icon>
                                Chào mừng <%
                                if (user != null) {
                            %>
                                <%=user.getUsername()%>, cùng khám phá theo cách của bạn!
                                <%
                                } else {
                                %>
                                <span>to website</span>
                                <%
                                    } %>
                            </a>
                        </li>
                        <li>
                            <a class="flex items-center gap-2 hover:text-indigo-500" href="#">
                                <lord-icon src="https://cdn.lordicon.com/fsghhhtr.json" trigger="hover"
                                           class="h-6 w-6"></lord-icon>
                                Blog
                            </a>
                        </li>
                    </ul>
                </nav>
                <a href="#" class="ml-4 flex items-center text-slate-400 hover:text-slate-500">
                    <lord-icon src="https://cdn.lordicon.com/psnhyobz.json" trigger="hover" class="h-6 w-6"></lord-icon>
                </a>
                <a href="<c:url value="/purchase"/>" class="mx-2 flex items-center text-slate-400 hover:text-slate-500">
                    <lord-icon src="https://cdn.lordicon.com/hyhnpiza.json" trigger="hover" class="h-6 w-6"></lord-icon>
                    <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-xs font-medium leading-5 text-indigo-600">1</span>
                </a>
                <%
                    if (user != null) {
                %>
                <form action="logout" method="POST">
                    <div class="ml-2 flex items-center border-l border-slate-200">
                        <div class="relative" data-headlessui-state="">
                            <button type="button"
                                    class="ml-4 mr-2 flex items-center text-slate-400 hover:text-slate-500">
                                <lord-icon src="https://cdn.lordicon.com/bhfjfgqz.json" trigger="hover"
                                           class="h-6 w-6"></lord-icon>
                            </button>
                        </div>
                        <button type="submit" class="flex items-center">
                            <lord-icon src="https://cdn.lordicon.com/bewubbww.json" trigger="hover"
                                       class="h-6 w-6"></lord-icon>
                        </button>
                    </div>
                </form>
                <%
                } else {
                %>
                <a class="ml-4 text-sm font-semibold leading-6 hover:text-indigo-500" href="<c:url value="/login"/>">Đăng
                    nhập</a>
                <%
                    }
                %>

            </div>
            <!-- MOBILE -->
            <button type="button"
                    class="-my-1 ml-auto flex h-8 w-8 items-center justify-center text-slate-500 hover:text-slate-600 lg:hidden">
                <span class="sr-only">Search</span>
                <lord-icon src="https://cdn.lordicon.com/xfftupfv.json" trigger="hover" class="h-6 w-6"></lord-icon>
            </button>
            <div class="-my-1 ml-2 lg:hidden">
                <button type="button"
                        class="flex h-8 w-8 items-center justify-center text-slate-500 hover:text-slate-600">
                    <lord-icon src="https://cdn.lordicon.com/hwuyodym.json" trigger="hover" class="h-6 w-6"></lord-icon>
                </button>
            </div>
            <!-- MOBILE-END -->
        </div>
    </div>
    <!-- Header mobile reponsive -->
    <div class="flex items-center border-b border-slate-900/10 p-4 lg:hidden">
        <button type="button" class="flex items-center text-slate-500 hover:text-slate-600">
            <lord-icon src="https://cdn.lordicon.com/ofwpzftr.json" trigger="hover" class="h-6 w-6"></lord-icon>
        </button>
        <ol class="ml-4 flex min-w-0 whitespace-nowrap text-sm leading-6">
            <li class="flex items-center">
                Trang cá nhân
                <svg width="3" height="6" aria-hidden="true" class="mx-3 overflow-visible text-slate-400">
                    <path d="M0 0L3 3L0 6" fill="none" stroke="currentColor" stroke-width="1.5"
                          stroke-linecap="round"></path>
                </svg>
            </li>
            <li class="truncate font-semibold text-slate-900">Chỉnh sửa thông tin</li>
        </ol>
    </div>
</header>


