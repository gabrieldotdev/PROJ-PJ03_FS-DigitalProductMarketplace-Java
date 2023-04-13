<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mb-6 max-w-full">
    <!-- Main content here -->
    <section class="flex flex-col gap-4 rounded-xl bg-white p-5">
        <div class="flex items-center justify-between">
            <div>
                <h2 class="text-xl font-bold text-indigo-500 md:text-2xl">Danh sách album</h2>
                <p class="text-gray-600">Click để xem chi tiết</p>
            </div>
            <a href="#"
               class="inline-block text-sm font-semibold text-indigo-500/50 hover:text-indigo-400 active:text-indigo-600 md:text-base">Xem
                tất cả</a>
        </div>

        <div class="grid grid-cols-7 gap-4">
            <c:forEach items="${albums}" var="album" varStatus="status">
                <a href="<c:url value="/view/album?albumId=${album.id}"/>">
                    <div class="group relative mb-2 block overflow-hidden rounded-xl bg-gray-100 lg:mb-3">
                        <img
                                src="${albumsCoverImages[status.index].filePath}"
                                class="3xl:h-full 3xl:w-full mb-3 h-full w-full object-cover object-center transition duration-200 group-hover:scale-110 h-40"
                                alt="${album.title}"
                        />
                        <span class="text-md absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 transform font-bold text-white">${album.price} $</span>
                    </div>

                </a>
            </c:forEach>
        </div>
    </section>
</div>
