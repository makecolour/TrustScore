<%--
  Created by IntelliJ IDEA.
  User: quyen
  Date: 23/06/2024
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="row" id="bar-chart-append">
    <div class="container" style="margin: 20px; margin-top: 0px">
        <input type="number" id="numofservice" placeholder="Number of service providers" class="col-3" step="10" min="0">
        <select id="select-order" class="col-8">
            <h6 class="dropdown-item-text">Order</h6>
            <option value="alphabetical">Alphabetical</option>
            <option value="ascending">TFT Score, ascending</option>
            <option value="descending" selected>TFT Score, descending</option>
        </select>
    </div>
    <div id="tooltip2" class="tooltip bs-tooltip-bottom"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/d3@7"></script>
<script src="/js/graph/graphs.js"></script>

</body>
</html>
