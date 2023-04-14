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
                    <section class="flex justify-between gap-4 rounded-xl bg-white p-5">
                        <div class="inline-block flex-1">
                            <!-- Image -->
                            <div class="flex h-[30rem] items-center justify-center rounded-xl border">
                                <img
                                        src="https://plus.unsplash.com/premium_photo-1677178660405-38e552adf46c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
                                        alt="Your Image"
                                        class="max-h-full max-w-full object-contain"
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
                                    <input type="text" class="ml-2 w-full outline-none" placeholder="title"/>
                                </div>
                            </div>
                            <!-- TITLE - End -->
                            <!-- DESCRIPTION text -->
                            <div class="mb-4">
                                <div class="flex cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/vufjamqa.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <input type="text" class="ml-2 w-full outline-none" placeholder="description"/>
                                </div>
                            </div>
                            <!-- DESCRIPTION - End -->
                            <div class="flex items-center gap-x-4">
                                <!-- PRICE text -->
                                <div class="flex cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10">
                                    <lord-icon src="https://cdn.lordicon.com/rzsdhkun.json" trigger="loop"
                                               class="h-6 w-6"></lord-icon>
                                    <input type="text" class="ml-2 w-full outline-none" placeholder="price"/>
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
                    </section>
                </div>
            </div>
        </div>
    </main>

</div>
</body>
<%--<form method="post" action="<c:url value="/user/images"/>">--%>
<%--    <input type="hidden" name="action" value="update" />--%>
<%--    <input type="hidden" name="id" value="${image.id}" />--%>

<%--    <img src="${image.filePath}">--%>
<%--    <label for="title">Title:</label>--%>
<%--    <input type="text" name="title" id="title" value="${image.title}" />--%>

<%--    <label for="description">Description:</label>--%>
<%--    <textarea name="description" id="description">${image.description}</textarea>--%>

<%--    <label for="price">Price:</label>--%>
<%--    <input type="number" name="price" id="price" min="0" step="0.01" value="${image.price}" />--%>
<%--    <p> Ngày tạo: ${image.createdAt}</p>--%>
<%--    <button type="submit">Save Changes</button>--%>
<%--</form>--%>

</html>
