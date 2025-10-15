<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Download Note - Online Notes System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/dashboard">Online Notes System</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/user/upload">Upload Notes</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/user/view">View Notes</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/user/logout">Logout</a>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>Download Study Material</h3>
                    </div>
                    <div class="card-body text-center">
                        <h4>${note.title}</h4>
                        <p>${note.description}</p>
                        <p class="text-muted">
                            <small>
                                Uploaded by: ${note.uploadedBy.name}<br>
                                Date: ${note.uploadDate}
                            </small>
                        </p>
                        
                        <c:if test="${not empty note.filePath}">
                            <a href="${pageContext.request.contextPath}/uploads/${note.filePath}" class="btn btn-primary btn-lg" download>Download File</a>
                        </c:if>
                        
                        <c:if test="${not empty note.fileLink}">
                            <a href="${note.fileLink}" class="btn btn-secondary btn-lg" target="_blank">Open Link</a>
                        </c:if>
                        
                        <div class="mt-3">
                            <a href="${pageContext.request.contextPath}/user/view" class="btn btn-outline-secondary">Back to Notes</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>