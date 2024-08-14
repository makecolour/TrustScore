<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

	<!-- META ============================================= -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="Trust Management, contact, address, Research Festival, ResFes, FPTEdu, LLM, data, TFT score, large language model, trust worthiness, social networks, knowledge graph, FPT University" />
	<meta name="author" content="Trust Management" />
	<meta name=”robots” content=”all” />

	<!-- DESCRIPTION -->
	<meta name="description" content="Trust Management: Contact" />

	<!-- OG -->
	<meta property="og:title" content="Trust Management: Contact" />
	<meta property="og:description" content="Trust Management: Contact" />
	<meta property="og:image" content="/assets/images/favicon.png" />
	<meta name="format-detection" content="telephone=no">
	<meta property="og:url" content="${pageContext.request.contextPath}/">
	<meta name="twitter:card" content="/assets/images/logo-white-2.png">

	<!--  Non-Essential, But Recommended -->
	<meta property="og:description" content="Landing page of Trust Management project">
	<meta property="og:site_name" content="Trust Management: Contact Us">
	<meta name="twitter:image:alt" content="Trust Management">
	
	<!-- FAVICONS ICON ============================================= -->
	<link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.png" />
	
	<!-- PAGE TITLE HERE ============================================= -->
	<title>Trust Management: Contact Us</title>
	
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
        <div class="page-banner ovbl-dark" style="background-image:url(/assets/images/gallery/resfes.png);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">Contact Us</h1>
				 </div>
            </div>
        </div>
		<!-- Breadcrumb row -->
		<div class="breadcrumb-row">
			<div class="container">
				<ul class="list-inline">
					<li><a href="/">Home</a></li>
					<li>Contact Us</li>
				</ul>
			</div>
		</div>
		<!-- Breadcrumb row END -->
		<div id="overlay" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.7); z-index:1000; justify-content:center; align-items:center;">
			<div style="position:relative; width:80%; max-width:800px; background-color:white; padding:20px; border-radius:10px;">
				<button id="close-overlay" style="position:absolute; top:5px; right:10px; background:none; border:none; font-size:30px; cursor:pointer;">&times;</button>
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.5063419425232!2d105.52271427509262!3d21.01241668063286!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1723633772379!5m2!1svi!2s" class="align-self-stretch d-flex" style="width:100%; min-width:100%; min-height:400px;" allowfullscreen></iframe>
			</div>
		</div>
        <!-- inner page banner -->
        <div class="page-banner contact-page section-sp2">
            <div class="container">
                <div class="row">
					<div class="col-lg-5 col-md-5 m-b30">
						<div class="bg-primary text-white contact-info-bx">
							<h2 class="m-b10 title-head">Contact <span>Information</span></h2>
							<p>If you have any suggestions or contributions for the project, please feel free to contact us using the adjacent form, or directly:</p>
							<div class="widget widget_getintuch">	
								<ul>
									<li id="location-link"><i class="ti-location-pin"></i>FPT University, Hoa Lac Hi-tech Park, km 29, Thang Long Avenue, Thach That Province, Hanoi, Vietnam</li>
<%--									<li><i class="ti-mobile"></i></li>--%>
									<li id="email"><i class="ti-email"></i>${email}</li>
								</ul>
							</div>
							<h5 class="m-t0 m-b20">Share This Project</h5>
							<ul class="list-inline contact-social-bx">
								<li><a href="https://www.facebook.com/sharer/sharer.php?u=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/documents/view?fileName=${pdfInfo.fileName}" class="btn outline radius-xl" target="_blank"><i class="fa fa-facebook"></i></a></li>
								<li><a href="https://twitter.com/intent/tweet?url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/documents/view?fileName=${pdfInfo.fileName}&text=Check%20this%20out!" class="btn outline radius-xl" target="_blank"><i class="fa fa-twitter"></i></a></li>
								<li><a href="https://www.linkedin.com/shareArticle?mini=true&url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/documents/view?fileName=${pdfInfo.fileName}&title=Check%20this%20out!" class="btn outline radius-xl" target="_blank"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>

					</div>
					<div class="col-lg-7 col-md-7">

						<form class="contact-bx ajax-form" action="/contact" method="post">
							<c:if test="${type != null}">
								<div class="ajax-message">
									<c:choose>
										<c:when test="${type == 'success'}">
											<div class="alert alert-success">
												<strong>Success!</strong> ${msg}
											</div>
										</c:when>
										<c:when test="${type == 'error'}">
											<div class="alert alert-danger">
												<strong>Error!</strong> ${msg}
											</div>
										</c:when>
									</c:choose>
								</div>
							</c:if>

							<div class="heading-bx left">
								<h2 class="title-head">Get In <span>Touch</span></h2>
								<p>Send us a message and we will get back to you!</p>
							</div>
							<div class="row placeani">
								<div class="col-lg-6">
									<div class="form-group">
										<div class="input-group">
											<label>Your Name</label>
											<input name="name" type="text" required class="form-control valid-character">
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<div class="input-group">
											<label>Your Email Address</label>
											<input name="email" type="email" class="form-control" required <c:if test="${guestEmail != null}">value="${guestEmail}"</c:if>>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<div class="input-group">
											<label>Your Phone</label>
											<input name="phone" type="text" required class="form-control int-value">
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<div class="input-group">
											<label>Subject</label>
											<input name="subject" type="text" required class="form-control">
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group">
											<label>Type Message</label>
											<textarea name="message" rows="4" class="form-control" required ></textarea>
										</div>
									</div>
								</div>

								<div class="col-lg-12">
									<div class="form-group">
										<div class="input-group">
											<div class="g-recaptcha" data-sitekey="${siteKey}"></div>
										</div>
									</div>
								</div>

								<div class="col-lg-12">
									<button name="submit" type="submit" value="Submit" class="btn button-md"> Send Message</button>
								</div>
							</div>
						</form>
					</div>
				</div>
            </div>
		</div>
        <!-- inner page banner END -->
    </div>
    <!-- Content END-->
	<jsp:include page="footer.jsp"></jsp:include>
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
<script>
	document.getElementById('location-link').addEventListener('click', function() {
		document.getElementById('overlay').style.display = 'flex';
	});

	document.getElementById('close-overlay').addEventListener('click', function() {
		document.getElementById('overlay').style.display = 'none';
	});
	document.getElementById('email').addEventListener('click', function() {
		window.location.href = 'mailto:' + this.innerText + '?subject=Trust%20Management%20Project';
	});
</script>
<script src='/assets/vendors/switcher/switcher.js'></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>


</html>
