<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a href="<c:url value="/"/>"
               class="mb-8 inline-flex items-center gap-2.5 text-2xl font-bold text-indigo-500 md:text-3xl"
               aria-label="logo"> ART|GROUP </a>

            <form class="flex items-center justify-between gap-4" action="search" method="get">
                <div class="flex flex-1 cursor-pointer items-center rounded-full px-3 py-1 text-xs font-medium leading-5 text-slate-800 ring-1 ring-slate-900/10 backdrop-blur">
                    <lord-icon src="https://cdn.lordicon.com/qjdnqpiz.json" trigger="loop" class="h-6 w-6"></lord-icon>
                    <input type="text" class="ml-2 w-full outline-none" name="q" id="q" placeholder="Tìm kiếm..."
                           value="${query}"/>
                </div>
                <input type="submit" value="Let's go">
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
                <c:if test="${not empty images}">
                    <c:forEach items="${images}" var="image">
                        <a href="/view/image?id=${image.id}">
                            <figure v-for="image in images" class="cursor-pointer py-2 [break-inside:avoid]">
                                <div class="group relative overflow-hidden rounded-xl">
                                    <img
                                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                                            src="${image.filePath}"
                                            alt="${image.title}"
                                    />
                                    <div class="absolute inset-0 hidden items-end justify-between px-4 py-3 group-hover:block">
                                        <div class="flex flex-col items-center text-white">
                                            <p class="text-sm font-bold">${image.title}</p>
                                            <p class="text-xs">${image.user.username}</p>
                                        </div>
                                    </div>
                                </div>
                            </figure>
                        </a>
                    </c:forEach>
                </c:if>
                <c:if test="${not empty albums}">
                    <c:forEach items="${albums}" var="album" varStatus="status">
                        <a href="/view/album?albumId=${album.id}">
                            <figure v-for="image in images" class="cursor-pointer py-2 [break-inside:avoid]">
                                <div class="group relative overflow-hidden rounded-xl">
                                    <img
                                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                                            src="${albumsCoverImages[status.index].filePath}"
                                            alt="${album.title}"
                                    />
                                    <div class="absolute inset-0 hidden items-end justify-between px-4 py-3 group-hover:block">
                                        <div class="flex flex-col items-center text-white">
                                            <p class="text-sm font-bold">${album.title}</p>
                                            <p class="text-xs">${album.user.username}</p>
                                        </div>
                                    </div>
                                </div>
                            </figure>
                        </a>
                    </c:forEach>
                </c:if>

            </div>
        </div>
    </section>
</div>
</body>
</html>
