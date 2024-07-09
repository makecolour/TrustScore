<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 03/07/2024
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- META ============================================= -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />

    <!-- DESCRIPTION -->
    <meta name="description" content="Research Documents" />

    <!-- OG -->
    <meta property="og:title" content="Research Documents" />
    <meta property="og:description" content="Research Documents" />
    <meta property="og:image" content="" />
    <meta name="format-detection" content="telephone=no">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png" />

    <!-- PAGE TITLE HERE ============================================= -->
    <title>Research Documents</title>

    <!-- MOBILE SPECIFIC ============================================= -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--[if lt IE 9]>
    <script src="/assets/js/html5shiv.min.js"></script>
    <script src="/assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- All PLUGINS CSS ============================================= -->
    <link rel="stylesheet" type="text/css" href="/assets/css/assets.css">

    <!-- TYPOGRAPHY ============================================= -->
    <link rel="stylesheet" type="text/css" href="/assets/css/typography.css">

    <!-- SHORTCODES ============================================= -->
    <link rel="stylesheet" type="text/css" href="/assets/css/shortcodes/shortcodes.css">

    <!-- STYLESHEETS ============================================= -->
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css">
    <link class="skin" rel="stylesheet" type="text/css" href="/assets/css/color/color-1.css">

</head>
<body id="bg">
<div class="page-wraper">
    <div id="loading-icon-bx"></div>

    <jsp:include page="header.jsp"/>
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(/assets/images/banner/banner2.jpg);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">Research Documents</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="/">Home</a></li>
                    <li>Research Documents</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb row END -->
        <!-- contact area -->
        <div class="content-block">
            <div class="section-area section-sp1">
                <div class="container">
                    <div class="row">
                        <!-- Left part start -->
                        <div class="col-lg-8">
                            <c:if test="${empty files}">
                                <p>No document available.</p>
                            </c:if>

                            <c:if test="${not empty files}">
                            <c:forEach items="${files}" var="file" varStatus="loop">
                            <div class="blog-post blog-md clearfix">
                                <div class="ttr-post-media">
                                    <a href="/documents/view?fileName=${file.fileName}"><img src="${file.thumbnailPath}" alt=""></a>
                                </div>
                                <div class="ttr-post-info">
                                    <ul class="media-post">
                                        <li><a href="#"><i class="fa fa-calendar"></i>${file.lastModified}</a></li>
                                        <li><a href="#"><i class="fa fa-user"></i>Nigga</a></li>
                                    </ul>
                                    <h5 class="post-title"><a href="/documents/view?fileName=${file.fileName}">${file.fileName}</a></h5>
                                    <p>Knowing that, you’ve optimised your pages countless amount of times, written tons.</p>
                                    <div class="post-extra">
                                        <a href="/documents/view?fileName=${file.fileName}" class="btn-link">READ MORE</a>
                                        <a href="/documents/view?fileName=${file.fileName}" class="comments-bx"><i class="fa fa-comments-o"></i>${file.size}Kb</a>
                                    </div>
                                </div>

                            </div>

                            </c:forEach>

                            <!-- Pagination start -->
                            <div class="col-lg-12 m-b20">
                                <div aria-label="Page navigation" class="pagination-bx rounded-sm gray clearfix">
                                    <ul class="pagination">
                                        <c:if test="${currentPage > 0}">
                                            <li class="previous"><a href="${pageContext.request.contextPath}/documents/list?q=${sessionScope.query}&page=${currentPage - 1}"><i class="ti-arrow-left"></i> Prev</a></li>
                                        </c:if>
                                        <c:if test="${totalPages <= 3}">
                                            <c:forEach var="i" begin="0" end="${totalPages-1}">
                                                <li class=" ${i == currentPage ? 'active' : ''}"> <a href="${pageContext.request.contextPath}/documents/list?q=${sessionScope.query}&page=${i}">
                                                        ${i+1}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${totalPages > 3}">
                                            <c:forEach var="i" begin="0" end="3">
                                                <li class="${i == currentPage ? 'active' : ''}"><a href="${pageContext.request.contextPath}/documents/list?q=${sessionScope.query}&page=${i}">
                                                        ${i+1}</a>
                                                </li>

                                            </c:forEach>
                                            <li>
                                                <a>...</a>
                                            </li>
                                            <c:if test="${currentPage < totalPages - 2}">
                                                <c:if test="${currentPage > 3}">
                                                    <c:forEach var="i" begin="${currentPage-1}" end="${currentPage+1}">
                                                        <li class="${i == currentPage ? 'active' : ''}">
                                                            <a href="${pageContext.request.contextPath}/documents/list?q=${sessionScope.query}&page=${i}">${i+1}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <li>
                                                        <a>...</a>
                                                    </li>
                                                </c:if>

                                            </c:if>
                                            <c:forEach var="i" begin="${totalPages - 2}" end="${totalPages-1}">
                                                <li class=" ${i == currentPage ? 'active' : ''}">
                                                    <a href="${pageContext.request.contextPath}/documents/list?q=${sessionScope.query}&page=${i}">${i+1}</a>
                                                </li>
                                            </c:forEach>

                                        </c:if>
                                        <c:if test="${currentPage < totalPages - 1}">
                                            <li class="next">
                                                <a href="${pageContext.request.contextPath}/documents/list?q=${sessionScope.query}&page=${currentPage + 1}">Next <i class="ti-arrow-right"></i></a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
                            <!-- Pagination END -->
                        </div>
                        <!-- Left part END -->
                        <!-- Side bar start -->
                        <jsp:include page="side-bar.jsp" flush="true"/>
                        <!-- Side bar END -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <button class="back-to-top fa fa-chevron-up" ></button>
</div>
<!-- External JavaScripts -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/vendors/bootstrap/js/popper.min.js"></script>
<script src="/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
<script src="/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
<script src="/assets/vendors/magnific-popup/magnific-popup.js"></script>
<script src="/assets/vendors/counter/waypoints-min.js"></script>
<script src="/assets/vendors/counter/counterup.min.js"></script>
<script src="/assets/vendors/imagesloaded/imagesloaded.js"></script>
<script src="/assets/vendors/masonry/masonry.js"></script>
<script src="/assets/vendors/masonry/filter.js"></script>
<script src="/assets/vendors/owl-carousel/owl.carousel.js"></script>
<script src="/assets/js/functions.js"></script>
<script src="/assets/js/contact.js"></script>
<script src='/assets/vendors/switcher/switcher.js'></script>
</body>

</html>