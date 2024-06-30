<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">


<head>

    <!-- META ============================================= -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>
    <meta name="robots" content=""/>

    <!-- DESCRIPTION -->
    <meta name="description" content="EduChamp : Education HTML Template"/>

    <!-- OG -->
    <meta property="og:title" content="EduChamp : Education HTML Template"/>
    <meta property="og:description" content="EduChamp : Education HTML Template"/>
    <meta property="og:image" content=""/>
    <meta name="format-detection" content="telephone=no">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png"/>

    <!-- PAGE TITLE HERE ============================================= -->
    <title>EduChamp : Education HTML Template </title>

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

    <!-- Header Top ==== -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header END ==== -->
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(/assets/images/gallery/FUHL.jpg);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">Service Providers</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="/">Home</a></li>
                    <li>Service Providers</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb row END -->
        <!-- inner page banner END -->
        <div class="content-block">
            <!-- About Us -->
            <div class="section-area section-sp1">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-12 m-b30">

<%--                                                        search course by name--%>

                            <div class="widget courses-search-bx placeani">
                                <div class="form-group">
                                    <div class="input-group">
                                        <form action="${pageContext.request.contextPath}/list" method="get">
                                            <div class="input-group">
                                                <label>Search Service Provider</label>
                                                <input name="q" type="text" class="form-control"
                                                       value="${sessionScope.query}">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

<%--                            &lt;%&ndash;                            search course by subject&ndash;%&gt;--%>

<%--                            <div class="widget widget_archive">--%>
<%--                                <h5 class="widget-title style-1">All Subject</h5>--%>
<%--                                <ul>--%>
<%--                                    <c:if test="${empty subjectSet}">--%>
<%--                                        <p>No subject available.</p>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${not empty subjectSet}">--%>
<%--                                        <li><a href="${pageContext.request.contextPath}/course">General</a></li>--%>
<%--                                        <c:forEach items="${subjectSet}" var="sub">--%>
<%--                                            <li>--%>
<%--                                                <a href="${pageContext.request.contextPath}/course/search?courseSearch=${param.courseSearch}&subjectId=${sub.id}">${sub.name}- ${sub.code}</a>--%>
<%--                                            </li>--%>
<%--                                        </c:forEach>--%>
<%--                                    </c:if>--%>
<%--                                </ul>--%>
<%--                            </div>--%>

                            <div class="widget">
                                <a href=${FUHL} target="_blank"><img src="/assets/images/adv/adv.jpg" alt=""/></a>
                            </div>
                        </div>
                        <%--show course --%>


                        <div class="col-lg-9 col-md-8 col-sm-12">
                            <div class="row">
                                <c:if test="${empty objects}">
                                    <p>No course available.</p>
                                </c:if>
                                <c:if test="${not empty objects}">
                                    <c:forEach items="${objects}" var="object" varStatus="loop">
                                        <div class="col-md-6 col-lg-4 col-sm-6 m-b30">
                                            <div class="cours-bx">
                                                <div class="action-box">
                                                    <c:choose>
                                                        <c:when test="${object.hasNonNull('facebook_profile_pic')}">
                                                            <img src="${object.get('facebook_profile_pic').asText()}" alt="">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="/assets/images/gallery/FUHL.jpg" alt="">
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="${pageContext.request.contextPath}/profile?owner=${fn:replace(object.get('owner').asText(), '\"', '')}"
                                                       class="btn">View Profile</a>
                                                </div>
                                                <div class="info-bx text-center">

                                                    <h5><a href="/profile?owner=${fn:replace(object.get('owner').asText(), '\"', '')}">
                                                                ${object.hasNonNull('facebook_name') ? object.get('facebook_name').asText() : fn:replace(object.get('owner').asText(), '\"', '')}
                                                    </a></h5>
                                                        <span>${object.get('owner')}</span>
                                                </div>
                                                <div class="cours-more-info">
                                                    <div class="review">
                                                        <span>${object.get('old_page_rank')}</span>
                                                        <ul class="cours-star">
                                                            <c:forEach var="i" begin="1" end="5">
                                                                <c:choose>
                                                                    <c:when test="${i <= (object.get('old_page_rank').asDouble() / top1.get('old_page_rank').asDouble() * 5)}">
                                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li><i class="fa fa-star"></i></li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                    <div class="price">
<%--                                                        <del>$190</del>--%>
                                                    <h5>${loop.count}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>


                            </div>
                            <div aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="${pageContext.request.contextPath}/list?q=${query}&page=${currentPage - 1}">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${totalPages < 3}">
                                        <c:forEach var="i" begin="0" end="${totalPages}">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">${i+1}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${totalPages > 3}">
                                        <c:forEach var="i" begin="0" end="3">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">${i+1}</a>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${currentPage > 3}">
                                            <li class="page-item">
                                                <span class="page-link">...</span>
                                            </li>

                                        </c:if>

                                        <c:if test="${currentPage < totalPages - 2}">
                                            <c:if test="${currentPage > 3}">
                                            <c:forEach var="i" begin="${currentPage-1}" end="${currentPage+1}">
                                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                    <a class="page-link" href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">${i+1}</a>
                                                </li>
                                            </c:forEach>
                                            </c:if>
                                            <li class="page-item">
                                                <span class="page-link">...</span>
                                            </li>
                                        </c:if>
                                        <c:forEach var="i" begin="${totalPages - 2}" end="${totalPages}">
                                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                                <a class="page-link" href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">${i+1}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                        <li class="page-item">
                                            <a class="page-link" href="${pageContext.request.contextPath}/list?q=${query}&page=${currentPage + 1}">Next</a>
                                        </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- contact area END -->

    </div>
    <jsp:include page="footer.jsp"/>
    <button class="back-to-top fa fa-chevron-up"></button>
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
<script src='assets/vendors/switcher/switcher.js'></script>
</body>

</html>
