<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <title>Tạo album mới</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="/includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <jsp:include page="/includes/sidebar.jsp"/>
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen">
                <%-- CREATE-IMAGE--%>
                <div class="mt-6 max-w-full">
                    <!-- Main PRODUCTS -->
                    <form class="flex justify-between gap-4 rounded-xl bg-white p-5" method="POST" action="" >
                        <input type="hidden" name="action" value="create">
                        <div class="w-[20rem] flex-none">
                            <p class="text-md mb-6 font-medium text-indigo-400">Chỉnh sửa nội dung</p>
                            <!-- TITLE text -->
                            <div class="mb-4">
                                <div class="flex cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/fsghhhtr.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <input type="text" class="ml-2 w-full outline-none" placeholder="title" id="title" name="title" required/>
                                </div>
                            </div>
                            <!-- TITLE - End -->
                            <!-- DESCRIPTION text -->
                            <div class="mb-4">
                                <div class="flex cursor-pointer items-center rounded-xl px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/vufjamqa.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <textarea type="text" class="ml-2 w-full outline-none" name="description"
                                              id="description" rows="3" placeholder="Mô tả"></textarea>
                                </div>
                            </div>
                            <!-- DESCRIPTION - End -->
                            <div class="flex items-center gap-x-4">
                                <!-- PRICE text -->
                                <div class="flex cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/rzsdhkun.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <input type="number" class="ml-2 w-full outline-none" placeholder="price" id="price" name="price" step="0.01" min="0" required/>
                                </div>
                                <!-- PRICE - End -->
                                <!-- SUBMIT -->

                                <div
                                        class="flex flex-1 cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10 hover:bg-slate-50"
                                >
                                    <lord-icon src="https://cdn.lordicon.com/fbdgkenc.json" trigger="loop"
                                               class="h-6 w-6 cursor-pointer"></lord-icon>
                                    <input type="submit" class="ml-2 w-full cursor-pointer outline-none" value="Lưu"/>
                                </div>
                                <!-- SUBMIT - End -->
                            </div>
                        </div>
                        <section class="flex flex-col justify-between gap-4 rounded-xl bg-white p-5">
                            <!-- Gợi ý text -->
                            <div class="mb-4 flex items-center justify-between">
                                <div class="flex items-center gap-x-2">
                                    <p class="text-md font-medium text-indigo-400">Chọn ảnh</p>
                                    <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-xs font-medium leading-5 text-indigo-600">Check box</span>
                                </div>
                                <div class="flex gap-x-2">
                                    <p class="text-md font-medium text-slate-500">...</p>
                                </div>
                            </div>
                            <!-- Gợi ý text - End -->
                            <div class="columns-3xs gap-2">
                                <c:forEach var="image" items="${images}">
                                    <figure v-for="image in images" class="mb-2 [break-inside:avoid]">
                                        <div class="group relative overflow-hidden rounded-xl">
                                            <img
                                                    class="object-cover object-center transition duration-200 group-hover:scale-110"
                                                    src="${image.filePath}"
                                                    alt="${image.title}"
                                            />
                                            <div class="absolute bottom-2 right-4 z-10 flex items-center rounded-full bg-white/20 p-2 hover:bg-white/40"
                                                 title="choose">
                                                <input type="checkbox" id="${image.id}" value="${image.id}" name="selectedImageIds"
                                                       class="h-4 w-4 rounded-full checked:accent-indigo-400"/>
                                            </div>
                                            <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                                                <div class="flex justify-between">
                                                    <div class="flex flex-col text-white">
                                                        <p class="text-sm font-bold">${image.title}</p>
                                                        <p class="text-xs">${image.price} đ</p>
                                                    </div>
                                                    <div class="flex gap-x-2">
                                                        <button class="flex items-center rounded-full bg-white/20 p-2"
                                                                title="Edit">
                                                            <lord-icon src="https://cdn.lordicon.com/dnmvmpfk.json"
                                                                       trigger="loop" colors="primary:#ffffff"
                                                                       class="h-5 w-5"></lord-icon>
                                                        </button>
                                                        <button class="flex items-center rounded-full bg-white/20 p-2"
                                                                title="Delete">
                                                            <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json"
                                                                       trigger="hover" colors="primary:#ffffff"
                                                                       class="h-5 w-5"></lord-icon>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </c:forEach>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
    </main>

</div>
</body>
</html>
