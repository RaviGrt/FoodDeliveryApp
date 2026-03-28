<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Food Delivery App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center min-vh-100">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="text-center mb-4">
                <h2 class="fw-bold text-danger">Taaza</h2>
                <p class="text-muted">Food Delivery App</p>
            </div>
            <% String msg = request.getParameter("msg"); if (msg != null) { %>
                <div class="alert alert-success border-0 shadow-sm"><%= msg %></div>
            <% } %>
            <% String err = request.getParameter("error"); if (err != null) { %>
                <div class="alert alert-danger border-0 shadow-sm"><%= err %></div>
            <% } %>
            <div class="card p-4 shadow-sm border-0 rounded-4">
                <h4 class="mb-4 fw-bold">Login</h4>
                <form action="LoginServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Phone Number</label>
                        <input type="text" name="phone" class="form-control form-control-lg bg-light border-0" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label text-muted small fw-bold">Password</label>
                        <input type="password" name="password" class="form-control form-control-lg bg-light border-0" required>
                    </div>
                    <button type="submit" class="btn btn-danger btn-lg w-100 fw-bold rounded-pill">Login</button>
                </form>
                <div class="mt-4 text-center">
                    <a href="register.jsp" class="text-decoration-none text-danger fw-bold">New User? Create an account</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
