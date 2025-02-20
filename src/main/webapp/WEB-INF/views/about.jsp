<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 30/06/2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- META ============================================= -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Trust Management, about, team, Research Festival, ResFes, FPTEdu, research, project, LLM, data, TFT score, large language model, trust worthiness, social networks, knowledge graph, FPT University" />
    <meta name="author" content="Trust Management" />
    <meta name=”robots” content=”all” />

    <!-- DESCRIPTION -->
    <meta name="description" content="About the Trust Management team and project" />

    <!-- OG -->
    <meta property="og:title" content="Trust Management: About Us" />
    <meta property="og:image" content="/assets/images/favicon.png" />
    <meta name="format-detection" content="telephone=no">
    <meta property="og:url" content="${pageContext.request.contextPath}/about">
    <meta name="twitter:card" content="/assets/images/logo-white-2.png">

    <!--  Non-Essential, But Recommended -->
    <meta property="og:description" content="About the Trust Management team and project">
    <meta property="og:site_name" content="Trust Management: About Us">
    <meta name="twitter:image:alt" content="Trust Management">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png" />

    <!-- PAGE TITLE HERE ============================================= -->
    <title>Trust Management: About Us</title>

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
    <jsp:include page="header.jsp"/>
    <!-- header END ==== -->
    <!-- Inner Content Box ==== -->
    <div class="page-content">
        <!-- Page Heading Box ==== -->
        <div class="page-banner ovbl-dark" style="background-image:url(/assets/images/gallery/resfes.png);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">About us</h1>
                </div>
            </div>
        </div>
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="/">Home</a></li>
                    <li>About Us</li>
                </ul>
            </div>
        </div>
        <!-- Page Heading Box END ==== -->
        <!-- Page Content Box ==== -->
        <div class="content-block">
            <!-- About Us ==== -->
