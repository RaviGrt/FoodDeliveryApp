<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Error - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; color: #1e293b; }
        .error-card { max-width: 500px; margin: 100px auto; }
        .btn-purple { background: var(--primary); color: white; border: none; padding: 12px 30px; transition: 0.3s; }
        .btn-purple:hover { background: var(--primary-dark); transform: translateY(-2px); box-shadow: 0 4px 12px rgba(139, 92, 246, 0.3); color: white; }
        .error-icon { font-size: 5rem; color: #ef4444; }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100">
    <div class="container text-center">
        <div class="card error-card p-5 shadow-lg border-0 rounded-4">
            <div class="mb-4">
                <i class="bi bi-exclamation-triangle-fill error-icon"></i>
            </div>
            <h2 class="fw-bold mb-3">Oops! Invalid Input</h2>
            <p class="text-muted mb-4 fs-5">
                <% 
                    String type = request.getParameter("type");
                    Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
                    Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
                    String errorMessage = (String) request.getAttribute("javax.servlet.error.message");

                    if (statusCode != null) { // System Error
                        if (statusCode == 404) {
                            out.print("The page you're looking for was not found (404). Please check the URL and try again.");
                        } else if (statusCode == 500) {
                            out.print("Internal Server Error (500). Something went wrong on our end. Please try again later.");
                        } else {
                            out.print("Error " + statusCode + ": " + (errorMessage != null ? errorMessage : "An unexpected error occurred."));
                        }
                    } else if (type != null) { // Custom Redirect (Original logic)
                        if ("invalid_phone".equals(type)) {
                            out.print("The phone number you entered is invalid. Please enter exactly 10 digits.");
                        } else if ("invalid_email".equals(type)) {
                            out.print("The email address format is incorrect. Please enter a valid email (e.g., name@domain.com).");
                        } else if ("invalid_name".equals(type)) {
                            out.print("The name entered is invalid. Names should only contain letters and be between 2 to 50 characters.");
                        } else if ("weak_password".equals(type)) {
                            out.print("Your password is too weak. It must be at least 6 characters long.");
                        } else if ("invalid_payment".equals(type)) {
                            out.print("Payment details are incorrect. Please check your card number, CVV, and expiry date.");
                        } else {
                            out.print("Something went wrong with your request. Please check your information and try again.");
                        }
                    } else {
                        out.print("An unknown error occurred. Please return to the homepage.");
                    }
                %>
            </p>
            <div class="d-grid">
                <a href="login.jsp" class="btn btn-purple rounded-pill fw-bold">Return to Login</a>
            </div>
        </div>
    </div>
</body>
</html>
