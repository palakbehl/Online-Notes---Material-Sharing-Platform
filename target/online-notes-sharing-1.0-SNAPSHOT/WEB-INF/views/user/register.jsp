<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ScholarShare - Register</title>
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/resources/images/favicon.svg">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <div class="container mt-5">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/resources/images/favicon.svg" alt="ScholarShare" width="30" height="30" class="d-inline-block align-text-top me-2">
                    ScholarShare
                </a>
            </div>
        </nav>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3><i class="fas fa-user-plus me-2"></i>ScholarShare Registration</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/user/register" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Full Name:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirm Password:</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Register</button>
                            </div>
                        </form>
                        
                        <div class="text-center mt-3">
                            <p>Already have an account? <a href="${pageContext.request.contextPath}/user/login">Login here</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
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
</body>
</html>