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
    <meta name="keywords" content="Trust Management, ${object.get('owner').asText()}, profile, Research Festival, ResFes, FPTEdu, LLM, data, TFT score, large language model, trust worthiness, social networks, knowledge graph, FPT University" />
    <meta name="author" content="Trust Management" />
    <meta name=”robots” content=”all” />

    <!-- DESCRIPTION -->
    <meta name="description" content="Trust Management: ${object.get('owner').asText()} Profile"/>

    <!-- OG -->
    <meta property="og:title" content="Trust Management: ${object.get('owner').asText()} Profile"/>
    <meta property="og:description" content="Trust Management: ${object.get('owner').asText()} Profile"/>
    <meta property="og:image" content="/assets/images/favicon.png" />
    <meta name="format-detection" content="telephone=no">
    <meta property="og:url" content="${pageContext.request.contextPath}/profile?owner=${object.get('owner').asText()}">
    <meta name="twitter:card" content="/assets/images/logo-white-2.png">

    <!--  Non-Essential, But Recommended -->
    <meta property="og:description" content="Profile of service provider ${object.get('owner').asText()}">
    <meta property="og:site_name" content="Trust Management: ${object.get('owner').asText()} Profile">
    <meta name="twitter:image:alt" content="Trust Management">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png"/>

    <!-- PAGE TITLE HERE ============================================= -->
    <title>Trust Management: ${object.get('owner').asText()} Profile</title>

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
    <style>
        .section-area {
            margin-bottom: 0px;
            margin-top: 0px;
            padding: 0px;
        }
        .tooltip{
            margin: 10px;
            margin-right: 15px;
            position: absolute;
            opacity: 0;
            overflow: auto;
            overflow-wrap: anywhere;
            background: linear-gradient(315deg, rgba(0, 191, 255, 0.8), rgba(255, 127, 63, 0.8));;
            border-radius: 5px;
            padding: 10px;
            border: 1px solid #F0F0F0;
            color: white;
        }
        .section-sp1 {
            padding-top: 20px;
        }
        .section-sp3 {
            padding-bottom: 30px;
        }
    </style>

