<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">


<head>

    <!-- META ============================================= -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Trust Management, service providers, list, Research Festival, ResFes, FPTEdu, LLM, data, TFT score, large language model, trust worthiness, social networks, knowledge graph, FPT University" />
    <meta name="author" content="Trust Management" />
    <meta name=”robots” content=”all” />

    <!-- DESCRIPTION -->
    <meta name="description" content="Trust Management: Service Providers"/>

    <!-- OG -->
    <meta property="og:title" content="Trust Management: Service Providers"/>
    <meta property="og:description" content="Trust Management: Service Providers"/>
    <meta property="og:image" content="/assets/images/favicon.png" />
    <meta name="format-detection" content="telephone=no">
    <meta property="og:url" content="${pageContext.request.contextPath}/list">
    <meta name="twitter:card" content="/assets/images/logo-white-2.png">

    <!--  Non-Essential, But Recommended -->
    <meta property="og:description" content="List of analyzed service providers by Trust Management project">
    <meta property="og:site_name" content="Trust Management: Service Providers">
    <meta name="twitter:image:alt" content="Trust Management">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png"/>

    <!-- PAGE TITLE HERE ============================================= -->
    <title>Trust Management: Service Providers</title>

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
    <!-- REVOLUTION SLIDER CSS ============================================= -->
    <link rel="stylesheet" type="text/css" href="/assets/vendors/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/assets/vendors/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/assets/vendors/revolution/css/navigation.css">
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
        <div class="page-banner ovbl-dark" style="background-image:url(/assets/images/gallery/resfes.png);">
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
                                        <form action="${pageContext.request.contextPath}/list" method="get" accept-charset="UTF-8">
                                            <div class="input-group">
                                                <label>Search Service Provider</label>
                                                <input name="q" type="text" class="form-control"
                                                       value="${sessionScope.query}">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="widget widget_archive">
                                <h5 class="widget-title style-1">Services</h5>
                                <ul>
                                    <li>
                                        <c:choose>
                                            <c:when test="${empty query}">
                                                <a href="${pageContext.request.contextPath}/list">General</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/list?q=${query}">All services</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <c:choose>
                                            <c:when test="${empty query}">
                                                <a href="${pageContext.request.contextPath}/list?service=an_uong">Food and Beverage</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/list?q=${query}&service=an_uong">Food and Beverage</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <c:choose>
                                            <c:when test="${empty query}">
                                                <a href="${pageContext.request.contextPath}/list?service=van_chuyen">Transportation</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/list?q=${query}&service=van_chuyen">Transportation</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <c:choose>
                                            <c:when test="${empty query}">
                                                <a href="${pageContext.request.contextPath}/list?service=thue_phong">Renting</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/list?q=${query}&service=thue_phong">Renting</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <c:choose>
                                            <c:when test="${empty query}">
                                                <a href="${pageContext.request.contextPath}/list?service=giat_la">Laundry</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/list?q=${query}&service=giat_la">Laundry</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <c:choose>
                                            <c:when test="${empty query}">
                                                <a href="${pageContext.request.contextPath}/list?service=giao_duc">Education</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/list?q=${query}&service=giao_duc">Education</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <c:choose>
                                            <c:when test="${empty query}">
                                                <a href="${pageContext.request.contextPath}/list?service=my_pham">Cosmetics</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/list?q=${query}&service=my_pham">Cosmetics</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </ul>
                            </div>

                            <div class="widget">
                                <a href="https://www.facebook.com/fptedu.resfes" target="_blank"><img src="/assets/images/adv/adv.jpg" alt=""/></a>
                            </div>
                        </div>
                        <%--show course --%>


                        <div class="col-lg-9 col-md-8 col-sm-12">
                            <c:if test="${empty objects}">
                                <p>No service provider available.</p>
                            </c:if>
                            <c:if test="${not empty objects}">
                            <div class="row">

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
                                                        <span>${object.get('first_combine')}</span>
                                                        <ul class="cours-star">
                                                            <c:choose>
                                                                <c:when test="${object.get('star').asDouble() <= 0}">
                                                                    <c:forEach var="i" begin="1" end="5">
                                                                        <li><i class="fa fa-star"></i></li>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:forEach var="i" begin="1" end="${object.get('star').asDouble().intValue()}">
                                                                        <li class="active"><i class="fa fa-star"></i></li>
                                                                    </c:forEach>
                                                                    <c:forEach var="i" begin="${object.get('star').asDouble().intValue() + 1}" end="5">
                                                                        <li><i class="fa fa-star"></i></li>
                                                                    </c:forEach>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </ul>
                                                    </div>
                                                    <div class="price">
<%--                                                        <del>$190</del>--%>
                                                    <h5>#${object.get('order').asText()}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                            </div>
                            <div class="col-lg-12 m-b20">
                            <div aria-label="Page navigation" class="pagination-bx rounded-sm gray clearfix">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 0}">
                                        <li class="previous"><a href="${pageContext.request.contextPath}/list?q=${query}&service=${service}&page=${currentPage - 1}"><i class="ti-arrow-left"></i> Prev</a></li>
                                    </c:if>
                                    <c:if test="${totalPages <= 3}">
                                        <c:forEach var="i" begin="0" end="${totalPages-1}">
                                            <li class=" ${i == currentPage ? 'active' : ''}"> <a href="${pageContext.request.contextPath}/list?q=${query}&service=${service}&page=${i}">
                                                ${i+1}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${totalPages > 3}">
                                        <c:forEach var="i" begin="0" end="3">
                                            <li class="${i == currentPage ? 'active' : ''}"><a href="${pageContext.request.contextPath}/list?q=${query}&service=${service}&page=${i}">
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
                                                    <a href="${pageContext.request.contextPath}/list?q=${query}&service=${service}&page=${i}">${i+1}</a>
                                                </li>
                                            </c:forEach>
                                                <li>
                                                    <a>...</a>
                                                </li>
                                            </c:if>

                                        </c:if>
                                        <c:forEach var="i" begin="${totalPages - 2}" end="${totalPages-1}">
                                            <li class=" ${i == currentPage ? 'active' : ''}">
                                                <a href="${pageContext.request.contextPath}/list?q=${query}&service=${service}&page=${i}">${i+1}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${currentPage < totalPages - 1}">
                                        <li class="next">
                                            <a href="${pageContext.request.contextPath}/list?q=${query}&service=${service}&page=${currentPage + 1}">Next <i class="ti-arrow-right"></i></a></li>
                                    </c:if>
                                        </ul>
                            </div>
                        </div>
                        </div>
                        </c:if>
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
