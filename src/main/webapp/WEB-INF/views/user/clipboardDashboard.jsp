<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ScholarShare - Clipboard Dashboard</title>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">
                        <i class="fas fa-home me-1"></i>Dashboard
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/upload">
                        <i class="fas fa-upload me-1"></i>Upload Notes
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/user/view">
                        <i class="fas fa-book-reader me-1"></i>View Notes
                    </a>
                    <a class="nav-link active" href="${pageContext.request.contextPath}/clipboard/dashboard">
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
                <h2 class="mb-4">ScholarShare Clipboard Dashboard</h2>
                <p class="lead">Add document links to your clipboard and share unique codes with others.</p>
                
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
                
                <div class="row mt-4 g-4">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Add New Document Link</h5>
                            </div>
                            <div class="card-body">
                                <form:form modelAttribute="clipboard" action="${pageContext.request.contextPath}/clipboard/create" method="post">
                                    <div class="mb-3">
                                        <form:label path="documentLink" class="form-label">Document Link:</form:label>
                                        <form:input path="documentLink" type="url" class="form-control" required="required" placeholder="https://example.com/document"/>
                                        <div class="form-text">Enter the full URL of the document you want to share.</div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <form:label path="description" class="form-label">Description (Optional):</form:label>
                                        <form:textarea path="description" class="form-control" rows="3" placeholder="Brief description of the document"/>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <form:label path="uniqueCode" class="form-label">Unique Code (Optional):</form:label>
                                        <form:input path="uniqueCode" class="form-control" placeholder="Leave blank for auto-generation"/>
                                        <div class="form-text">Leave blank to generate a random code automatically.</div>
                                    </div>
                                    
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-plus me-2"></i>Add to Clipboard
                                        </button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>How to Use</h5>
                            </div>
                            <div class="card-body">
                                <ol>
                                    <li>Add a document link to your clipboard using the form</li>
                                    <li>A unique code will be generated automatically</li>
                                    <li>Share this code with others</li>
                                    <li>Others can access the document using the unique code</li>
                                </ol>
                                <div class="bg-light p-3 rounded">
                                    <p class="mb-1"><strong>Share URL:</strong></p>
                                    <p class="mb-0 text-muted">
                                        <code>${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/clipboard/view/[CODE]</code>
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card mt-4">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-lightbulb me-2"></i>Tips</h5>
                            </div>
                            <div class="card-body">
                                <ul class="mb-0">
                                    <li>Use descriptive titles for easy identification</li>
                                    <li>Generate custom codes for easier sharing</li>
                                    <li>Delete entries you no longer need</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row mt-5">
                    <div class="col-md-12">
                        <h3 class="mb-4">Your Clipboard Entries</h3>
                        <c:if test="${empty clipboards}">
                            <div class="alert alert-info text-center">
                                <i class="fas fa-info-circle me-2"></i>You haven't added any document links to your clipboard yet.
                            </div>
                        </c:if>
                        <c:if test="${not empty clipboards}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Code</th>
                                            <th>Document Link</th>
                                            <th>Description</th>
                                            <th>Date Added</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="clipboard" items="${clipboards}">
                                            <tr>
                                                <td>
                                                    <span class="clipboard-code">${clipboard.uniqueCode}</span>
                                                    <button class="btn btn-sm btn-outline-primary copy-btn ms-2" 
                                                            data-code="${clipboard.uniqueCode}"
                                                            title="Copy code">
                                                        <i class="fas fa-copy"></i>
                                                    </button>
                                                </td>
                                                <td>
                                                    <a href="${clipboard.documentLink}" target="_blank" rel="noopener noreferrer" class="text-truncate d-inline-block" style="max-width: 200px;">
                                                        ${clipboard.documentLink}
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${clipboard.description != null && fn:length(clipboard.description) > 50}">
                                                            ${fn:substring(clipboard.description, 0, 50)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${clipboard.description}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <span class="text-muted">
                                                        <i class="fas fa-calendar me-1"></i>${clipboard.createdDate}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/clipboard/view/${clipboard.uniqueCode}" 
                                                       class="btn btn-sm btn-outline-primary" target="_blank" title="View">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    <form action="${pageContext.request.contextPath}/clipboard/delete/${clipboard.id}" 
                                                          method="post" class="d-inline">
                                                        <button type="submit" class="btn btn-sm btn-outline-danger"
                                                                onclick="return confirm('Are you sure you want to delete this clipboard entry?')"
                                                                title="Delete">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </form>
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
                        <li><a href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/upload">Upload Notes</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/view">View Notes</a></li>
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
    <script>
        // Copy to clipboard functionality
        document.addEventListener('DOMContentLoaded', function() {
            const copyButtons = document.querySelectorAll('.copy-btn');
            
            copyButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const code = this.getAttribute('data-code');
                    navigator.clipboard.writeText(code).then(() => {
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