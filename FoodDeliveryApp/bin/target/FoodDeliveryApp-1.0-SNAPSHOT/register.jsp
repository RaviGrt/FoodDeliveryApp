<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Food Delivery App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light py-5">
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="text-center mb-4">
                <h2 class="fw-bold text-danger">Taaza</h2>
                <p class="text-muted">Food Delivery App</p>
            </div>
            <% String err = request.getParameter("error"); if (err != null) { %>
                <div class="alert alert-danger border-0 shadow-sm"><%= err %></div>
            <% } %>
            <div class="card p-4 shadow-sm border-0 rounded-4">
                <h4 class="mb-4 fw-bold">Create Account</h4>
                <form action="RegisterServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Full Name</label>
                        <input type="text" name="name" class="form-control bg-light border-0" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Email</label>
                        <input type="email" name="email" class="form-control bg-light border-0" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Password</label>
                        <input type="password" name="password" class="form-control bg-light border-0" required>
                    </div>
                    <div class="row mb-4">
                        <div class="col-6">
                            <label class="form-label text-muted small fw-bold">Phone Number</label>
                            <input type="text" name="phone" class="form-control bg-light border-0" required>
                        </div>
                        <div class="col-6">
                            <label class="form-label text-muted small fw-bold">City</label>
                            <input type="text" name="city" class="form-control bg-light border-0" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-danger btn-lg w-100 fw-bold rounded-pill">Register</button>
                </form>
                <div class="mt-4 text-center">
                    <a href="login.jsp" class="text-decoration-none text-danger fw-bold">Already have an account? Login here</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
