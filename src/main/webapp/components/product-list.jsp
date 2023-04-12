<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="max-w-full">
    <!-- Main PRODUCTS -->
    <section class="flex flex-col gap-4 rounded-xl bg-white p-5">
        <div class="flex items-center justify-between">
            <div>
                <h2 class="text-xl font-bold text-indigo-500 md:text-2xl">Danh sách hình ảnh</h2>
                <p class="text-gray-600">Click để xem chi tiết</p>
            </div>
            <a href="#"
               class="inline-block text-sm font-semibold text-indigo-500/50 hover:text-indigo-400 active:text-indigo-600 md:text-base">Xem
                tất cả</a>
        </div>
        <div id="product-container" class="columns-3xs gap-4">
            <c:forEach items="${images}" var="image">
                <a href="<c:url value="/view/image?id=${image.id}"/>">
                    <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                        <div class="group relative overflow-hidden rounded-xl">
                            <img
                                    class="object-cover object-center transition duration-200 group-hover:scale-110"
                                    src=${image.filePath} alt=${image.title}/ alt="${image.title}">
                            <div class="absolute inset-0 hidden items-end justify-between px-4 py-3 group-hover:block">
                                <div class="flex flex-col items-center text-white">
                                    <p class="text-sm font-bold truncate">${image.title}</p>
                                    <p class="text-xs">by ${image.user.username}</p>
                                </div>
                            </div>
                        </div>
                    </figure>
                </a>
            </c:forEach>
        </div>
    </section>
</div>
