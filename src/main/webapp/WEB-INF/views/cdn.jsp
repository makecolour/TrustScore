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
<div id="tooltip" style="position: absolute; opacity: 0;"></div>

<div id="append-bar-chart" class="bar-chart">
    <svg id="bar-chart" width="1400" height="500"></svg>
</div>
<script src="https://cdn.jsdelivr.net/npm/d3@7"></script>
<script src="/js/graph/disjoint-graph.js"></script>

</body>
</html>
