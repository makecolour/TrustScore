<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 09/07/2024
  Time: 07:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-lg-4 sticky-top">
    <aside class="side-bar sticky-top">
        <div class="widget">
            <h6 class="widget-title">Search</h6>
            <div class="search-bx style-1">
                <form role="search" method="post" action="/documents/list" accept-charset="UTF-8">
                    <div class="input-group">
                        <input name="q" class="form-control" placeholder="Search for documents..." type="text" value="${sessionScope.query}">
                        <span class="input-group-btn">
                            <button type="submit" class="fa fa-search text-primary"></button>
                        </span>
                    </div>
                </form>
            </div>
        </div>
        <div class="widget recent-posts-entry">
            <h6 class="widget-title">Recent Documents</h6>
            <div class="widget-post-bx">
                <c:if test="${empty newest}">
                    <p>No document available.</p>
                </c:if>
                <c:if test="${not empty newest}">
                    <c:forEach items="${newest}" var="file" varStatus="loop">
                        <div class="widget-post clearfix">
                            <div class="ttr-post-media"> <img src="${file.thumbnailPath}" width="200" height="143" alt=""> </div>
                            <div class="ttr-post-info">
                                <div class="ttr-post-header">
                                    <h6 class="post-title"><a href="/documents/view?fileName=${file.fileName}">${file.fileName}</a></h6>
                                </div>
                                <ul class="media-post">
                                    <li><a href="/documents/view?fileName=${file.fileName}"><i class="fa fa-calendar"></i><fmt:formatDate value="${file.lastModified}" type="both" dateStyle="medium" pattern="MMM dd yyyy"/></a></li>
                                    <li><a href="/documents/view?fileName=${file.fileName}"><i class="fa fa-comments-o"></i>${file.size}Kb</a></li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <div class="widget widget-newslatter">
            <h6 class="widget-title">Newsletter</h6>
            <div class="news-box">
                <p>Enter your e-mail and subscribe to our newsletter.</p>
                <form class="subscription-form" action="http://educhamp.themetrades.com/demo/assets/script/mailchamp.php" method="post">
                    <div class="ajax-message"></div>
                    <div class="input-group">
                        <input name="dzEmail" required="required" type="email" class="form-control" placeholder="Your Email Address"/>
                        <button name="submit" value="Submit" type="submit" class="btn black radius-no">
                            <i class="fa fa-paper-plane-o"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="widget widget_gallery gallery-grid-4">
            <h6 class="widget-title">Our Gallery</h6>
            <ul>
                <li><div><a href="#"><img src="/assets/images/gallery/pic2.jpg" alt=""></a></div></li>
                <li><div><a href="#"><img src="/assets/images/gallery/pic1.jpg" alt=""></a></div></li>
                <li><div><a href="#"><img src="/assets/images/gallery/pic5.jpg" alt=""></a></div></li>
                <li><div><a href="#"><img src="/assets/images/gallery/pic7.jpg" alt=""></a></div></li>
                <li><div><a href="#"><img src="/assets/images/gallery/pic8.jpg" alt=""></a></div></li>
                <li><div><a href="#"><img src="/assets/images/gallery/pic9.jpg" alt=""></a></div></li>
                <li><div><a href="#"><img src="/assets/images/gallery/pic3.jpg" alt=""></a></div></li>
                <li><div><a href="#"><img src="/assets/images/gallery/pic4.jpg" alt=""></a></div></li>
            </ul>
        </div>
        <div class="widget widget_tag_cloud">
            <h6 class="widget-title">Tags</h6>
            <div class="tagcloud">
                <a href="#">Design</a>
                <a href="#">User interface</a>
                <a href="#">SEO</a>
                <a href="#">WordPress</a>
                <a href="#">Development</a>
                <a href="#">Joomla</a>
                <a href="#">Design</a>
                <a href="#">User interface</a>
                <a href="#">SEO</a>
                <a href="#">WordPress</a>
                <a href="#">Development</a>
                <a href="#">Joomla</a>
                <a href="#">Design</a>
                <a href="#">User interface</a>
                <a href="#">SEO</a>
                <a href="#">WordPress</a>
                <a href="#">Development</a>
                <a href="#">Joomla</a>
            </div>
        </div>
    </aside>
</div>
