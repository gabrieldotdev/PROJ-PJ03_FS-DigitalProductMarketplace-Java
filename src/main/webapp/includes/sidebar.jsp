<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
    $(document).ready(function () {
        // Show Sidebar Icon and Title
        // $('#sidebar-icon').show();
        $('#sidebar-home').hide();
        $('#sidebar-about').hide();
        $('#sidebar-admin').hide();
        $('#sidebar-create').hide();
        $('#sidebar-album').hide();

        // Hide Sidebar by Default
        $('#sidebar').addClass('hidden lg:block');

        // Toggle Sidebar on Button Click
        $('#sidebar-toggle').click(function () {
            $('#sidebar').toggleClass('min-w-[16rem]');
            $('#sidebar-home').toggle();
            $('#sidebar-about').toggle();
            $('#sidebar-admin').toggle();
            $('#sidebar-create').toggle();
            $('#sidebar-album').toggle();
        });
    });
</script>

<aside id="sidebar" class="mt-4 border-r border-slate-900/10 px-8 py-2">
    <!-- Sidebar content here -->
    <div class="h-full">
        <ul>
            <li>
                <a href="<c:url value="/"/>" class="group mb-4 flex items-center font-semibold text-indigo-500 lg:text-sm lg:leading-6">
                    <lord-icon src="https://cdn.lordicon.com/osuxyevn.json" trigger="hover" class="h-6 w-6"> </lord-icon>
                    <span id="sidebar-home" class="ml-4">Trang chủ </span>
                </a>
            </li>
            <li>
                <a href="<c:url value="/purchase"/>" class="group mb-4 flex items-center font-semibold text-slate-800 hover:text-indigo-500 lg:text-sm lg:leading-6">
                    <lord-icon src="https://cdn.lordicon.com/hyhnpiza.json" trigger="hover" class="h-6 w-6"> </lord-icon>
                    <span id="sidebar-about" class="ml-4">Giả hàng</span>
                </a>
            </li>
            <li>
                <a href="<c:url value="/admin"/>" class="group mb-4 flex items-center font-semibold text-slate-800 hover:text-indigo-500 lg:text-sm lg:leading-6">
                    <lord-icon src="https://cdn.lordicon.com/uiakkykh.json" trigger="hover" class="h-6 w-6"> </lord-icon>

                    <span id="sidebar-admin" class="ml-4">Quản lý hệ thống</span>
                </a>
            </li>
            <li>
                <a href="<c:url value="/user/images?action=create"/>" class="group mb-4 flex items-center font-semibold text-slate-800 hover:text-indigo-500 lg:text-sm lg:leading-6">
                    <lord-icon src="https://cdn.lordicon.com/wfadduyp.json" trigger="hover" class="h-6 w-6"> </lord-icon>

                    <span id="sidebar-create" class="ml-4">Thêm ảnh mới</span>
                </a>
            </li>
            <li>
                <a href="<c:url value="/user/albums?action=create"/>" class="group mb-4 flex items-center font-semibold text-slate-800 hover:text-indigo-500 lg:text-sm lg:leading-6">
                    <lord-icon src="https://cdn.lordicon.com/fpmskzsv.json" trigger="hover" class="h-6 w-6"> </lord-icon>
                    <span id="sidebar-album" class="ml-4">Tạo album mới</span>
                </a>
            </li>
        </ul>
    </div>
</aside>