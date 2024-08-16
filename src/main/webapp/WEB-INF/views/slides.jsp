<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 16/08/2024
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- META ============================================= -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Trust Management, research, document, list, Research Festival, ResFes, FPTEdu, LLM, data, TFT score, large language model, trust worthiness, social networks, knowledge graph, FPT University" />
    <meta name="author" content="Trust Management" />
    <meta name=”robots” content=”all” />

    <!-- DESCRIPTION -->
    <meta name="description" content="Presentation of Trust Management team at FPT Education Research Festival 2024" />

    <!-- OG -->
    <meta property="og:title" content="Trust Management: Presentation at FPTEdu ResFes2024" />
    <meta property="og:image" content="/assets/images/favicon.png" />
    <meta name="format-detection" content="telephone=no">
    <meta property="og:url" content="${pageContext.request.contextPath}/documents/list">
    <meta name="twitter:card" content="/assets/images/logo-white-2.png">

    <!--  Non-Essential, But Recommended -->
    <meta property="og:description" content="Presentation of Trust Management team at FPT Education Research Festival 2024">
    <meta property="og:site_name" content="Trust Management: Presentation at FPTEdu ResFes2024">
    <meta name="twitter:image:alt" content="Trust Management">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png" />

    <!-- PAGE TITLE HERE ============================================= -->
    <title>Trust Management: Presentation at ResFes2024</title>

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
<style>
    .iframe-container {
        position: relative;
        width: 100%;
        padding-bottom: 56.25%; /* 16:9 aspect ratio */
        height: 0;
        overflow: hidden;
    }

    .iframe-container iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border: none;
    }
</style>
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
                    <h1 class="text-white">Presentation at FPT Education Research Festival 2024</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="/">Home</a></li>
                    <li>Presentation at FPT Education Research Festival 2024</li>
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
                            <div class="profile-bx text-center">
                                <div class="user-profile-thumb">
                                    <img src="/assets/images/favicon.png" alt=""/>
                                </div>
                                <div class="profile-info">
                                    <h4>Trust Mangement</h4>
                                    <span>${email}</span>
                                </div>
                                <div class="profile-social">
                                    <ul class="list-inline m-a0">
                                        <li><a href="https://www.facebook.com/sharer/sharer.php?u=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/presentation" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="https://twitter.com/intent/tweet?url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/presentation&text=Trust%20Management%20Presentation%20at%FPTEdu%20ResFes2024!" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="https://www.linkedin.com/shareArticle?mini=true&url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/presentation&title=Trust%20Management%20Presentation%20at%20FPTEdu%20ResFes2024!" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                                <div class="profile-tabnav">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-layout-slider"></i>Presentation</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#quiz-results" id="demo-video-tab"><i class="ti-video-clapper"></i>Demo Video</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                            <div class="profile-content-bx">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="courses">
                                        <div class="profile-head">
                                            <h3>Presentation</h3>
                                            <div class="feature-filters style1 ml-auto">
                                                <ul class="filters" data-toggle="buttons">
                                                    <li data-filter="manual" class="btn active">
                                                        <input type="radio" name="presentationMode" value="manual" checked>
                                                        <a href="#"><span>Manual</span></a>
                                                    </li>
                                                    <li data-filter="auto" class="btn">
                                                        <input type="radio" name="presentationMode" value="auto">
                                                        <a href="#"><span>Auto</span></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="courses-filter">
                                            <div class="iframe-container">
                                                <iframe id="slides"  frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="quiz-results">
                                        <div class="profile-head">
                                            <h3>Demo Video</h3>
                                        </div>
                                        <div class="courses-filter">
                                            <div class="iframe-container">
                                                <iframe id="demo-vid" title="Trust Management: Introduction to Products" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- contact area END -->
    </div>
    <!-- Content END-->
    <!-- Footer ==== -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Footer END ==== -->
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        updateIframeSrc(false);

    });

    function updateIframeSrc(auto) {
        const iframe = document.getElementById("slides");
        const baseSrc = "https://docs.google.com/presentation/d/163ARz8ZouFZmQnOck6hTD-kjNj51yzvO/embed?loop=true&start=";
        if(auto) {
            iframe.src = baseSrc + "true&delayms=5000";
            console.log("Auto mode");
        }
        else {
            iframe.src = baseSrc + "false&delayms=0";
            console.log("Manual mode");
        }
    }

    document.querySelector('li[data-filter="manual"]').addEventListener('click', function() {
        updateIframeSrc(false);
    });

    document.querySelector('li[data-filter="auto"]').addEventListener('click', function() {
        updateIframeSrc(true);
    });
    document.getElementById('demo-video-tab').addEventListener('click', function() {
        const iframe = document.getElementById("demo-vid");
        iframe.src = "https://www.youtube.com/embed/xPtBy2NX4Cg?si=tk34pWpjQroyik4A&autoplay=1";
    });
</script>
</body>

</html>

