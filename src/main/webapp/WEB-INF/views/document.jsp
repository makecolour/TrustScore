<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 05/07/2024
  Time: 09:03
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
    <meta name="description" content="EduChamp : Education HTML Template" />

    <!-- OG -->
    <meta property="og:title" content="EduChamp : Education HTML Template" />
    <meta property="og:description" content="EduChamp : Education HTML Template" />
    <meta property="og:image" content="" />
    <meta name="format-detection" content="telephone=no">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png" />

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

    <style>
        /* Base style for iframe */
        #pdf-viewer iframe {
            width: 100%;
            height: 650px;
            border: none; /* Optional: removes the border */
        }

        /* Mobile devices */
        @media (max-width: 768px) {
            #pdf-viewer iframe {
                height: 300px; /* Adjust height for mobile devices */
            }
        }
    </style>
    <!-- PDF.js CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.8.335/pdf_viewer.min.css"/>

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
                    <h1 class="text-white">Blog Details</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="/">Home</a></li>
                    <li>Blog Details</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb row END -->
        <div class="content-block">
            <div class="section-area section-sp1">
                <div class="container">
                    <div class="row">
                        <!-- Left part start -->
                        <div class="col-lg-8 col-xl-8">
                            <!-- blog start -->
                            <div class="recent-news blog-lg">
                                <div class="action-box blog-lg">
                                    <img src="${pdfInfo.thumbnailPath}" alt="">
                                </div>
                                <div class="info-bx">
                                    <ul class="media-post">
                                        <li><a href="#"><i class="fa fa-calendar"></i>${pdfInfo.lastModified}</a></li>
                                        <li><a href="#"><i class="fa fa-comments-o"></i>${pdfInfo.size}Kb</a></li>
                                    </ul>
                                    <h5 class="post-title"><a href="#">${pdfInfo.fileName}</a></h5>
                                    <div id="pdf-viewer">
                                        <iframe id="pc-tab" src="${pageContext.request.contextPath}${pdfPath}" allowfullscreen webkitallowfullscreen></iframe>
                                    </div>
                                    <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>
                                    <div class="widget_tag_cloud">
                                        <h6>TAGS</h6>
                                        <div class="tagcloud">
                                            <a href="/documents/list">Research Document</a>
                                            <a href="/documents/view?fileName=${pdfInfo.fileName}">${pdfInfo.fileName}</a>
                                        </div>
                                    </div>
                                    <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>
                                    <h6>SHARE </h6>
                                    <ul class="list-inline contact-social-bx">
                                        <li><a href="#" class="btn outline radius-xl"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#" class="btn outline radius-xl"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#" class="btn outline radius-xl"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="#" class="btn outline radius-xl"><i class="fa fa-google-plus"></i></a></li>
                                    </ul>
                                    <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>
                                </div>
                            </div>

                                    </div>
                        <jsp:include page="side-bar.jsp"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <!-- Footer END ==== -->
    <!-- scroll top button -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.8.335/pdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.8.335/pdf.worker.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const pdfViewer = document.getElementById('pdf-viewer');
        const pdfViewerWidth = pdfViewer.clientWidth; // Get the width of the pdf-viewer container

        const iframe = document.getElementById('pc-tab');
        if(/Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Kindle|Silk-Accelerated|(hpw|web)OS|Opera M(obi|ini)/.test(navigator.userAgent)) {
            iframe.remove();
            const pdfjsLib = window['pdfjs-dist/build/pdf'];
            pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.8.335/pdf.worker.min.js';
            pdfjsLib.getDocument('${pageContext.request.contextPath}${pdfPath}').promise.then(function(pdfDoc_) {
                console.log('PDF loaded');
                var numPages = pdfDoc_.numPages;
                console.log('Number of Pages: ' + numPages);

                for(let pageNum = 1; pageNum <= numPages; pageNum++) {
                    pdfDoc_.getPage(pageNum).then(function(page) {
                        var unscaledViewport = page.getViewport({scale: 1.0});
                        var scale = pdfViewerWidth / unscaledViewport.width; // Calculate scale based on the pdf-viewer width
                        scale = Math.min(scale, 1.5); // Adjust this value as needed

                        var viewport = page.getViewport({scale: scale});
                        var canvas = document.createElement('canvas');
                        canvas.id = 'pdf-canvas-' + pageNum;
                        var context = canvas.getContext('2d');
                        canvas.height = viewport.height;
                        canvas.width = viewport.width;

                        document.getElementById('pdf-viewer').appendChild(canvas);

                        var renderContext = {
                            canvasContext: context,
                            viewport: viewport
                        };
                        var renderTask = page.render(renderContext);
                        renderTask.promise.then(function () {
                            console.log('Page ' + pageNum + ' rendered');
                        });
                    });
                }
            }).catch(function(error) {
                console.log(error);
            });
        }
    });
</script>
</body>

</html>