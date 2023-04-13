<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LilWxs
  Date: 4/14/2023
  Time: 2:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <title>Tìm kiếm</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="p-10">
  <section class="rounded-xl bg-white py-6 sm:py-8 lg:py-12">
    <div class="mx-auto flex flex-col justify-center px-4 md:px-8 xl:mx-80">
      <a href="<c:url value="/"/>" class="mb-8 inline-flex items-center gap-2.5 text-2xl font-bold text-indigo-500 md:text-3xl" aria-label="logo"> ART|GROUP </a>

      <form class="flex items-center justify-between gap-4">
        <div class="flex flex-1 cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10 backdrop-blur">
          <lord-icon src="https://cdn.lordicon.com/qjdnqpiz.json" trigger="loop" class="h-6 w-6"> </lord-icon>
          <input type="text" class="ml-2 w-full outline-none" placeholder="Tìm kiếm..." />
        </div>
        <lord-icon src="https://cdn.lordicon.com/nhfyhmlt.json" trigger="loop" class="h-6 w-6"> </lord-icon>
      </form>
    </div>
  </section>
  <section class="mt-4 rounded-xl bg-white p-4 py-6">
    <!-- <div class="flex justify-center px-4 md:px-8 xl:mx-80">
        <p href="/" class="items-center gap-2.5 text-2xl font-semibold text-indigo-300 md:text-3xl" aria-label="logo">Không có kết quả tìm kiếm</p>
    </div> -->
    <div class="flex-none">
      <!-- Gợi ý text -->
      <div class="flex items-center justify-between sm:mb-2 lg:mb-4">
        <div class="flex items-center gap-x-2">
          <p class="text-md font-medium text-indigo-400">Kết quả tìm kiếm</p>
          <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-xs font-medium leading-5 text-indigo-600">Mới</span>
        </div>
        <div class="flex gap-x-2">
          <p class="text-md font-medium text-slate-500">...</p>
        </div>
      </div>
      <!-- Gợi ý text - End -->
      <div class="columns-3 gap-2">
        <figure v-for="image in images" class="cursor-pointer py-2 [break-inside:avoid]">
          <div class="group relative overflow-hidden rounded-xl">
            <img
                    class="object-cover object-center transition duration-200 group-hover:scale-110"
                    src="https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
                    alt=""
            />
            <div class="absolute inset-0 hidden items-end justify-between px-4 py-3 group-hover:block">
              <div class="flex flex-col items-center text-white">
                <p class="text-sm font-bold">Tên ảnh</p>
                <p class="text-xs">by Wlop</p>
              </div>
            </div>
          </div>
        </figure>
      </div>
    </div>
  </section>
</div>
</body>
</html>