</head>
<body id="bg">
<div id="tooltip" class="tooltip bs-tooltip-bottom"></div>
<div class="page-wraper">
    <div id="loading-icon-bx"></div>
    <div class="onepage"></div>
    <jsp:include page="header.jsp"/>
    <!-- header END ==== -->
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(
        <c:choose>
            <c:when test="${object.hasNonNull('facebook_profile_pic')}">${object.get('facebook_profile_pic').asText()}</c:when>
            <c:otherwise>/assets/images/gallery/resfes.png</c:otherwise>
        </c:choose>);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">${object.hasNonNull('facebook_name') ? object.get('facebook_name').asText() : fn:replace(object.get('owner').asText(), '\"', '')}'s
                        Details</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li> ${object.hasNonNull('facebook_name') ? object.get('facebook_name').asText() : fn:replace(object.get('owner').asText(), '\"', '')}'s
                        Details
                    </li>
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
                                    <a href="#">
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
                                        <h2 style="margin-top: 10px" class="post-title" id="serviceType">Overview:</h2>
                                    </div>
                                    <div class="ttr-post-text">
                                        <p>
                                            <strong>${object.hasNonNull('facebook_name') ? object.get('facebook_name').asText() : fn:replace(object.get('owner').asText(), '\"', '')}</strong>
                                            is a service provider which provides
                                            <strong>${object.get("properties").get("service_type").toString().replace("\"", "").replace("[","").replace("]", "")}</strong>
                                            service. It has been ranked <strong>#${object.get("order")}</strong> with
                                            Trust Score <strong>${object.get("first_combine")}</strong>.</p>
                                    </div>
                                </div>
                            </div>

                            <%--                            <div class="course-features">--%>
                            <%--                                <h5 class="m-b5">Recently Comments</h5>--%>
                            <%--                                <ul class="list-checked primary">--%>
                            <%--                                    <li>Over 37 lectures and 55.5 hours of content!</li>--%>
                            <%--                                </ul>--%>
                            <%--                            </div>--%>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-12 m-b30">
                            <div class="bg-primary text-white contact-info-bx m-b30">
                                <h2 class="m-b10 title-head">Contact <span>Information</span></h2>
                                <%--                                <p>${object.get("owner")}'s details</p>--%>
                                <div class="widget widget_getintuch">
                                    <ul>
                                        <c:if test="${ownersList.size()>0}">
                                            <c:forEach items="${ownersList}" var="owner">
                                                <li><i class="ti-mobile"></i><a style="color: white"
                                                                                href="tel:${owner}">${owner}</a></li>
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
                                                    <a href="https://www.facebook.com/${name}" target="_blank"
                                                       class="btn outline radius-xl">
                                                        <i style="margin: 10px 5px" class="fa fa-facebook"></i>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="section-area section-sp2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 heading-bx left">
                            <div class="courese-overview" id="overview">
                                <div class="row">
                                    <div class="col-md-12 col-lg-4">
                                        <h5 class="m-b5">Posts, Reacts & Comments</h5>
                                        <ul class="course-features">
                                            <li><i class="ti-layout-list-post"></i> <span class="label">Total posts</span> <span
                                                    class="value">${object.get("properties").get("total_posts")}</span>
                                            </li>
                                            <%--                                            <li><i class="ti-book"></i> <span class="label">Like reacts</span> <span class="value">${object.get("properties").get("num_likes")}</span></li>--%>
                                            <%--                                            <li><i class="ti-book"></i> <span class="label">Love reacts</span> <span class="value">${object.get("properties").get("num_loves")}</span></li>--%>
                                            <%--                                            <li><i class="ti-book"></i> <span class="label">Care reacts</span> <span class="value">${object.get("properties").get("num_cares")}</span></li>--%>
                                            <%--                                            <li><i class="ti-book"></i> <span class="label">Haha reacts</span> <span class="value">${object.get("properties").get("num_hahas")}</span></li>--%>
                                            <%--                                            <li><i class="ti-book"></i> <span class="label">Wow reacts</span> <span class="value">${object.get("properties").get("num_wows")}</span></li>--%>
                                            <%--                                            <li><i class="ti-book"></i> <span class="label">Sad reacts</span> <span class="value">${object.get("properties").get("num_wows")}</span></li>--%>
                                            <%--                                            <li><i class="ti-book"></i> <span class="label">Angry reacts</span> <span class="value">${object.get("properties").get("num_angries")}</span></li>--%>
                                            <li><i class="ti-comments"></i> <span class="label">Comments received</span>
                                                <span class="value">${object.get("properties").get("comment_receive")}</span>
                                            </li>
                                            <li><i class="ti-comment"></i> <span class="label">Total comments</span> <span
                                                    class="value">${object.get("properties").get("total_comments")}</span>
                                            </li>
                                            <li><i class="ti-comment-alt"></i> <span class="label">Self comments</span> <span
                                                    class="value">${object.get("properties").get("self_comment")}</span>
                                            </li>
                                            <li><i class="ti-heart"></i> <span class="label">Total reacts received from comments</span>
                                                <span class="value">${object.get("properties").get("total_comment_reacts")}</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-12 col-lg-4">
                                        <h5 class="m-b5">Feedbacks</h5>
                                        <div style="width: 100%; display: block; margin: 20px 0px"
                                             id="chart-container"></div>
                                    </div>
                                    <div class="col-md-12 col-lg-4">
                                        <h5 class="m-b5">Reactions</h5>
                                        <div style="width: 100%; display: block; margin: 20px 0px"
                                             id="chart-container2"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- contact area END -->
            <div class="section-area section-sp3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 heading-bx left">
                            <div class="ttr-post-title ">
                                <h2 class="post-title">Recently Comments:</h2>
                            </div>
                            <div class="ttr-post-text">
                                <p>Most recently comments of users to this service provider.</p>
                            </div>
                        </div>
                        <div class="testimonial-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                            <c:if test="${comments.size()>0}">
                            <c:forEach items="${comments}" var="comment">

                                <div class="item">
                                    <div class="testimonial-bx">
                                        <div class="testimonial-thumb">
                                            <img src="assets/images/favicon.png" alt="">
                                        </div>
                                        <div class="testimonial-info">
                                            <h5 class="name">${comment.get("user_id")}</h5>
                                            <p>${comment.get("time_x")}</p>

                                        </div>
                                        <div class="testimonial-content">
                                                <%--                                                        <p>${comment.get("content")}</p>--%>
                                            <p>${comment.get("textCommentElement")}</p>
                                        </div>
                                    </div>
                                </div>


                            </c:forEach>
                        </div>
                    </div>
                </div>
                </c:if>

            </div>

        </div>
        <!-- Content END-->
        <!-- Footer ==== -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer END ==== -->
        <button class="back-to-top fa fa-chevron-up"></button>
    </div>
    <!-- External JavaScripts -->
    <script src="https://cdn.jsdelivr.net/npm/d3@7.9.0/dist/d3.min.js"></script>
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/graph/pie-chart.js"></script>
    <script>
        const container = document.getElementById('chart-container');
        const container2 = document.getElementById('chart-container2');

        function adjustHeight(container) {
            const width = container.clientWidth;
            container.style.height = width + 'px';
        }

        window.onload = async function () {
            adjustHeight(container);
            adjustHeight(container2);
            const data = await fetch('${pageContext.request.contextPath}/api/interacts?owner=${object.get("owner").asText()}').then(response => response.json());
            const pie = pieChart(data, container.clientWidth, container.clientHeight);
            container.appendChild(pie);
            const data2 = await fetch('${pageContext.request.contextPath}/api/reacts?owner=${object.get("owner").asText()}').then(response => response.json());
            const pie2 = pieChart(data2, container2.clientWidth, container2.clientHeight);
            container2.appendChild(pie2);
        }
        window.onresize = function () {
            adjustHeight(container);
            adjustHeight(container2);
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
    <script src="/assets/vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="/assets/vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <!-- Slider revolution 5.0 Extensions  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script src="/assets/vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
</body>

</html>