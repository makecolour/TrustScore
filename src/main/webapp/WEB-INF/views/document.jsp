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
    <meta name="description" content="Trust Management: ${pdfInfo.fileName}" />

    <!-- OG -->
    <meta property="og:title" content="Trust Management: ${pdfInfo.fileName}" />
    <meta property="og:description" content="Trust Management: ${pdfInfo.fileName}" />
    <meta property="og:image" content="" />
    <meta name="format-detection" content="telephone=no">

    <!-- FAVICONS ICON ============================================= -->
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png" />

    <!-- PAGE TITLE HERE ============================================= -->
    <title>Trust Management: ${pdfInfo.fileName}</title>

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
                    <h1 class="text-white">Research Document: ${pdfInfo.fileName.toString().replace(".pdf", "")}</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="/">Home</a></li>
                    <li>Research Document: ${pdfInfo.fileName.toString().replace(".pdf", "")}</li>
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
                                        <li><a href="${pageContext.request.contextPath}${pdfPath}"><i class="fa fa-calendar"></i>${pdfInfo.lastModified}</a></li>
                                        <li><a href="${pageContext.request.contextPath}${pdfPath}"><i class="fa fa-hdd-o"></i>${pdfInfo.size}Kb</a></li>
                                    </ul>
                                    <h5 class="post-title"><a href="${pageContext.request.contextPath}${pdfPath}">${pdfInfo.fileName.toString().replace(".pdf", "")}</a></h5>
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
                                        <li><a href="https://www.facebook.com/sharer/sharer.php?u=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/documents/view?fileName=${pdfInfo.fileName}" class="btn outline radius-xl" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="https://twitter.com/intent/tweet?url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/documents/view?fileName=${pdfInfo.fileName}&text=Check%20this%20out!" class="btn outline radius-xl" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="https://www.linkedin.com/shareArticle?mini=true&url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/documents/view?fileName=${pdfInfo.fileName}&title=Check%20this%20out!" class="btn outline radius-xl" target="_blank"><i class="fa fa-linkedin"></i></a></li>
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

            // Create a div to contain the label and range input
            const scaleContainer = document.createElement('div');
            scaleContainer.classList.add('form-group', 'row', 'col-12');

            // Create a label for the range input
            const scaleLabel = document.createElement('label');
            scaleLabel.htmlFor = 'scaleInput';
            scaleLabel.innerText = 'Sharpness: 5';
            scaleLabel.classList.add('form-label', 'col-md-3', 'col-xs-3');

            // Create a range input for selecting the viewport scale
            const scaleInput = document.createElement('input');
            scaleInput.type = 'range';
            scaleInput.min = '1';
            scaleInput.max = '7';
            scaleInput.step = '0.5';
            scaleInput.value = '5';
            scaleInput.id = 'scaleInput';
            scaleInput.classList.add('form-control', 'col-md-7', 'col-xs-7');

            // Append the label and input to the div
            scaleContainer.appendChild(scaleLabel);
            scaleContainer.appendChild(scaleInput);

            // Ensure the parent element exists before inserting the new nodes
            if (pdfViewer && pdfViewer.parentNode) {
                pdfViewer.parentNode.insertBefore(scaleContainer, pdfViewer);
            }

            // Function to render the PDF pages
            function renderPDF(scale) {
                pdfjsLib.getDocument('${pageContext.request.contextPath}${pdfPath}').promise.then(function(pdfDoc_) {
                    console.log('PDF loaded');
                    var numPages = pdfDoc_.numPages;
                    console.log('Number of Pages: ' + numPages);

                    // Clear previous canvases
                    pdfViewer.innerHTML = '';

                    for(let pageNum = 1; pageNum <= numPages; pageNum++) {
                        pdfDoc_.getPage(pageNum).then(function(page) {
                            var viewport = page.getViewport({scale: scale});
                            var canvas = document.createElement('canvas');
                            canvas.id = 'pdf-canvas-' + pageNum;
                            var context = canvas.getContext('2d');
                            canvas.height = viewport.height;
                            canvas.width = viewport.width;

                            // Adjust canvas size to fit the parent element
                            const adjustedScale = pdfViewerWidth / viewport.width;
                            canvas.style.width = pdfViewerWidth + 'px';
                            canvas.style.height = (viewport.height * adjustedScale) + 'px';

                            document.getElementById('pdf-viewer').appendChild(canvas);

                            var renderContext = {
                                canvasContext: context,
                                viewport: viewport
                            };
                            var renderTask = page.render(renderContext);
                            renderTask.promise.then(function () {
                                console.log('Page ' + pageNum + ' rendered');

                                // Create a footer for the page number
                                const footer = document.createElement('div');
                                footer.innerText = 'Page ' + pageNum + ' of ' + numPages;
                                footer.style.fontSize = '0.5em';
                                footer.style.textAlign = 'center';
                                canvas.parentNode.insertBefore(footer, canvas.nextSibling);
                            });
                        });
                    }
                }).catch(function(error) {
                    console.log(error);
                });
            }

            // Initial render with default scale
            renderPDF(scaleInput.value);

            // Update render when scale changes
            scaleInput.addEventListener('change', function() {
                scaleLabel.innerText = 'Sharpness: ' + this.value;
                renderPDF(this.value);
            });
        }
    });
</script>
</body>

</html>