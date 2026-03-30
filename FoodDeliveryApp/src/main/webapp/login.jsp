<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #8b5cf6;
            --primary-dark: #7c3aed;
            --primary-light: #ede9fe;
            --primary-hover: #6d28d9;
            --surface: #ffffff;
            --surface-light: #f8fafc;
            --text-primary: #1e293b;
            --text-secondary: #64748b;
            --border-color: #e2e8f0;
            --danger: #ef4444;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #ede9fe 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            color: var(--text-primary);
            transition: all 0.3s ease;
        }

        body.dark-mode {
            background: linear-gradient(135deg, #1a1625 0%, #2d1b65 100%);
            color: #e9d5ff;
        }

        body.dark-mode .card {
            background: rgba(45, 32, 72, 0.8);
            border: 1px solid rgba(139, 92, 246, 0.2);
        }

        body.dark-mode .form-control {
            background: rgba(59, 45, 94, 0.5);
            color: #e9d5ff;
            border: 1px solid rgba(139, 92, 246, 0.3);
        }

        body.dark-mode .form-control::placeholder {
            color: rgba(194, 181, 253, 0.5);
        }

        body.dark-mode .text-muted {
            color: #c4b5fd !important;
        }

        body.dark-mode .alert {
            background: rgba(59, 45, 94, 0.5);
            border: 1px solid rgba(139, 92, 246, 0.2);
            color: #e9d5ff;
        }

        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h1, body.dark-mode h2, body.dark-mode .card-title { color: #e9d5ff !important; }
        body.dark-mode .card-subtitle { color: #c4b5fd !important; }
        body.dark-mode .logo-icon { background: linear-gradient(135deg, #a78bfa 0%, #8b5cf6 100%); -webkit-background-clip: text; }
        body.dark-mode #step-password div[style*="background:#f8fafc"] { background: #3b2d5e !important; border-color: #5b3f8c !important; }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            font-weight: 700;
            transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .btn-purple:hover {
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary-hover) 100%);
            transform: translateY(-3px);
            box-shadow: 0 12px 24px rgba(139, 92, 246, 0.4);
            color: white;
        }

        .btn-purple:active {
            transform: translateY(-1px);
        }

        .dark-toggle-fixed {
            position: fixed;
            top: 1.5rem;
            right: 1.5rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            border-radius: 50%;
            width: 48px;
            height: 48px;
            font-size: 1.25rem;
            cursor: pointer;
            z-index: 999;
            box-shadow: 0 8px 24px rgba(139, 92, 246, 0.35);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dark-toggle-fixed:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 32px rgba(139, 92, 246, 0.45);
        }

        .form-control {
            border-radius: 12px;
            border: 2px solid var(--border-color);
            padding: 12px 16px;
            font-size: 1rem;
            background: var(--surface-light);
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1);
            background: var(--surface);
        }

        .form-control::placeholder {
            color: var(--text-secondary);
            opacity: 0.7;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-secondary);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .card {
            border-radius: 24px;
            border: none;
            background: var(--surface);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 30px 80px rgba(139, 92, 246, 0.1);
        }

        .alert {
            border-radius: 14px;
            border: none;
            animation: slideInDown 0.4s ease-out;
        }

        @keyframes slideInDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .logo-section {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo-icon {
            font-size: 3.5rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
            animation: bounceIn 0.6s ease-out;
        }

        @keyframes bounceIn {
            0% { transform: scale(0.3); opacity: 0; }
            50% { opacity: 1; }
            70% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .card-title {
            font-size: 1.75rem;
            font-weight: 800;
            color: var(--text-primary);
            letter-spacing: -0.5px;
        }

        .card-subtitle {
            font-size: 1rem;
            color: var(--text-secondary);
            font-weight: 500;
            margin-bottom: 2rem;
        }

        .error-message {
            color: var(--danger);
            font-size: 0.85rem;
            font-weight: 600;
            margin-top: 6px;
            animation: shake 0.3s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .input-group-icon {
            position: relative;
        }

        .input-group-icon i {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            pointer-events: none;
        }

        .step-indicator {
            display: flex;
            justify-content: space-between;
            gap: 0.5rem;
            margin-bottom: 2rem;
        }

        .step {
            flex: 1;
            height: 4px;
            background: #e2e8f0;
            border-radius: 2px;
        }

        .step.active {
            background: linear-gradient(90deg, var(--primary) 0%, var(--primary-dark) 100%);
        }

        .link-custom {
            color: var(--primary);
            text-decoration: none;
            font-weight: 700;
            transition: all 0.3s ease;
        }

        .link-custom:hover {
            color: var(--primary-dark);
            transform: translateX(2px);
        }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100">
<button class="dark-toggle-fixed" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>

<div class="container">
    <div class="row justify-content-center align-items-center min-vh-100">
        <div class="col-12 col-sm-10 col-md-8 col-lg-5 col-xl-4">
            <!-- Logo Section -->
            <div class="logo-section mb-5">
                <div class="logo-icon mb-3"><i class="bi bi-basket-fill"></i></div>
                <h1 class="fw-bold mb-2" style="font-size: 2.2rem; letter-spacing: -1px;">Urban Eats</h1>
                <p class="text-secondary fw-500">Premium Food Delivery</p>
            </div>

            <!-- Messages -->
            <% String msg = request.getParameter("msg"); if (msg != null) { %>
                <div class="alert alert-success border-0 d-flex align-items-center mb-3" style="background: #f0fdf4; color: #15803d;">
                    <div><%= msg %></div>
                </div>
            <% } %>
            <% String err = request.getParameter("error"); if (err != null) { %>
                <div class="alert alert-danger border-0 d-flex align-items-center mb-3" style="background: #fef2f2; color: #b91c1c;">
                    <div><%= err %></div>
                </div>
            <% } %>

            <!-- Auth Card -->
            <div class="card p-5 mb-4">
                <!-- Step 1: Phone -->
                <div id="step-phone">
                    <h2 class="card-title mb-2">Welcome back</h2>
                    <p class="card-subtitle">Enter your phone number</p>

                    <div class="step-indicator">
                        <div class="step active"></div>
                        <div class="step"></div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Phone Number</label>
                        <div class="input-group-icon">
                            <input type="text" id="phoneInput" class="form-control form-control-lg" 
                                   maxlength="10" inputmode="numeric" placeholder=""
                                   value="<%= request.getParameter(\"phone\") != null ? request.getParameter(\"phone\") : \"\" %>">
                        </div>
                        <div id="phoneError" class="error-message" style="display:none;"></div>
                    </div>

                    <button onclick="checkPhone()" class="btn btn-purple btn-lg w-100 mb-4">
                        Continue
                    </button>

                    <div class="text-center">
                        <p class="text-secondary mb-0">New to Urban Eats? 
                            <a href="register.jsp" class="link-custom">Create account</a>
                        </p>
                    </div>
                </div>

                <!-- Step 2: Password -->
                <div id="step-password" style="display:none;">
                    <button type="button" onclick="resetPhone()" class="btn btn-sm" 
                            style="background:none; border:none; color:var(--primary); padding:0;">
                        Back
                    </button>

                    <h2 class="card-title mb-2 mt-3">Enter Password</h2>
                    <p class="card-subtitle">Secure login</p>

                    <div class="step-indicator">
                        <div class="step active"></div>
                        <div class="step active"></div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <div style="background:#f8fafc; border:2px solid #e2e8f0; border-radius:12px; padding:12px 16px; display:flex; align-items:center; justify-content:space-between;">
                            <span class="fw-600 text-primary" id="phoneDisplay"></span>
                            <a href="#" onclick="resetPhone(event)" class="link-custom" style="font-size:0.9rem;">Change</a>
                        </div>
                    </div>

                    <form action="LoginServlet" method="post" id="loginForm">
                        <input type="hidden" name="phone" id="hiddenPhone">
                        <div class="mb-4">
                            <label class="form-label">Password</label>
                            <div class="input-group-icon">
                                <input type="password" name="password" id="passwordInput" class="form-control form-control-lg" 
                                       required autofocus placeholder="">

                            </div>
                        </div>
                        <button type="submit" class="btn btn-purple btn-lg w-100">
                            Login
                        </button>
                    </form>
                </div>
            </div>

            <p class="text-center text-secondary small">
                By continuing, you agree to our <a href="#" class="link-custom">Terms</a> and <a href="#" class="link-custom">Privacy</a>
            </p>
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

    const phoneInput = document.getElementById('phoneInput');
    phoneInput.addEventListener('input', function() {
        this.value = this.value.replace(/\D/g, '').slice(0, 10);
        document.getElementById('phoneError').style.display = 'none';
    });

    phoneInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') checkPhone();
    });

    function checkPhone() {
        const phone = phoneInput.value.trim();
        const errEl = document.getElementById('phoneError');
        const phoneRegex = /^[0-9]{10}$/;
        
        if (!phoneRegex.test(phone)) {
            errEl.style.display = 'block';
            errEl.textContent = phone ? 'Please enter 10 digits.' : 'Please enter a phone number.';
            return;
        }

        // Check if user exists on the backend
        fetch('LoginServlet', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded', 'X-Requested-With': 'XMLHttpRequest' },
            body: 'phone=' + encodeURIComponent(phone) + '&checkOnly=true'
        })
        .then(res => res.text())
        .then(data => {
            if (data === 'exists') {
                // User exists, proceed to password step
                document.getElementById('step-phone').style.display = 'none';
                document.getElementById('step-password').style.display = 'block';
                document.getElementById('phoneDisplay').textContent = phone;
                document.getElementById('hiddenPhone').value = phone;
                document.getElementById('passwordInput').focus();
            } else if (data === 'notfound') {
                // User doesn't exist, redirect to register page
                window.location.href = 'register.jsp?phone=' + encodeURIComponent(phone) + '&msg=Please+Register+First';
            } else {
                // Error checking user
                errEl.style.display = 'block';
                errEl.textContent = 'Error connecting to server. Please try again.';
            }
        })
        .catch(err => {
            console.error('Error:', err);
            errEl.style.display = 'block';
            errEl.textContent = 'Network error. Please try again.';
        });
    }

    function resetPhone(e) {
        if (e) e.preventDefault();
        document.getElementById('step-password').style.display = 'none';
        document.getElementById('step-phone').style.display = 'block';
        phoneInput.focus();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
