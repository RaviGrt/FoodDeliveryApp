<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - Urban Eats</title>
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
<body class="d-flex align-items-center min-vh-100">
<button class="dark-toggle-fixed" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-lg-4">
            <div class="text-center mb-4">
                <h2 class="fw-bold text-purple"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</h2>
                <p class="text-muted">Premium Food Delivery</p>
            </div>
            <% String msg = request.getParameter("msg"); if (msg != null) { %>
                <div class="alert alert-success border-0 shadow-sm"><%= msg %></div>
            <% } %>
            <% String err = request.getParameter("error"); if (err != null) { %>
                <div class="alert alert-danger border-0 shadow-sm"><%= err %></div>
            <% } %>
            <div class="card p-4 shadow-sm border-0 rounded-4">
                <h4 class="mb-1 fw-bold">Welcome back</h4>
                <p class="text-muted small mb-4">Enter your phone number to continue</p>
                <!-- Step 1: Phone Number -->
                <div id="step-phone">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Phone Number</label>
                        <input type="text" id="phoneInput" class="form-control form-control-lg bg-light border-0" placeholder="e.g. 9876543210" maxlength="15">
                        <div id="phoneError" class="text-danger small mt-1" style="display:none;">Please enter a valid phone number.</div>
                    </div>
                    <button onclick="checkPhone()" class="btn btn-purple btn-lg w-100 fw-bold rounded-pill" id="continueBtn">Continue</button>
                </div>
                <!-- Step 2: Password -->
                <div id="step-password" style="display:none;">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Phone Number</label>
                        <div class="d-flex align-items-center bg-light rounded-3 px-3 py-2 mb-1">
                            <span id="phoneDisplay" class="fw-bold text-purple me-2"></span>
                            <a href="#" onclick="resetPhone()" class="text-muted small text-decoration-none ms-auto">Change</a>
                        </div>
                    </div>
                    <form action="LoginServlet" method="post" id="loginForm">
                        <input type="hidden" name="phone" id="hiddenPhone">
                        <div class="mb-4">
                            <label class="form-label text-muted small fw-bold">Password</label>
                            <input type="password" name="password" id="passwordInput" class="form-control form-control-lg bg-light border-0" required autofocus>
                        </div>
                        <button type="submit" class="btn btn-purple btn-lg w-100 fw-bold rounded-pill">Login</button>
                    </form>
                    <div class="mt-3 text-center">
                        <a href="#" onclick="resetPhone()" class="text-decoration-none text-muted small">← Back</a>
                    </div>
                </div>
            </div>
            <div class="mt-4 text-center">
                <a href="register.jsp" class="text-decoration-none text-purple fw-bold">New User? Create an account</a>
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
    function checkPhone() {
        const phone = document.getElementById('phoneInput').value.trim();
        const errEl = document.getElementById('phoneError');
        if (!phone) { errEl.style.display = 'inline'; errEl.textContent = 'Please enter a phone number.'; return; }
        errEl.style.display = 'none';
        const btn = document.getElementById('continueBtn');
        btn.disabled = true; btn.textContent = 'Checking...';
        fetch('CheckPhoneServlet?phone=' + encodeURIComponent(phone))
            .then(res => res.json())
            .then(data => {
                if (data.exists) {
                    document.getElementById('phoneDisplay').textContent = phone;
                    document.getElementById('hiddenPhone').value = phone;
                    document.getElementById('step-phone').style.display = 'none';
                    document.getElementById('step-password').style.display = 'block';
                    document.getElementById('passwordInput').focus();
                } else {
                    window.location.href = 'register.jsp?phone=' + encodeURIComponent(phone);
                }
            })
            .catch(() => { errEl.style.display = 'inline'; errEl.textContent = 'Something went wrong. Please try again.'; })
            .finally(() => { btn.disabled = false; btn.textContent = 'Continue'; });
    }
    function resetPhone() {
        document.getElementById('step-password').style.display = 'none';
        document.getElementById('step-phone').style.display = 'block';
        document.getElementById('phoneInput').focus();
    }
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('phoneInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') checkPhone();
        });
    });
</script>
</body>
</html>