<%--            <div class="section-area section-sp1">--%>
<%--                <div class="container">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-lg-3 col-md-6 col-sm-6 m-b30">--%>
<%--                            <div class="feature-container">--%>
<%--                                <div class="feature-md text-white m-b20">--%>
<%--                                    <a href="#" class="icon-cell"><img src="/assets/images/icon/icon1.png" alt=""/></a>--%>
<%--                                </div>--%>
<%--                                <div class="icon-content">--%>
<%--                                    <h5 class="ttr-tilte">Our Philosophy</h5>--%>
<%--                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod..</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-3 col-md-6 col-sm-6 m-b30">--%>
<%--                            <div class="feature-container">--%>
<%--                                <div class="feature-md text-white m-b20">--%>
<%--                                    <a href="#" class="icon-cell"><img src="/assets/images/icon/icon2.png" alt=""/></a>--%>
<%--                                </div>--%>
<%--                                <div class="icon-content">--%>
<%--                                    <h5 class="ttr-tilte">Kingster's Principle</h5>--%>
<%--                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod..</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-3 col-md-6 col-sm-6 m-b30">--%>
<%--                            <div class="feature-container">--%>
<%--                                <div class="feature-md text-white m-b20">--%>
<%--                                    <a href="#" class="icon-cell"><img src="/assets/images/icon/icon3.png" alt=""/></a>--%>
<%--                                </div>--%>
<%--                                <div class="icon-content">--%>
<%--                                    <h5 class="ttr-tilte">Key Of Success</h5>--%>
<%--                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod..</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-3 col-md-6 col-sm-6 m-b30">--%>
<%--                            <div class="feature-container">--%>
<%--                                <div class="feature-md text-white m-b20">--%>
<%--                                    <a href="#" class="icon-cell"><img src="/assets/images/icon/icon4.png" alt=""/></a>--%>
<%--                                </div>--%>
<%--                                <div class="icon-content">--%>
<%--                                    <h5 class="ttr-tilte">Our Philosophy</h5>--%>
<%--                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod..</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <!-- About Us END ==== -->
            <!-- Our Story ==== -->
            <div class="section-area bg-gray section-sp1 our-story">
                <div class="container">
                    <div class="row align-items-center d-flex">
                        <div class="col-lg-7 col-md-12 heading-bx">
                            <h2 class="m-b10">Our Story</h2>
                            <h5 class="fw4">Why did we start this project?</h5>
                            <p>Social media platforms, notably Facebook, have evolved beyond mere networking and sharing spaces into ideal marketplaces. However, unlike established e-commerce platforms such as Shopee or Lazada, social media lacks effective methods for evaluating service providers and customers.</p>
                            <p>Recognizing the importance of safety and trust in online transactions, especially on social media, our team—comprising Nguyen Huy Duc Hieu, Mai Phu Trong, and Nguyen Thuong Quyen, under the mentorship of Master Pham Van Duong—has initiated the <strong>Trust Management project</strong>. This project is dedicated to enhancing the credibility of digital marketplaces, thereby ensuring a secure and trustworthy environment for users to engage in commerce. The goal is to create a robust framework that not only facilitates transactions but also instills confidence in the digital economy.</p>
                            <a href="#project" class="btn">So, we started it!</a>
                        </div>
                        <div class="col-lg-5 col-md-12 heading-bx p-lr">
                            <div class="video-bx">
                                <img src="/assets/images/about/start.png" alt="FPT Education Research Festival 2024 Trailer"/>
                                <a href="https://www.youtube.com/watch?v=_0CuhosiUlo" class="popup-youtube video"><i class="fa fa-play"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-area content-inner section-sp1" id="project">
                <div class="container">
                    <div class="section-content">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-6 m-b30">
                                <div class="counter-style-1">
                                    <div class="text-primary">
                                        <span class="counter">58,000</span><span>+</span>
                                    </div>
                                    <span class="counter-text">Comments</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-6 m-b30">
                                <div class="counter-style-1">
                                    <div class="text-black">
                                        <span class="counter">4800</span><span>+</span>
                                    </div>
                                    <span class="counter-text">Posts</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-6 m-b30">
                                <div class="counter-style-1">
                                    <div class="text-primary">
                                        <span class="counter">6300</span><span>+</span>
                                    </div>
                                    <span class="counter-text">Users</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-6 m-b30">
                                <div class="counter-style-1">
                                    <div class="text-black">
                                        <span class="counter">3</span><span>+</span>
                                    </div>
                                    <span class="counter-text">Months of Researching</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Our Status END ==== -->
            <!-- About Content ==== -->
            <div class="section-area section-sp2 bg-fix ovbl-dark join-bx text-center" style="background-image:url(/assets/images/gallery/FUHL.jpg);">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="join-content-bx text-white">
                                <h2>The project</h2>
<%--                                <h4><span class="counter">57,000 </span> Online Courses</h4>--%>
                                <p>The <strong>Trust Management project</strong> offers trust reputation scores for services provided within the FU-HL group, a large and active community on Facebook associated with FPT University Hanoi with about 56000 members and more than 1500 posts per day. This system recommends services from reputable providers and shares their contact information, enabling users to easily connect with and utilize these services.</p>
                                <a href="${FUHL}" target="_blank" class="btn button-md">FU-HL</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- About Content END ==== -->
           <jsp:include page="team.jsp"/>
        </div>
        <!-- Page Content Box END ==== -->
    </div>
    <!-- Inner Content Box END ==== -->
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
<%--<script src="/assets/js/contact.js"></script>--%>
<script src='/assets/vendors/switcher/switcher.js'></script>
<script>
    $(document).ready(function(){
        $('a[href^="#"]').on('click', function(event) {
            var target = $(this.getAttribute('href'));
            if(target.length) {
                event.preventDefault();
                $('html, body').stop().animate({
                    scrollTop: target.offset().top
                }, 1000); // Adjust the duration as needed
            }
        });
    });
</script>
</body>


</html>
