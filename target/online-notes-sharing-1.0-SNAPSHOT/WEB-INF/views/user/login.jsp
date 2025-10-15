<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ScholarShare - Login</title>
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <div class="container-fluid bg-light py-5">
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6">
                <div class="card shadow">
                    <div class="card-header text-center">
                        <h3 class="mb-0">
                            <i class="fas fa-sign-in-alt me-2"></i>ScholarShare Login
                        </h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty success}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${success}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/user/login" method="post" autocomplete="off">
                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    <i class="fas fa-envelope me-2"></i>Email Address
                                </label>
                                <input type="email" class="form-control" id="email" name="email" required autocomplete="off" placeholder="Enter your email">
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label">
                                    <i class="fas fa-lock me-2"></i>Password
                                </label>
                                <input type="password" class="form-control" id="password" name="password" required autocomplete="off" placeholder="Enter your password">
                            </div>
                            
                            <div class="d-grid mb-3">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-sign-in-alt me-2"></i>Login
                                </button>
                            </div>
                            
                            <div class="text-center">
                                <p class="mb-0">Don't have an account? 
                                    <a href="${pageContext.request.contextPath}/user/register" class="text-decoration-none">
                                        <i class="fas fa-user-plus me-1"></i>Register here
                                    </a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/" class="text-decoration-none">
                        <i class="fas fa-arrow-left me-1"></i>Back to Home
                    </a>
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
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/register">Register</a></li>
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
        // Prevent browser autofill and ensure form works correctly
        document.addEventListener('DOMContentLoaded', function() {
            var emailInput = document.getElementById('email');
            var passwordInput = document.getElementById('password');
            
            // Clear any autofilled values on page load
            if (emailInput) {
                emailInput.value = '';
            }
            if (passwordInput) {
                passwordInput.value = '';
            }
            
            // Prevent autocomplete
            if (emailInput) {
                emailInput.setAttribute('autocomplete', 'off');
            }
            if (passwordInput) {
                passwordInput.setAttribute('autocomplete', 'off');
            }
        });
    </script>
</body>
</html>