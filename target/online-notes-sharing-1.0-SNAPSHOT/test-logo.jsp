<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logo Test</title>
</head>
<body>
    <h1>Logo Test Page</h1>
    
    <h2>Testing logo.svg:</h2>
    <img src="${pageContext.request.contextPath}/resources/images/logo.svg" alt="Logo SVG" style="max-height: 60px;">
    
    <h2>Testing favicon.svg:</h2>
    <img src="${pageContext.request.contextPath}/resources/images/favicon.svg" alt="Favicon SVG" style="max-height: 30px;">
    
    <h2>Absolute path test:</h2>
    <img src="/notes/resources/images/logo.svg" alt="Logo SVG Absolute" style="max-height: 60px;">
    
    <h2>Direct file path test:</h2>
    <p>File exists: <%= new java.io.File(application.getRealPath("/resources/images/logo.svg")).exists() %></p>
    <p>File path: <%= application.getRealPath("/resources/images/logo.svg") %></p>
</body>
</html>