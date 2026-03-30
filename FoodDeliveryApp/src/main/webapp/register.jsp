<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- Urban Eats v2.1 - Premium Register --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
<<<<<<< Updated upstream
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card { background: #2d2048 !important; color: #e9d5ff; border: none; }
        body.dark-mode .bg-light, body.dark-mode .form-control { background: #3b2d5e !important; color: #e9d5ff !important; border: none; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h1, body.dark-mode h2, body.dark-mode h4 { color: #e9d5ff !important; }
        body.dark-mode .form-label { color: #c4b5fd !important; }
        body.dark-mode .alert { background: rgba(59, 45, 94, 0.5) !important; color: #e9d5ff !important; border: 1px solid rgba(139, 92, 246, 0.2) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; }
        .btn-purple:hover { background: var(--primary-dark); color: white; }
        .text-purple { color: var(--primary) !important; }
        .dark-toggle-fixed { position: fixed; top: 1rem; right: 1rem; background: var(--primary); color: white; border: none; border-radius: 50%; width: 44px; height: 44px; font-size: 1.2rem; cursor: pointer; z-index: 999; box-shadow: 0 4px 12px rgba(139,92,246,0.4); }
=======
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
            font-family: 'Inter', sans-serif;
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
            backdrop-filter: blur(12px);
        }

        body.dark-mode .form-control {
            background: rgba(59, 45, 94, 0.5);
            color: #e9d5ff;
            border: 1px solid rgba(139, 92, 246, 0.3);
        }

        body.dark-mode .form-control::placeholder {
            color: rgba(194, 181, 253, 0.4);
        }

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

        .dark-toggle-fixed {
            position: fixed;
            top: 2rem;
            right: 2rem;
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
            transform: translateY(-4px) rotate(15deg);
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
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1);
            background: var(--surface);
        }

        .form-label {
            font-weight: 700;
            color: var(--text-secondary);
            text-transform: uppercase;
            font-size: 0.7rem;
            letter-spacing: 1px;
            margin-bottom: 8px;
            display: block;
        }

        .card {
            border-radius: 28px;
            border: none;
            background: var(--surface);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
        }

        .logo-icon {
            font-size: 3rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
            display: inline-block;
        }

        .alert {
            border-radius: 16px;
            border: none;
            font-weight: 600;
        }

        .link-custom {
            color: var(--primary);
            text-decoration: none;
            font-weight: 700;
            transition: all 0.2s ease;
        }

        .link-custom:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }
>>>>>>> Stashed changes
    </style>
</head>
<body>
    <button class="dark-toggle-fixed" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>

    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100 py-5">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
                
                <div class="text-center mb-4">
                    <div class="logo-icon"><i class="bi bi-basket-fill"></i></div>
                    <h1 class="fw-800 mb-1" style="font-size: 2.2rem; letter-spacing: -1px;">Urban <span style="color:var(--primary);">Eats</span></h1>
                    <p class="text-secondary fw-600 mb-0">Join the Premium Food Community</p>
                </div>

                <% 
                    String err = request.getParameter("error"); 
                    String msg = request.getParameter("msg");
                    if (msg != null) { 
                %>
                    <div class="alert alert-info border-0 d-flex align-items-center mb-4" style="background: #f0f9ff; color: #0369a1;">
                        <i class="bi bi-info-circle-fill me-3 fs-4"></i>
                        <div><strong>Welcome!</strong> <%= msg %></div>
                    </div>
                <% } %>
                <% if (err != null) { %>
                    <div class="alert alert-danger border-0 d-flex align-items-center mb-4" style="background: #fef2f2; color: #b91c1c;">
                        <i class="bi bi-exclamation-triangle-fill me-3 fs-4"></i>
                        <div><%= err %></div>
                    </div>
                <% } %>

                <div class="card p-4 p-md-5">
                    <h2 class="fw-800 mb-2" style="font-size: 1.8rem;">Create Account</h2>
                    <p class="text-secondary fw-500 mb-4">Start your culinary journey with us today.</p>

                    <form action="RegisterServlet" method="post" id="regForm">
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" id="regName" name="name" class="form-control" required placeholder="John Doe">
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Email Address</label>
                                <input type="email" id="regEmail" name="email" class="form-control" required placeholder="john@example.com">
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Create Password</label>
                                <input type="password" id="regPassword" name="password" class="form-control" required placeholder="••••••••">
                            </div>
                            <div class="col-md-12 mb-4">
                                <label class="form-label">Phone Number</label>
                                <input type="text" id="regPhone" name="phone" class="form-control" required maxlength="10" inputmode="numeric"
                                       value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>"
                                       placeholder="9876543210">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-purple btn-lg w-100 py-3 rounded-pill shadow-sm mb-4">
                            Complete registration <i class="bi bi-person-plus-fill ms-2"></i>
                        </button>
                    </form>

                    <div class="text-center">
                        <p class="text-secondary fw-500 mb-0">Already a member? 
                            <a href="login.jsp" class="link-custom ms-1">Login here</a>
                        </p>
                    </div>
                </div>

                <p class="text-center text-secondary small mt-4 px-3">
                    By joining, you agree to our <a href="#" class="link-custom">Terms of Service</a> & <a href="#" class="link-custom">Privacy Policy</a>
                </p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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

        // Combined Validation Logic
        const regPhone = document.getElementById('regPhone');
        const regName = document.getElementById('regName');

        regPhone.addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '').slice(0, 10);
        });

        regName.addEventListener('input', function() {
            this.value = this.value.replace(/[^A-Za-z\s]/g, '');
        });

        document.getElementById('regForm').addEventListener('submit', function(e) {
            const phone = regPhone.value.trim();
            const name = regName.value.trim();
            const email = document.getElementById('regEmail').value.trim();
            const password = document.getElementById('regPassword').value;
            
            const phoneRegex = /^[0-9]{10}$/;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (!phoneRegex.test(phone)) {
                e.preventDefault();
                alert('Please enter a valid 10-digit mobile number.');
                return;
            }
            if (name.length < 2) {
                e.preventDefault();
                alert('Please enter your full name.');
                return;
            }
            if (!emailRegex.test(email)) {
                e.preventDefault();
                alert('Please enter a valid email address.');
                return;
            }
            if (password.length < 6) {
                e.preventDefault();
                alert('Password must be at least 6 characters long.');
                return;
            }
        });
    </script>
</body>
</html>
