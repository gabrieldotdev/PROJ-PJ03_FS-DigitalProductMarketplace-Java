<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <title>Chỉnh sửa ảnh</title>
</head>

<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="/includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <jsp:include page="/includes/sidebar.jsp"/>
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen h-screen">
                <%-- EDIT-IMAGE--%>
                <div class="mt-6 max-w-full">
                    <!-- Main PRODUCTS -->
                    <form class="flex justify-between gap-4 rounded-xl bg-white p-5" method="post"
                          action="<c:url value="/user/images" />">
                        <input type="hidden" name="action" value="update"/>
                        <input type="hidden" name="id" value="${image.id}"/>
                        <div class="inline-block flex-1">
                            <!-- Image -->
                            <div class="flex h-[30rem] items-center justify-center rounded-xl border">
                                <img
                                        src="${image.filePath}"
                                        alt="${image.title}"
                                        class=" max-h-full max-w-full object-contain"
                                />
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
                                    <input type="text" class="ml-2 w-full outline-none" name="title" id="title"
                                           value="${image.title}"/>
                                </div>
                            </div>
                            <!-- TITLE - End -->
                            <!-- DESCRIPTION text -->
                            <div class="mb-4">
                                <div class="flex cursor-pointer items-center rounded-xl px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/vufjamqa.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <textarea type="text" class="ml-2 w-full outline-none" name="description"
                                              id="description" rows="3">${image.description}</textarea>
                                </div>
                            </div>
                            <!-- DESCRIPTION - End -->
                            <div class="flex items-center gap-x-4">
                                <!-- PRICE text -->
                                <div class="flex cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/rzsdhkun.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <input type="text" class="ml-2 w-full outline-none" type="number" name="price"
                                           id="price" min="0" step="0.01" value="${image.price}"/>
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
