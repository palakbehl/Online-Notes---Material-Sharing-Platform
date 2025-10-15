<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Notes - Online Notes System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/dashboard">Online Notes System</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/user/upload">Upload Notes</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/user/logout">Logout</a>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h2>Available Study Materials</h2>
                <p>Browse and download study materials shared by other students.</p>
                
                <c:if test="${empty notes}">
                    <div class="alert alert-info">No approved notes available at the moment.</div>
                </c:if>
                
                <c:if test="${not empty notes}">
                    <div class="row">
                        <c:forEach var="note" items="${notes}">
                            <div class="col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">${note.title}</h5>
                                        <p class="card-text">${note.description}</p>
                                        <p class="text-muted">
                                            <small>
                                                Uploaded by: ${note.uploadedBy.name}<br>
                                                Date: ${note.uploadDate}
                                            </small>
                                        </p>
                                        <c:if test="${not empty note.filePath}">
                                            <a href="${pageContext.request.contextPath}/uploads/${note.filePath}" class="btn btn-primary" download>Download File</a>
                                        </c:if>
                                        <c:if test="${not empty note.fileLink}">
                                            <a href="${note.fileLink}" class="btn btn-secondary" target="_blank">Open Link</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>