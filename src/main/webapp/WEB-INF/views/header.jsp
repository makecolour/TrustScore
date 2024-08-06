<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 27/06/2024
  Time: 09:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<header class="header rs-nav header-transparent">
    <div class="sticky-header navbar-expand-lg">
        <div class="menu-bar clearfix">
            <div class="container clearfix">
                <!-- Header Logo ==== -->
                <div class="menu-logo">
                    <a href="/"><img src="/assets/images/logo-white.png" alt=""></a>
                </div>
                <!-- Mobile Nav Button ==== -->
                <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <!-- Author Nav ==== -->
                <div class="secondary-menu">
                    <div class="secondary-inner">
                        <ul>
<%--                            <li><a href="javascript:;" class="btn-link"><i class="fa fa-facebook"></i></a></li>--%>
                            <li><a href="mailto:Duongpv14@fe.edu.vn?subject=Trust Management" class="btn-link"><i class="fa fa-google-plus"></i></a></li>
<%--                            <li><a href="javascript:;" class="btn-link"><i class="fa fa-linkedin"></i></a></li>--%>
                            <!-- Search Button ==== -->
                            <li class="search-btn"><button id="quik-search-btn" type="button" class="btn-link"><i class="fa fa-search"></i></button></li>
                        </ul>
                    </div>
                </div>
                <!-- Search Box ==== -->
                <div class="nav-search-bar">
                    <form action="/list" accept-charset="UTF-8">
                        <input value="" type="text" class="form-control" name="q" placeholder="Find a service provider">
                        <span><i class="ti-search"></i></span>
                    </form>
                    <span id="search-remove"><i class="ti-close"></i></span>
                </div>
                <!-- Navigation Menu ==== -->
                <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                    <div class="menu-logo">
                        <a href="/"><img src="/assets/images/logo.png" alt=""></a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="/">Home</a>
                        </li>
                        <li><a href="/list">Service Providers</a>
                        </li>
                        <li class="add-mega-menu"><a href="javascript:">Documents <i class="fa fa-chevron-down"></i></a>
                            <ul class="sub-menu add-menu">
                                <li class="add-menu-left">
                                    <h5 class="menu-adv-title">Documents</h5>
                                    <ul>
                                        <li><a href="/documents/list">Research Documents </a></li>
                                        <li><a href="/">Resfes Presentation</a></li>
                                    </ul>
                                </li>
                                <li class="add-menu-right">
                                    <img src="/assets/images/adv/adv.jpg" alt=""/>
                                </li>
                            </ul>
                        </li>
                        <li><a href="/about">About us</a>
<%--                            <ul class="sub-menu">--%>
<%--                                <li><a href="blog-classic-grid.html">Blog Classic</a></li>--%>
<%--                                <li><a href="blog-classic-sidebar.html">Blog Classic Sidebar</a></li>--%>
<%--                                <li><a href="blog-list-sidebar.html">Blog List Sidebar</a></li>--%>
<%--                                <li><a href="blog-standard-sidebar.html">Blog Standard Sidebar</a></li>--%>
<%--                                <li><a href="blog-details.html">Blog Details</a></li>--%>
<%--                            </ul>--%>
                        </li>
                    </ul>
                    <div class="nav-social-link">
                        <a href="javascript:"><i class="fa fa-facebook"></i></a>
                        <a href="javascript:"><i class="fa fa-google-plus"></i></a>
                        <a href="javascript:"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
                <!-- Navigation Menu END ==== -->
            </div>
        </div>
    </div>
</header>
</html>
