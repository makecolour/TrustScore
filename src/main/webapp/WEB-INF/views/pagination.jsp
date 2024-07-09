<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 03/07/2024
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-12 m-b20">
    <div aria-label="Page navigation" class="pagination-bx rounded-sm gray clearfix">
        <ul class="pagination">
            <c:if test="${currentPage > 0}">
                <li class="previous"><a href="${pageContext.request.contextPath}/list?q=${query}&page=${currentPage - 1}"><i class="ti-arrow-left"></i> Prev</a></li>
            </c:if>
            <c:if test="${totalPages <= 3}">
                <c:forEach var="i" begin="0" end="${totalPages-1}">
                    <li class=" ${i == currentPage ? 'active' : ''}"> <a href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">
                            ${i+1}</a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${totalPages > 3}">
                <c:forEach var="i" begin="0" end="3">
                    <li class="${i == currentPage ? 'active' : ''}"><a href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">
                            ${i+1}</a>
                    </li>

                </c:forEach>
                <li>
                    <a>...</a>
                </li>
                <c:if test="${currentPage < totalPages - 2}">
                    <c:if test="${currentPage > 3}">
                        <c:forEach var="i" begin="${currentPage-1}" end="${currentPage+1}">
                            <li class="${i == currentPage ? 'active' : ''}">
                                <a href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">${i+1}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a>...</a>
                        </li>
                    </c:if>

                </c:if>
                <c:forEach var="i" begin="${totalPages - 2}" end="${totalPages-1}">
                    <li class=" ${i == currentPage ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/list?q=${query}&page=${i}">${i+1}</a>
                    </li>
                </c:forEach>
            </c:if>
            <li>
                <a href="${pageContext.request.contextPath}/list?q=${query}&page=${currentPage + 1}">Next <i class="ti-arrow-right"></i></a></li>
        </ul>
    </div>
</div>
