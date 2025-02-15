<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 27/06/2024
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<footer>
    <div class="footer-top">
        <div class="pt-exebar">
            <div class="container">
                <div class="d-flex align-items-stretch">
                    <div class="pt-logo mr-auto col-3">
                        <a href="/"><img src="/assets/images/logo-white.png" alt=""/></a>
                    </div>
                    <div class="pt-social-link">
                        <ul class="list-inline m-a0">
                            <li><a href="https://www.facebook.com/sharer/sharer.php?u=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" class="btn-link" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="https://twitter.com/intent/tweet?url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}&text=Trust%20Management%20project" class="btn-link" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="https://www.linkedin.com/shareArticle?mini=true&url=${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}&title=Trust%20Management%20project" class="btn-link" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                    <div class="pt-btn-join">
                        <a href="/contact" class="btn ">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12 footer-col-4">
                    <div class="widget">
                        <h5 class="footer-title">Trust Management</h5>
                        <p class="text-capitalize m-b20">A Novel Approach of Reputation Trust Metric Based on Knowledge Graph Combined with Large Language Model for Improving Trust Worthiness Calculation on Social Networks</p>
                        <div class="subscribe-form m-b20">
                            <form class="subscription-form" action="/contact" method="get">
                                <div class="input-group">
                                    <input name="email" class="form-control" placeholder="Your Email Address" type="email">
                                    <span class="input-group-btn">
											<button name="submit" value="Submit" type="submit" class="btn"><i class="fa fa-arrow-right"></i></button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-5 col-md-7 col-sm-12">
                    <div class="row">
                        <div class="col-6 col-lg-6 col-md-6 col-sm-6">
                            <div class="widget footer_widget">
                                <h5 class="footer-title">The Project</h5>
                                <ul>
                                    <li><a href="/">Home</a></li>
                                    <li><a href="/list">Service Providers</a></li>
                                    <li><a href="/about">About Us</a></li>
                                    <li><a href="/contact">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-6 col-lg-6 col-md-6 col-sm-6">
                            <div class="widget footer_widget">
                                <h5 class="footer-title">Research Results</h5>
                                <ul>
                                    <li><a href="/documents/list">Research Documents</a></li>
                                    <li><a href="/">ResFes Presentation</a></li>
                                    <li><a href="https://github.com/makecolour/TrustScoreExtension" target="_blank">Trust Management Extension</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3 col-md-5 col-sm-12 footer-col-4">
                    <div class="widget widget_gallery gallery-grid-4">
                        <h5 class="footer-title">Services Gallery</h5>
                        <ul class="magnific-image">
                            <li><a href="/assets/images/services/food.png" class="magnific-anchor"><img src="/assets/images/services/food.png" alt=""></a></li>
                            <li><a href="/assets/images/services/transport.png" class="magnific-anchor"><img src="/assets/images/services/transport.png" alt=""></a></li>
                            <li><a href="/assets/images/services/edu.png" class="magnific-anchor"><img src="/assets/images/services/edu.png" alt=""></a></li>
                            <li><a href="/assets/images/services/rent.png" class="magnific-anchor"><img src="/assets/images/services/rent.png" alt=""></a></li>
                            <li><a href="/assets/images/services/cosmetic.png" class="magnific-anchor"><img src="/assets/images/services/cosmetic.png" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 text-center"> <a target="_blank" href="/">Trust Management</a></div>
            </div>
        </div>
    </div>
</footer>

</html>

