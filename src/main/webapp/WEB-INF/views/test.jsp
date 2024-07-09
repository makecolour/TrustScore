<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Embed PDF</title>
</head>
<body>
<h2>PDF Embed Example</h2>
<embed src="${path}" type="application/pdf" width="600" height="500" /><embed src="${pageContext.request.contextPath}/pdf/your-pdf-file-name.pdf" type="application/pdf" width="600" height="500" /></body>
</html>