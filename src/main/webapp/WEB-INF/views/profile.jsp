<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 26/06/2024
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

<head>

    <!-- META ============================================= -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />

    <!-- DESCRIPTION -->
    <meta name="description" content="${object.get('owner').asText()} Profile" />

    <!-- OG -->
    <meta property="og:title" content="${object.get('owner').asText()} Profile" />
    <meta property="og:description" content="${object.get('owner').asText()} Profile" />
    <meta property="og:image" content="" />
    <meta name="format-detection" content="telephone=no">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png" />

    <!-- PAGE TITLE HERE ============================================= -->
    <title>${object.get('owner').asText()} Profile</title>

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
    <div class="onepage"></div>
<jsp:include page="header.jsp"/>
    <!-- header END ==== -->
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(<c:choose><c:when test="${object.hasNonNull('facebook_profile_pic')}">${object.get('facebook_profile_pic').asText()}</c:when><c:otherwise>/assets/images/gallery/FUHL.jpg</c:otherwise></c:choose>);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">${object.hasNonNull('facebook_name') ? object.get('facebook_name').asText() : fn:replace(object.get('owner').asText(), '\"', '')}'s Details</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li> ${object.hasNonNull('facebook_name') ? object.get('facebook_name').asText() : fn:replace(object.get('owner').asText(), '\"', '')}'s Details</li>
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
                        <div class="col-lg-8 col-md-7 col-sm-12">
                            <div class="courses-post">
                                <div class="ttr-post-media media-effect">
                                    <a href="https://www.facebook.com/groups/356018761148436/user/${fn:replace(object.get('owner').asText(), '\"', '')}">
                                        <c:choose>
                                        <c:when test="${object.hasNonNull('facebook_profile_pic')}">
                                            <img src="${object.get('facebook_profile_pic').asText()}" alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/assets/images/gallery/FUHL.jpg" alt="">
                                        </c:otherwise>
                                    </c:choose></a>
                                </div>
                                <div class="ttr-post-info">
                                    <div class="ttr-post-title ">
                                        <h2 class="post-title" id="serviceType"></h2>
<%--                                        <script>--%>
<%--                                            // Assuming 'object' is passed as a JSON string from the backend--%>
<%--                                            var user = ${object};--%>

<%--                                            // Access the service_type attribute--%>
<%--                                            var serviceType = user.properties.service_type;--%>
<%--                                            var replacements = {--%>
<%--                                                'an_uong': 'Ăn Uống',--%>
<%--                                                'thue_phong': 'Thuê Phòng',--%>
<%--                                                'van_chuyen': 'Vận Chuyển'--%>
<%--                                            };--%>

<%--                                            // Replace the values in the service_type array--%>
<%--                                            var replacedServiceType = serviceType.map(function(service) {--%>
<%--                                                return replacements[service] || service;--%>
<%--                                            });--%>
<%--                                            // Display the service_type in the HTML--%>
<%--                                            document.getElementById("serviceType").innerHTML = "Service provides: " + replacedServiceType.join(", ");--%>
<%--                                        </script>--%>
                                    </div>
                                    <div class="ttr-post-text">
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="courese-overview" id="overview">
                                <div class="row">
                                    <div class="col-md-12 col-lg-5">
                                        <ul class="course-features">
                                            <li><i class="ti-book"></i> <span class="label">Topics</span> <span class="value">Web design</span></li>

                                        </ul>
                                    </div>
                                    <div class="col-md-12 col-lg-7">
                                        <h5 class="m-b5">Event Description</h5>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
                                        <h5 class="m-b5">Certification</h5>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
                                        <h5 class="m-b5">Event Content</h5>
                                        <ul class="list-checked primary">
                                            <li>Over 37 lectures and 55.5 hours of content!</li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-12 m-b30">
                            <div class="bg-primary text-white contact-info-bx m-b30">
                                <h2 class="m-b10 title-head">Contact <span>Information</span></h2>
<%--                                <p>${object.get("owner")}'s details</p>--%>
                                <div class="widget widget_getintuch">
                                    <ul>
                                        <c:if test="${ownersList.size()>0}">
                                            <c:forEach items="${ownersList}" var="owner">
                                                <li><i class="ti-mobile"></i><a style="color: white" href="tel:${owner}">${owner}</a></li>
                                            </c:forEach>
                                        </c:if>

                                    </ul>
                                </div>
                                <h5 class="m-t0 m-b20">Facebook links</h5>
                                <ul class="list-inline contact-social-bx">
                                    <!-- Render the list of names as Facebook links -->
                                    <c:if test="${not empty namesList}">
                                        <ul>
                                            <c:forEach items="${namesList}" var="name">
                                                <li>
                                                    <a href="https://www.facebook.com/${name}" target="_blank" class="btn outline radius-xl">
                                                        <i style="margin: 10px 5px" class="fa fa-facebook"></i>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </ul>
                            </div>
                            <div style="width: 100%; height: 750px; display: block; margin-top: 20px" id="chart-container"></div>                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- contact area END -->

    </div>
    <!-- Content END-->
    <!-- Footer ==== -->
    <jsp:include page="footer.jsp"/>
    <!-- Footer END ==== -->
    <button class="back-to-top fa fa-chevron-up" ></button>
</div>
<!-- External JavaScripts -->
<script src="https://cdn.jsdelivr.net/npm/d3@7"></script>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/graph/pie-chart.js"></script>
<script>
    const container = document.getElementById('chart-container');
    window.onload = async function() {
        const data = await fetch('${pageContext.request.contextPath}/api/attributes?owner=${object.get("owner").asText()}').then(response => response.json());
        const pie = pieChart(data, container.clientWidth, container.clientHeight);
        container.appendChild(pie);
    }
</script>
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