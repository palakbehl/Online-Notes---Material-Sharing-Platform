<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ScholarShare - Online Notes & Study Material Sharing Platform</title>
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <!-- Hero Section -->
    <div class="container-fluid bg-light py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <img src="${pageContext.request.contextPath}/resources/images/logo.svg" alt="ScholarShare Logo" class="img-fluid" style="max-height: 60px;">
                    </div>
                    <h1 class="display-4 fw-bold mb-4">ScholarShare</h1>
                    <p class="lead mb-4">Share your study materials and access notes from other students. Collaborate, learn, and succeed together.</p>
                    <div class="d-flex flex-wrap gap-3">
                        <a href="${pageContext.request.contextPath}/user/login" class="btn btn-primary btn-lg px-4 py-2">
                            <i class="fas fa-sign-in-alt me-2"></i>Login
                        </a>
                        <a href="${pageContext.request.contextPath}/user/register" class="btn btn-success btn-lg px-4 py-2">
                            <i class="fas fa-user-plus me-2"></i>Register
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="card note-card h-100">
                                <div class="card-body text-center">
                                    <div class="icon-lg text-primary">
                                        <i class="fas fa-file-upload"></i>
                                    </div>
                                    <h5 class="card-title">Upload Notes</h5>
                                    <p class="card-text">Share your study materials with the community.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card note-card h-100">
                                <div class="card-body text-center">
                                    <div class="icon-lg text-success">
                                        <i class="fas fa-download"></i>
                                    </div>
                                    <h5 class="card-title">Download Notes</h5>
                                    <p class="card-text">Access study materials shared by others.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card note-card h-100">
                                <div class="card-body text-center">
                                    <div class="icon-lg text-info">
                                        <i class="fas fa-link"></i>
                                    </div>
                                    <h5 class="card-title">Clipboard</h5>
                                    <p class="card-text">Share document links with unique codes.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card note-card h-100">
                                <div class="card-body text-center">
                                    <div class="icon-lg text-warning">
                                        <i class="fas fa-users"></i>
                                    </div>
                                    <h5 class="card-title">Community</h5>
                                    <p class="card-text">Connect with fellow students and educators.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <div class="container py-5">
        <div class="text-center mb-5">
            <h2>Key Features of ScholarShare</h2>
            <p class="lead">Everything you need for collaborative learning</p>
        </div>
        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 note-card">
                    <div class="card-body">
                        <div class="text-center mb-3">
                            <div class="icon-lg text-primary">
                                <i class="fas fa-cloud-upload-alt"></i>
                            </div>
                            <h5 class="card-title">Easy Upload</h5>
                        </div>
                        <p class="card-text">Upload your notes and study materials with just a few clicks. Support for various file formats.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100 note-card">
                    <div class="card-body">
                        <div class="text-center mb-3">
                            <div class="icon-lg text-success">
                                <i class="fas fa-search"></i>
                            </div>
                            <h5 class="card-title">Smart Search</h5>
                        </div>
                        <p class="card-text">Find exactly what you need with our powerful search functionality and filtering options.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100 note-card">
                    <div class="card-body">
                        <div class="text-center mb-3">
                            <div class="icon-lg text-info">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <h5 class="card-title">Secure Sharing</h5>
                        </div>
                        <p class="card-text">All uploads are moderated and protected to ensure a safe learning environment.</p>
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
                    <p>A platform for students to share and access study materials collaboratively.</p>
                </div>
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/user/login">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/register">Register</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Contact</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-envelope me-2"></i> support@scholarshare.com</li>
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