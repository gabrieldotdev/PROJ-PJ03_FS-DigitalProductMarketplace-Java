<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>User Profile</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
    <jsp:include page="/includes/header.jsp"/>
    <main class="mb-6 flex h-full justify-center">
        <jsp:include page="/includes/sidebar.jsp"/>
        <div class="mx-auto flex-1 overscroll-contain px-6">
            <div class="max-w-screen h-screen">
                <!--  PROFILE -->
                <div class="mt-6 max-w-full">
                    <section class="flex justify-start rounded-xl bg-white p-5">
                        <div class="text-size-base ease-soft-in-out relative inline-flex h-20 w-20 items-center justify-center rounded-xl text-white transition-all duration-200">
                            <img src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/img/bruce-mars.jpg" alt="profile_image" class="shadow-soft-sm w-full rounded-xl" />
                        </div>
                        <div class="my-auto w-auto max-w-full flex-none px-3">
                            <div class="h-full">
                                <h5 class="mb-1">${user.username}</h5>
                                <p class="text-size-sm mb-0 font-semibold leading-normal">${user.email}</p>
                            </div>
                        </div>
                    </section>
                    <div class="flex flex-wrap gap-4">
                        <section class="lg-max:mt-6 mt-4 flex flex-1 justify-between rounded-xl bg-white p-5 xl:w-4/12">
                            <div class="shadow-soft-xl relative flex h-full min-w-0 flex-col break-words rounded-2xl border-0 bg-white bg-clip-border">
                                <div class="mb-0 rounded-t-2xl border-b-0 bg-white p-4 pb-0">
                                    <div class="-mx-3 flex flex-wrap">
                                        <div class="flex w-full max-w-full shrink-0 items-center px-3 md:w-8/12 md:flex-none">
                                            <h6 class="mb-0">Trang cá nhân</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex-auto p-4">
                                    <p class="text-size-sm leading-normal">
                                        Chào bạn, tôi là ${user.username}, cảm ơn bạn đ quan tâm ghé thăm trang cá nhân của tôi, tôi là một người hướng lung tung đôi khi hướng nội, đôi khi hướng ngoại và tôi có vài nguười bạn cũng như tôi, nhưng bọn họ hướng thâm sâu!.
                                    </p>
                                    <hr class="bg-gradient-horizontal-light my-6 h-px bg-transparent" />
                                    <ul class="mb-0 flex flex-col rounded-lg pl-0">
                                        <li class="text-size-sm relative block rounded-t-lg border-0 bg-white px-4 py-2 pl-0 pt-0 leading-normal text-inherit">
                                            <strong class="text-slate-700">Username:</strong> &nbsp; ${user.username}
                                        </li>
                                        <li class="text-size-sm relative block border-0 border-t-0 bg-white px-4 py-2 pl-0 leading-normal text-inherit">
                                            <strong class="text-slate-700">Số điện thoại:</strong> &nbsp; ${user.phone}
                                        </li>
                                        <li class="text-size-sm relative block border-0 border-t-0 bg-white px-4 py-2 pl-0 leading-normal text-inherit">
                                            <strong class="text-slate-700">Email:</strong> &nbsp; ${user.email}
                                        </li>
                                        <li class="text-size-sm relative block border-0 border-t-0 bg-white px-4 py-2 pl-0 leading-normal text-inherit">
                                            <strong class="text-slate-700">Địa chỉ:</strong> &nbsp; ${user.location}
                                        </li>
                                        <li class="text-size-sm relative block border-0 border-t-0 bg-white px-4 py-2 pl-0 leading-normal text-inherit">
                                            <strong class="text-slate-700">Ngày bạn tham gia cộng đồng:</strong> &nbsp; ${user.created_at}
                                        </li>
                                    </ul>

                                </div>
                            </div>
                        </section>
                        <%-- PHOTO HERE!--%>
                        <section class="lg-max:mt-6 mt-4 flex flex-1 flex-col justify-between rounded-xl bg-white p-5 xl:w-4/12">
                            <!-- My Photo -->
                            <div class="mb-4 flex items-center justify-between">
                                <div class="flex items-center gap-x-2">
                                    <p class="text-md font-medium text-indigo-400">Ảnh</p>
                                    <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-xs font-medium leading-5 text-indigo-600">10</span>
                                </div>
                                <div class="flex gap-x-2">
                                    <p class="text-md font-medium text-slate-500">...</p>
                                </div>
                            </div>
                            <!-- My Photo -->
                            <div class="columns-3 gap-2">
                                <figure v-for="image in images" class="mb-2 [break-inside:avoid]">
                                    <div class="group relative overflow-hidden rounded-xl">
                                        <img
                                                class="object-cover object-center transition duration-200 group-hover:scale-110"
                                                src="https://plus.unsplash.com/premium_photo-1680721444847-33e37f1bd4d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
                                                alt=""
                                        />
                                        <div class="absolute inset-0 hidden items-end justify-between px-4 py-3 group-hover:block">
                                            <p class="text-sm text-white font-bold">Tên album hay tên ảnh gì đó</p>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                        </section>
                    </div>
                    <%-- ALBUM HERE!--%>
                    <section class="flex flex-col mt-4 rounded-xl bg-white p-5">
                        <!-- My Album -->
                        <div class="mb-4 flex  items-center justify-between">
                            <div class="flex items-center gap-x-2">
                                <p class="text-md font-medium text-indigo-400">Bộ sưu tập</p>
                                <span class="rounded-full bg-indigo-400/10 px-2 py-0.5 text-xs font-medium leading-5 text-indigo-600">4</span>
                            </div>
                            <div class="flex gap-x-2">
                                <p class="text-md font-medium text-slate-500">...</p>
                            </div>
                        </div>
                        <!-- My Album -->
                        <div class="columns-3 gap-2">
                            <figure v-for="image in images" class="mb-2 [break-inside:avoid]">
                                <div class="group relative overflow-hidden rounded-xl">
                                    <img
                                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                                            src="https://plus.unsplash.com/premium_photo-1680721444847-33e37f1bd4d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
                                            alt=""
                                    />
                                    <div class="absolute inset-0 hidden items-end justify-between px-4 py-3 group-hover:block">
                                        <p class="text-sm text-white font-bold">Tên album hay tên ảnh gì đó</p>
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
