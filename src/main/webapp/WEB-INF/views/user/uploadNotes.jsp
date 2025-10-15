<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Notes - Online Notes System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/dashboard">Online Notes System</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a>
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
                        <h3>Upload Study Material</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        
                        <c:if test="${not empty success}">
                            <div class="alert alert-success">${success}</div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/user/upload" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="title" class="form-label">Title:</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="description" class="form-label">Description:</label>
                                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label for="file" class="form-label">Upload File (PDF, DOC, etc.):</label>
                                <input type="file" class="form-control" id="file" name="file" accept=".pdf,.doc,.docx,.txt">
                            </div>
                            
                            <div class="mb-3">
                                <label for="fileLink" class="form-label">Or Provide a Link:</label>
                                <input type="url" class="form-control" id="fileLink" name="fileLink" placeholder="https://example.com/resource">
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Upload Note</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>