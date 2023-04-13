<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  function formatVietnamesePrice(price) {
    return price.toLocaleString("vi-VN", {style: 'currency', currency: 'VND'});
  }

  document.addEventListener('DOMContentLoaded', function () {
    var index = 0;
    const imagePrice = ${image.price};
    const price = document.getElementById('price');
    price.innerText = formatVietnamesePrice(imagePrice);
  });

</script>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
  <title>Bộ sưu tập</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
  <jsp:include page="/includes/header.jsp"/>
  <main class="mb-6 flex h-full justify-center">
    <div class="mx-auto flex-1 overscroll-contain px-6">
      <div class="max-w-screen h-screen">
        <div class="mt-6 max-w-full">
          <!-- Album -->
          <section class="flex justify-between gap-4 rounded-xl bg-white p-5">


              <div class="inline-block flex-1">
                <!-- Image -->
                  <div class="flex h-[30rem] items-center justify-center rounded-xl border">
                    <img
                            src="${image.filePath}"
                            alt="Your Image"
                            class="max-h-full max-w-full object-contain"
                    />
                  </div>
                <!-- Image - End -->
                <!-- Info -->
                <div class="flex items-center justify-between py-4">
                  <div class="flex text-slate-800">
                    <p class="text-2xl font-semibold">${image.title}</p>
                  </div>
                  <div class="flex items-center gap-x-2">
                    <p class="text-sm font-bold text-red-400" id="price">0</p>
                    <button class="flex items-center rounded-full border p-2 shadow-xl">
                      <lord-icon src="https://cdn.lordicon.com/pmegrqxm.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                    </button>
                    <button class="flex items-center rounded-full border p-2 shadow-xl">
                      <lord-icon src="https://cdn.lordicon.com/medpcfcy.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                    </button>
                  </div>
                </div>
                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-x-4">
                    <button class="flex h-14 w-14 items-center overflow-hidden rounded-lg">
                      <img
                              src="https://images.unsplash.com/photo-1680833910988-dc20bc1f8d14?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60"
                              alt="Photo by Himanshu Dewangan"
                              class="h-full w-full object-cover object-center"
                      />
                    </button>

                    <div class="flex flex-col">
                      <a href="<c:url value="/profile?id=${image.user.id}"/>"><p class="text-xl font-bold text-indigo-400">${image.user.username}</p></a>
                      <p class="text-md text-slate-500">${image.user.email}</p>
                    </div>
                  </div>
                  <div class="flex gap-x-2">
                    <p class="text-md font-medium text-slate-500">Ngày đăng: ${image.createdAt}</p>
                  </div>
                </div>
                <!-- Info - End -->
              </div>


            <div class="w-[20rem] flex-none">
              <!-- User -->
              <div class="flex items-center justify-between">
                <div class="flex flex-col items-center justify-start gap-x-4">
                  <span class="text-xl font-bold text-indigo-400">Bộ sưu tập</span>
                  <span class="text-md font-bold text-slate-600">${album.title}</span>
                </div>
                <div class="flex gap-x-4">
                  <lord-icon src="https://cdn.lordicon.com/hbigeisx.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                  <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" class="h-5 w-5"> </lord-icon>
                </div>
              </div>
              <!-- User - End -->
              <div class="my-4">
                <p class="text-md font-medium text-slate-600">${album.description}</p>
              </div>

              <hr class="mb-4" />
              <!-- Gợi ý text -->
              <div class="mb-4 flex items-center gap-x-4">
                <p class="text-md font-medium text-indigo-400">Ảnh</p>
                <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-xs font-medium leading-5 text-indigo-600">2</span>
              </div>
              <!-- Gợi ý text - End -->
              <div class="columns-3 gap-2">
                <c:forEach var="image" items="${images}" varStatus="status">
<%--                    <input type="hidden" id="index" name="index" value="${status.index}">--%>
                    <figure v-for="image in images" class="mb-2 [break-inside:avoid]" onclick="changeIndexImage()">
                      <div class="overflow-hidden rounded-xl">
                        <img
                                class="object-cover object-center transition duration-200"
                                src="${image.filePath}"
                                alt=""
                        />
                      </div>
                    </figure>
                </c:forEach>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
  </main>

</div>
<%--<h1>${album.title}</h1>--%>
<%--<p>${album.description}</p>--%>

<%--<h2>Images</h2>--%>
<%--<c:forEach var="image" items="${images}">--%>
<%--  <div>--%>
<%--    <img src="${image.filePath}" height="100"/>--%>
<%--    <p>${image.title}</p>--%>
<%--  </div>--%>
<%--</c:forEach>--%>
</body>

<%--<h1>${album.title}</h1>--%>
<%--<p>${album.description}</p>--%>

<%--<h2>Images</h2>--%>
<%--<c:forEach var="image" items="${images}">--%>
<%--  <div>--%>
<%--    <img src="${image.filePath}" height="100"/>--%>
<%--    <p>${image.title}</p>--%>
<%--  </div>--%>
<%--</c:forEach>--%>


</html>
<%--<script>--%>
<%--  function changeIndexImage () {--%>
<%--    var indexField = document.getElementById("index");--%>
<%--    var currentIndex = parseInt(indexField.value);--%>
<%--    index = currentIndex;--%>
<%--  }--%>
<%--</script>--%>