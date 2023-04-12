<%--
  Created by IntelliJ IDEA.
  User: LilWxs
  Date: 4/13/2023
  Time: 2:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <title>Title</title>
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
                                    <span>Ảnh: 20</span>
                                    <hr class="w-2" />
                                    <span>Tổng tiền: $100</span>
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
                            <!-- <script src="../../public/js/fakedata.js"></script> -->
                            <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                                <div class="group relative overflow-hidden rounded-xl">
                                    <img
                                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                                            src="https://images.unsplash.com/photo-1675112632479-9e4a9839ee87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                                            alt=""
                                    />
                                    <div class="absolute bottom-2 right-4 z-10 flex items-center rounded-full bg-white/20 p-2 hover:bg-white/40" title="choose">
                                        <input type="checkbox" checked class="h-4 w-4 rounded-full checked:accent-indigo-400" />
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
