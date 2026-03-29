<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card { background: #2d2048 !important; color: #e9d5ff; border: none; }
        body.dark-mode .bg-light, body.dark-mode .form-control { background: #3b2d5e !important; color: #e9d5ff !important; border: none; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        .btn-purple { background: var(--primary); color: white; border: none; }
        .btn-purple:hover { background: var(--primary-dark); color: white; }
        .text-purple { color: var(--primary) !important; }
        .dark-toggle-fixed { position: fixed; top: 1rem; right: 1rem; background: var(--primary); color: white; border: none; border-radius: 50%; width: 44px; height: 44px; font-size: 1.2rem; cursor: pointer; z-index: 999; box-shadow: 0 4px 12px rgba(139,92,246,0.4); }
    </style>
</head>
<body class="py-5">
<button class="dark-toggle-fixed" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="text-center mb-4">
                <h2 class="fw-bold text-purple"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</h2>
                <p class="text-muted">Premium Food Delivery</p>
            </div>
            <% String err = request.getParameter("error"); if (err != null) { %>
                <div class="alert alert-danger border-0 shadow-sm"><%= err %></div>
            <% } %>
            <div class="card p-4 shadow-sm border-0 rounded-4">
                <h4 class="mb-4 fw-bold">Create Account</h4>
                <form action="RegisterServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Full Name</label>
                        <input type="text" id="regName" name="name" class="form-control bg-light border-0" required placeholder="Letters only">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Email</label>
                        <input type="email" id="regEmail" name="email" class="form-control bg-light border-0" required placeholder="name@domain.com">
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Password</label>
                        <input type="password" id="regPassword" name="password" class="form-control bg-light border-0" required placeholder="Min 6 characters">
                    </div>
                    <div class="mb-4">
                        <label class="form-label text-muted small fw-bold">Phone Number</label>
                        <input type="text" id="regPhone" name="phone" class="form-control bg-light border-0" required maxlength="10"
                               value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>">
                    </div>
                    <button type="submit" class="btn btn-purple btn-lg w-100 fw-bold rounded-pill">Register</button>
                </form>
                <div class="mt-4 text-center">
                    <a href="login.jsp" class="text-decoration-none text-purple fw-bold">Already have an account? Login here</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const body = document.body;
    const toggleBtn = document.getElementById('darkToggle');
    if (localStorage.getItem('darkMode') === 'on') {
        body.classList.add('dark-mode');
        toggleBtn.innerHTML = '<i class="bi bi-sun-fill"></i>';
    }
    toggleBtn.addEventListener('click', () => {
        body.classList.toggle('dark-mode');
        const isDark = body.classList.contains('dark-mode');
        localStorage.setItem('darkMode', isDark ? 'on' : 'off');
        toggleBtn.innerHTML = isDark ? '<i class="bi bi-sun-fill"></i>' : '<i class="bi bi-moon-stars-fill"></i>';
    });

    // Form Validation for Registration
    document.querySelector('form').addEventListener('submit', function(e) {
        const phone = document.getElementById('regPhone').value.trim();
        const name = document.getElementById('regName').value.trim();
        const email = document.getElementById('regEmail').value.trim();
        const password = document.getElementById('regPassword').value;
        
        const phoneRegex = /^[0-9]{10}$/;
        const nameRegex = /^[A-Za-z\s]{2,50}$/;
        const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/;
        
        if (!phoneRegex.test(phone)) {
            e.preventDefault();
            alert('You should enter the correct 10-digit number.');
            window.location.href = 'error.jsp?type=invalid_phone';
            return;
        }
        if (!nameRegex.test(name)) {
            e.preventDefault();
            alert('Please enter a valid name (letters only).');
            window.location.href = 'error.jsp?type=invalid_name';
            return;
        }
        if (!emailRegex.test(email)) {
            e.preventDefault();
            alert('Please enter a valid email address.');
            window.location.href = 'error.jsp?type=invalid_email';
            return;
        }
        if (password.length < 6) {
            e.preventDefault();
            alert('Password must be at least 6 characters long.');
            window.location.href = 'error.jsp?type=weak_password';
            return;
        }
    });

    document.addEventListener('DOMContentLoaded', function() {
        const regName = document.getElementById('regName');
        const regPhone = document.getElementById('regPhone');

        // Prevent non-numeric in phone
        regPhone.addEventListener('keypress', function(e) {
            if (!/[0-9]/.test(e.key) && e.key !== 'Backspace' && e.key !== 'Delete' && e.key !== 'ArrowLeft' && e.key !== 'ArrowRight') {
                e.preventDefault();
            }
        });

        // Prevent non-alpha in name
        regName.addEventListener('keypress', function(e) {
            if (!/[A-Za-z\s]/.test(e.key) && e.key !== 'Backspace' && e.key !== 'Delete' && e.key !== 'ArrowLeft' && e.key !== 'ArrowRight') {
                e.preventDefault();
            }
        });
        
        // Prevent paste of non-numeric data in phone
        regPhone.addEventListener('paste', function(e) {
            const pasteData = e.clipboardData.getData('text');
            if (!/^[0-9]+$/.test(pasteData)) {
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>
