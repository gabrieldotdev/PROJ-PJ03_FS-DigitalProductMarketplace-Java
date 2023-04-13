<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <title>Giỏ hàng ảnh </title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="/includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen h-screen">
                <div class="mt-6 max-w-full">
                    <!-- Main PRODUCTS -->
                    <section class="flex flex-col gap-4 rounded-xl bg-white p-5">
                        <div class="flex items-center justify-between">
                            <div>
                                <h2 class="text-xl font-bold text-indigo-500 md:text-2xl">Giỏ hàng gì cũng có!</h2>
                                <div class="flex items-center gap-x-2 py-2 font-medium text-slate-500">
                                    <span>Sản phẩm: <%= request.getAttribute("productCount") %></span>
                                    <hr class="w-2"/>
                                    <span>Tổng tiền: <%= request.getAttribute("totalPrice") %> đ</span>
                                </div>
                            </div>
                            <button
                                    type="submit"
                                    class="inline-block cursor-pointer items-center rounded-full px-3 py-1 text-sm font-semibold leading-5 text-indigo-500/50 ring-1 ring-slate-900/10 backdrop-blur hover:bg-indigo-400 hover:text-white md:text-base xl:flex"
                            >
                                Mua ngay
                            </button>
                        </div>
                        <div id="product-container" class="columns-3xs gap-4">
                            <c:choose>
                                <c:when test="${empty purchases}">
                                    <p>Không có mặt hàng nào trong giỏ hàng của bạn.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${purchases}" var="purchase" varStatus="status">
                                        <c:if test="${not empty purchase.image}">
                                            <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                                                <div class="group relative overflow-hidden rounded-xl">
                                                    <img
                                                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                                                            src="${purchase.image.filePath}"
                                                            alt="${purchase.image.title}"
                                                    />
                                                    <div class="absolute bottom-2 right-4 z-10 flex items-center rounded-full bg-white/20 p-2 hover:bg-white/40"
                                                         title="choose">
                                                        <input type="checkbox" checked
                                                               class="h-4 w-4 rounded-full checked:accent-indigo-400"/>
                                                    </div>
                                                    <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                                                        <div class="flex justify-between">
                                                            <div class="flex flex-col text-white">
                                                                <a href="<c:url value="/view/image?id=${purchase.image.id}"/>">
                                                                    <p class="text-sm font-bold truncate line-clamp-1 ">${purchase.image.title}</p>
                                                                </a>
                                                                <p class="text-xs">${purchase.image.price} đ</p>
                                                            </div>
                                                            <div class="flex gap-x-2">
                                                                <a class="flex items-center rounded-full bg-white/20 p-2 absolute bottom-2 left-4"
                                                                        href="<c:url value="/view/image?id=${purchase.image.id}"/>">
                                                                    <lord-icon
                                                                            src="https://cdn.lordicon.com/dnmvmpfk.json"
                                                                            trigger="loop" colors="primary:#ffffff"
                                                                            class="h-5 w-5"></lord-icon>
                                                                </a>

                                                                <button class="flex items-center rounded-full bg-white/20 p-2 absolute bottom-2 left-16"
                                                                        title="Delete">
                                                                    <lord-icon
                                                                            src="https://cdn.lordicon.com/kfzfxczd.json"
                                                                            trigger="hover" colors="primary:#ffffff"
                                                                            class="h-5 w-5"></lord-icon>
                                                                </button>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </figure>
                                        </c:if>
                                        <c:if test="${not empty purchase.album}">
                                            <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                                                <div class="group relative overflow-hidden rounded-xl">
                                                    <img
                                                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                                                            src="${albumCoverImages[status.index].getFilePath()}"
                                                            alt="${purchase.album.title}"
                                                    />
                                                    <div class="absolute bottom-2 right-4 z-10 flex items-center rounded-full bg-white/20 p-2 hover:bg-white/40"
                                                         title="choose">
                                                        <input type="checkbox" checked
                                                               class="h-4 w-4 rounded-full checked:accent-indigo-400"/>
                                                    </div>
                                                    <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                                                        <div class="flex justify-between">
                                                            <div class="flex flex-col text-white">
                                                                <a href="<c:url value="/view/album?albumId=${purchase.album.id}"/>">
                                                                    <p class="text-sm font-bold truncate line-clamp-1">
                                                                        Album: ${purchase.album.title}</p>
                                                                </a>
                                                                <p class="text-xs">${purchase.album.price} đ</p>
                                                            </div>
                                                            <div class="flex gap-x-2">
                                                                <a href="<c:url value="/view/album?albumId=${purchase.album.id}"/>"
                                                                   class="flex items-center rounded-full bg-white/20 p-2 absolute bottom-2 left-4">
                                                                    <lord-icon
                                                                            src="https://cdn.lordicon.com/dnmvmpfk.json"
                                                                            trigger="loop" colors="primary:#ffffff"
                                                                            class="h-5 w-5"></lord-icon>
                                                                </a>
                                                                <button class="flex items-center rounded-full bg-white/20 p-2 absolute bottom-2 left-16"
                                                                        title="Delete">
                                                                    <lord-icon
                                                                            src="https://cdn.lordicon.com/kfzfxczd.json"
                                                                            trigger="hover" colors="primary:#ffffff"
                                                                            class="h-5 w-5"></lord-icon>
                                                                </button>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </figure>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>