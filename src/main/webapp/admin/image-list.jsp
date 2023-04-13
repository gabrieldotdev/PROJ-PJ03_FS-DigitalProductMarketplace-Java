<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script src="<c:url value="https://cdn.tailwindcss.com"/>"></script>
    <script src="<c:url value="https://cdn.lordicon.com/ritcuqlt.js"/>"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <title>Image Gallery</title>
</head>

<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="/includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <jsp:include page="/includes/sidebar.jsp"/>
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen h-screen">
                <!-- ADMIN -->
                <div class="mt-6 max-w-full">
                    <!-- Main content here -->
                    <section class="flex flex-col gap-4 rounded-xl bg-white p-5">

                        <!-- IMAGE -->
                        <div id="image" class="columns-3xs gap-4">
                            <c:forEach items="${images}" var="image">
                                <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                                    <div class="group relative overflow-hidden rounded-xl">
                                        <img
                                                class="object-cover object-center transition duration-200 group-hover:scale-110"
                                                src="${image.filePath}"
                                                alt="${image.title}"
                                        />
                                        <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                                            <div class="flex justify-between">
                                                <div class="flex flex-col text-white">
                                                    <p class="text-sm font-bold">${image.title}</p>
                                                    <p class="text-xs">${image.user.username}</p>
                                                </div>
                                                <div class="flex gap-x-2">
                                                    <c:url var="editLink" value="/admin/image-list">
                                                        <c:param name="command" value="load"/>
                                                        <c:param name="id" value="${image.id}"/>
                                                    </c:url>
                                                    <a href="${editLink}">
                                                        <button class="flex items-center rounded-full bg-white/20 p-2" title="Edit">
                                                            <lord-icon src="https://cdn.lordicon.com/ndppaqfb.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                        </button>
                                                    </a>
                                                    <c:url var="deleteLink" value="/admin/image-list">
                                                        <c:param name="command" value="DELETE"/>
                                                        <c:param name="id" value="${image.id}"/>
                                                    </c:url>
                                                    <a href="${deleteLink}" onclick="if(!(confirm('Sure?'))) return false">
                                                        <button class="flex items-center rounded-full bg-white/20 p-2" title="Delete">
                                                            <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                            </c:forEach>
                        </div>
                        <!-- IMAGE - END -->

                        <div class="flex items-start justify-between gap-8 sm:items-center">
                            <p class="max-w-screen-sm text-sm text-gray-500 lg:text-base">
                                This is a section of some simple filler text, also known as placeholder text. It shares some characteristics of a real written text.
                            </p>
                            <a href="#" class="inline-block text-sm font-semibold text-indigo-500/50 hover:text-indigo-400 active:text-indigo-600 md:text-base">Xem tất cả</a>
                        </div>
                    </section>
                </div>

            </div>
        </div>
    </main>

</div>
</body>
</html>
