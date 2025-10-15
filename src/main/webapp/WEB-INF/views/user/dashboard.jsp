<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ScholarShare - Dashboard</title>
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/dashboard">
                <img src="${pageContext.request.contextPath}/resources/images/favicon.svg" alt="ScholarShare" width="30" height="30" class="d-inline-block align-text-top me-2">
                ScholarShare
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <span class="navbar-text me-3">
                        <i class="fas fa-user-circle me-1"></i>Welcome, ${user.name}
                    </span>
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/upload">
                        <i class="fas fa-upload me-1"></i>Upload Notes
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/view">
                        <i class="fas fa-book-reader me-1"></i>View Notes
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/clipboard/dashboard">
                        <i class="fas fa-link me-1"></i>Clipboard
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/logout">
                        <i class="fas fa-sign-out-alt me-1"></i>Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h2 class="mb-4">ScholarShare Dashboard</h2>
                <p class="lead">Welcome back, ${user.name}! Here's what you can do today.</p>
                
                <!-- Action Cards -->
                <div class="row mt-4 g-4">
                    <div class="col-md-4">
                        <div class="card note-card h-100">
                            <div class="card-body text-center">
                                <div class="icon-lg text-primary">
                                    <i class="fas fa-upload"></i>
                                </div>
                                <h5 class="card-title">Upload Notes</h5>
                                <p class="card-text">Share your study materials with other students.</p>
                                <a href="${pageContext.request.contextPath}/user/upload" class="btn btn-primary">
                                    <i class="fas fa-arrow-right me-1"></i>Upload
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card note-card h-100">
                            <div class="card-body text-center">
                                <div class="icon-lg text-success">
                                    <i class="fas fa-download"></i>
                                </div>
                                <h5 class="card-title">View Notes</h5>
                                <p class="card-text">Browse and download study materials shared by others.</p>
                                <a href="${pageContext.request.contextPath}/user/view" class="btn btn-success">
                                    <i class="fas fa-arrow-right me-1"></i>View
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card note-card h-100">
                            <div class="card-body text-center">
                                <div class="icon-lg text-info">
                                    <i class="fas fa-link"></i>
                                </div>
                                <h5 class="card-title">Clipboard</h5>
                                <p class="card-text">Add document links and share unique codes.</p>
                                <a href="${pageContext.request.contextPath}/clipboard/dashboard" class="btn btn-info">
                                    <i class="fas fa-arrow-right me-1"></i>Clipboard
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recently Approved Notes -->
                <div class="row mt-5">
                    <div class="col-md-12">
                        <h3 class="mb-4">Recently Approved Notes</h3>
                        <c:if test="${empty notes}">
                            <div class="alert alert-info text-center">
                                <i class="fas fa-info-circle me-2"></i>No notes available at the moment. Check back later!
                            </div>
                        </c:if>
                        <c:if test="${not empty notes}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Uploaded By</th>
                                            <th>Upload Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="note" items="${notes}">
                                            <tr>
                                                <td>
                                                    <strong>${note.title}</strong>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${note.description != null && fn:length(note.description) > 50}">
                                                            ${fn:substring(note.description, 0, 50)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${note.description}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <span class="badge bg-secondary">
                                                        <i class="fas fa-user me-1"></i>${note.uploadedBy.name}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="text-muted">
                                                        <i class="fas fa-calendar me-1"></i>${note.uploadDate}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/user/download/${note.id}" 
                                                       class="btn btn-sm btn-primary">
                                                        <i class="fas fa-download me-1"></i>Download
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>ScholarShare</h5>
                    <p>Share your study materials and access notes from other students.</p>
                </div>
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/user/upload">Upload Notes</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/view">View Notes</a></li>
                        <li><a href="${pageContext.request.contextPath}/clipboard/dashboard">Clipboard</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>User</h5>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
            <hr class="my-4">
            <div class="text-center">
                <p>&copy; 2025 ScholarShare. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>