<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Online Notes System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">Admin Dashboard</a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">Welcome, Admin (${user.name})</span>
                <a class="nav-link" href="${pageContext.request.contextPath}/user/logout">Logout</a>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h2>Admin Dashboard</h2>
                <p>Welcome to the admin dashboard. Here you can manage users and study materials.</p>
                
                <ul class="nav nav-tabs" id="adminTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pending-tab" data-bs-toggle="tab" data-bs-target="#pending" type="button" role="tab">Pending Notes</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="users-tab" data-bs-toggle="tab" data-bs-target="#users" type="button" role="tab">Manage Users</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="adminTabsContent">
                    <!-- Pending Notes Tab -->
                    <div class="tab-pane fade show active" id="pending" role="tabpanel">
                        <div class="row mt-4">
                            <div class="col-md-12">
                                <h3>Pending Notes for Approval</h3>
                                <c:if test="${empty pendingNotes}">
                                    <div class="alert alert-info">No pending notes for approval.</div>
                                </c:if>
                                <c:if test="${not empty pendingNotes}">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Description</th>
                                                    <th>Uploaded By</th>
                                                    <th>Upload Date</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="note" items="${pendingNotes}">
                                                    <tr>
                                                        <td>${note.title}</td>
                                                        <td>${note.description}</td>
                                                        <td>${note.uploadedBy.name}</td>
                                                        <td>${note.uploadDate}</td>
                                                        <td>
                                                            <form action="${pageContext.request.contextPath}/admin/approveNote/${note.id}" method="post" class="d-inline">
                                                                <button type="submit" class="btn btn-sm btn-success">Approve</button>
                                                            </form>
                                                            <form action="${pageContext.request.contextPath}/admin/rejectNote/${note.id}" method="post" class="d-inline">
                                                                <button type="submit" class="btn btn-sm btn-warning">Reject</button>
                                                            </form>
                                                            <form action="${pageContext.request.contextPath}/admin/deleteNote/${note.id}" method="post" class="d-inline">
                                                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
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
                    
                    <!-- Manage Users Tab -->
                    <div class="tab-pane fade" id="users" role="tabpanel">
                        <div class="row mt-4">
                            <div class="col-md-12">
                                <h3>Manage Users</h3>
                                <c:if test="${empty users}">
                                    <div class="alert alert-info">No users found.</div>
                                </c:if>
                                <c:if test="${not empty users}">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${users}">
                                                    <tr>
                                                        <td>${user.name}</td>
                                                        <td>${user.email}</td>
                                                        <td>${user.role}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${user.status == 'active'}">
                                                                    <span class="badge bg-success">Active</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-secondary">Inactive</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:if test="${user.status == 'active'}">
                                                                <form action="${pageContext.request.contextPath}/admin/deactivateUser/${user.id}" method="post" class="d-inline">
                                                                    <button type="submit" class="btn btn-sm btn-warning">Deactivate</button>
                                                                </form>
                                                            </c:if>
                                                            <c:if test="${user.status == 'inactive'}">
                                                                <form action="${pageContext.request.contextPath}/admin/activateUser/${user.id}" method="post" class="d-inline">
                                                                    <button type="submit" class="btn btn-sm btn-success">Activate</button>
                                                                </form>
                                                            </c:if>
                                                            
                                                            <c:if test="${user.role != 'admin'}">
                                                                <form action="${pageContext.request.contextPath}/admin/deleteUser/${user.id}" method="post" class="d-inline">
                                                                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                                                </form>
                                                            </c:if>
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
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>