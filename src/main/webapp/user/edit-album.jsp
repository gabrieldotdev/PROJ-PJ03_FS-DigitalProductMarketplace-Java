<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Lắng nghe sự kiện change của checkbox
            $("input[type='checkbox']").change(function () {
                var checkedBoxes = $("input[type='checkbox']:checked");
                var containerText = 'CONTAINER';
                var containerImage = '';
                if (checkedBoxes.length > 0) {
                    // Nếu có checkbox được chọn, lấy giá trị của các checkbox và thêm vào containerText
                    // Lấy đường dẫn của ảnh tương ứng với checkbox được chọn
                    checkedBoxes.each(function () {
                        containerText += ' ' + $(this).siblings('img').attr('alt');
                        containerImage = $(this).data('img-src');
                    });
                }
                // Thay đổi nội dung và ảnh của container
                $('#container').text(containerText);
                $('#container img').attr('src', containerImage);
            });
        });
    </script>
    <title>Album Editor</title>
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
                    <form class="flex justify-between gap-4 rounded-xl bg-white p-5" method="POST" action="" enctype="multipart/form-data" >
                        <input type="hidden" name="action" value="create">
                        <div class=" inline-block flex-1">

                            <!-- Image -->
                            <p id="container" class="text-md mb-6 font-medium text-indigo-400"></p>
                            <!-- Image - End -->
                        </div>

                        <div class="w-[20rem] flex-none">
                            <p class="text-md mb-6 font-medium text-indigo-400">Chỉnh sửa nội dung</p>
                            <!-- TITLE text -->
                            <div class="mb-4">
                                <div class="flex cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/fsghhhtr.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <input type="text" class="ml-2 w-full outline-none" value="${album.title}" id="title" name="title" required/>
                                </div>
                            </div>
                            <!-- TITLE - End -->
                            <!-- DESCRIPTION text -->
                            <div class="mb-4">
                                <div class="flex cursor-pointer items-center rounded-xl px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/vufjamqa.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <textarea type="text" class="ml-2 w-full outline-none" name="description"
                                              id="description" rows="3" >${album.description}</textarea>
                                </div>
                            </div>
                            <!-- DESCRIPTION - End -->
                            <div class="flex items-center gap-x-4">
                                <!-- PRICE text -->
                                <div class="flex cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/rzsdhkun.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <input type="number" class="ml-2 w-full outline-none" value="${album.price}" id="price" name="price" step="0.01" min="0" required/>
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
                    </form>
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
                            <figure v-for="image in images" class="mb-2 [break-inside:avoid]">
                                <div class="group relative overflow-hidden rounded-xl">
                                    <img
                                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                                            src="https://images.unsplash.com/photo-1675112632479-9e4a9839ee87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                                            alt=""
                                    />
                                    <div class="absolute bottom-2 right-4 z-10 flex items-center rounded-full bg-white/20 p-2 hover:bg-white/40" title="choose">
                                        <input type="checkbox" data-img-src="" class="h-4 w-4 rounded-full checked:accent-indigo-400" />
                                    </div>
                                    <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                                        <div class="flex justify-between">
                                            <div class="flex flex-col text-white">
                                                <p class="text-sm font-bold">Tên ảnh</p>
                                                <p class="text-xs">Số tiền</p>
                                            </div>
                                            <div class="flex gap-x-2">
                                                <button class="flex items-center rounded-full bg-white/20 p-2" title="Edit">
                                                    <lord-icon src="https://cdn.lordicon.com/dnmvmpfk.json" trigger="loop" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                </button>
                                                <button class="flex items-center rounded-full bg-white/20 p-2" title="Delete">
                                                    <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </figure>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>

</div>
</body>
</html>
