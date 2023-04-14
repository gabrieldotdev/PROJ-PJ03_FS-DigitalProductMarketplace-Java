<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#file').on('change', function () {
                var file = this.files[0];
                var reader = new FileReader();
                reader.onload = function (event) {
                    $('#image').attr('src', event.target.result).removeClass('hidden');
                    $('#file-choose').addClass('hidden');
                    $('#delete-button').removeClass('hidden');
                };
                reader.readAsDataURL(file);
            });

            $('#delete-button').on('click', function () {
                $('#image').attr('src', '').addClass('hidden');
                $('#file').val('').removeClass('hidden');
                $('#file-choose').removeClass('hidden');
                $(this).addClass('hidden');
            });
        });
    </script>
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
                    <form class="flex justify-between gap-4 rounded-xl bg-white p-5" method="POST" action="" enctype="multipart/form-data" >
                        <input type="hidden" name="action" value="create">
                        <div class="relative inline-block flex-1">
                            <button id="delete-button"
                                    class="absolute right-4 top-4 flex hidden items-center rounded-full bg-white p-2">
                                <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover"
                                           class="h-5 w-5"></lord-icon>
                            </button>
                            <!-- Image -->
                            <div id="image-container"
                                 class="flex h-[30rem] items-center justify-center rounded-xl border">
                                <!-- IMAGE -->
                                <img id="image" src="" alt="hihi" class="hidden max-h-full max-w-full object-contain"/>
                                <!-- IMAGE -End -->
                                <!-- CHOOSE IMAGE -->
                                <div id="file-choose"
                                     class="mt-1 flex justify-center rounded-md border-2 border-dashed border-gray-300 px-6 pb-6 pt-5">
                                    <div class="space-y-1 text-center">
                                        <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none"
                                             viewBox="0 0 48 48" aria-hidden="true">
                                            <path
                                                    d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
                                                    strokeWidth="2"
                                                    strokeLinecap="round"
                                                    strokeLinejoin="round"></path>
                                        </svg>
                                        <div class="flex text-sm text-gray-600">
                                            <label
                                                    htmlFor="image"
                                                    class="relative cursor-pointer rounded-md bg-white font-medium text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 hover:text-indigo-500"
                                            >
                                                <span class="">Click để tải ảnh lên</span>
                                                <input id="file" required type="file" class="sr-only" name="file" accept="image/*" required/>
                                            </label>
                                        </div>
                                        <p class="text-xs text-gray-500">PNG, JPG up to 10MB</p>
                                    </div>
                                </div>
                                <!-- CHOOSE IMAGE -END -->
                            </div>
                            <!-- Image - End -->
                        </div>

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
                    </form>
                </div>
            </div>
        </div>
    </main>

</div>
</body>
</html>
