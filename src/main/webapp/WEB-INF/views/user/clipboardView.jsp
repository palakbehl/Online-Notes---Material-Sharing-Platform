<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ScholarShare - Clipboard Document</title>
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/resources/images/favicon.svg" alt="ScholarShare" width="30" height="30" class="d-inline-block align-text-top me-2">
                ScholarShare
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <c:if test="${empty sessionScope.loggedInUser}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/login">
                            <i class="fas fa-sign-in-alt me-1"></i>Login
                        </a>
                    </c:if>
                    <c:if test="${not empty sessionScope.loggedInUser}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">
                            <i class="fas fa-home me-1"></i>Dashboard
                        </a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/logout">
                            <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <div class="text-center mt-4">
                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                            <i class="fas fa-home me-2"></i>Go to Home
                        </a>
                    </div>
                </c:if>
                
                <c:if test="${empty error && not empty clipboard}">
                    <div class="card shadow">
                        <div class="card-header text-center">
                            <h3 class="mb-0">
                                <i class="fas fa-file-alt me-2"></i>ScholarShare Document Access
                            </h3>
                        </div>
                        <div class="card-body text-center">
                            <c:if test="${not empty clipboard.description}">
                                <h4 class="mb-4">${clipboard.description}</h4>
                            </c:if>
                            
                            <div class="mb-4">
                                <span class="badge bg-secondary">
                                    <i class="fas fa-user me-1"></i>Added by: ${clipboard.createdBy.name}
                                </span>
                                <span class="badge bg-info ms-2">
                                    <i class="fas fa-calendar me-1"></i>${clipboard.createdDate}
                                </span>
                            </div>
                            
                            <div class="alert alert-info">
                                <h5 class="mb-3">
                                    <i class="fas fa-link me-2"></i>Document Link
                                </h5>
                                <p>
                                    <a href="${clipboard.documentLink}" target="_blank" rel="noopener noreferrer" class="btn btn-lg btn-success">
                                        <i class="fas fa-external-link-alt me-2"></i>Access Document
                                    </a>
                                </p>
                                <p class="text-muted mb-0">
                                    <small>Click the button above to access the document</small>
                                </p>
                            </div>
                            
                            <div class="mt-4">
                                <h5 class="mb-3">
                                    <i class="fas fa-copy me-2"></i>Share Options
                                </h5>
                                
                                <div class="mb-3">
                                    <label class="form-label">Direct Document URL:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="${clipboard.documentLink}" readonly>
                                        <button class="btn btn-outline-primary copy-btn" type="button" 
                                                data-text="${clipboard.documentLink}" title="Copy URL">
                                            <i class="fas fa-copy"></i>
                                        </button>
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Clipboard Share URL:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" 
                                               value="${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/clipboard/view/${clipboard.uniqueCode}" readonly>
                                        <button class="btn btn-outline-primary copy-btn" type="button" 
                                                data-text="${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/clipboard/view/${clipboard.uniqueCode}" title="Copy Share URL">
                                            <i class="fas fa-copy"></i>
                                        </button>
                                    </div>
                                    <div class="form-text">
                                        Share this URL with others to give them access to this document
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
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
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/login">Login</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Support</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Contact Us</a></li>
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
    <script>
        // Copy to clipboard functionality
        document.addEventListener('DOMContentLoaded', function() {
            const copyButtons = document.querySelectorAll('.copy-btn');
            
            copyButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const text = this.getAttribute('data-text');
                    navigator.clipboard.writeText(text).then(() => {
                        // Show feedback
                        const originalIcon = this.innerHTML;
                        this.innerHTML = '<i class="fas fa-check"></i>';
                        setTimeout(() => {
                            this.innerHTML = originalIcon;
                        }, 2000);
                    }).catch(err => {
                        console.error('Failed to copy: ', err);
                    });
                });
            });
        });
    </script>
</body>
</html>