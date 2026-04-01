<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .pwd-container { max-width: 550px; margin: 4rem auto; }

        .pwd-card {
            border-radius: 32px; border: none;
            background: var(--surface);
            box-shadow: 0 25px 60px rgba(0,0,0,0.08);
            padding: 3rem;
        }
        body.dark-mode .pwd-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .form-label {
            font-weight: 700; color: var(--text-secondary); margin-bottom: 0.8rem;
            text-transform: uppercase; font-size: 0.85rem; letter-spacing: 1px;
        }
        body.dark-mode .form-label { color: #94a3b8; }

        .form-control {
            border-radius: 16px; height: 58px; font-weight: 600;
            border: 2px solid var(--border-color); background: #f8fafc;
        }
        body.dark-mode .form-control {
            background: rgba(15, 23, 42, 0.4);
            border-color: rgba(139, 92, 246, 0.2);
            color: white;
        }
        .form-control:focus {
            border-color: var(--primary); box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.15);
        }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 800; border-radius: 18px;
            height: 60px; font-size: 1.1rem; transition: all 0.3s ease;
            width: 100%; box-shadow: 0 8px 25px rgba(139, 92, 246, 0.3);
        }
        .btn-purple:hover { transform: translateY(-3px); box-shadow: 0 15px 35px rgba(139, 92, 246, 0.4); color: white; }

        .shield-icon {
            width: 80px; height: 80px; border-radius: 28px;
            background: var(--primary-light);
            display: inline-flex; align-items: center; justify-content: center;
            margin-bottom: 1.5rem;
        }
        body.dark-mode .shield-icon { background: rgba(139, 92, 246, 0.15); }
        .shield-icon i { font-size: 2.5rem; color: var(--primary); }

        .btn-back {
            display: flex; align-items: center; gap: 8px; text-decoration: none;
            color: var(--text-secondary); font-weight: 700; margin-bottom: 2rem;
            transition: color 0.3s ease;
        }
        .btn-back:hover { color: var(--primary); }
    </style>
</head>
<body class="${sessionScope.theme == 'light' ? 'light-mode' : 'dark-mode'}">

<jsp:include page="header.jsp" />

<div class="container pwd-container">
    <a href="profileMenu.jsp" class="btn-back"><i class="bi bi-arrow-left"></i> Back to Menu</a>

    <div class="card pwd-card">
        <div class="text-center">
            <div class="shield-icon mx-auto">
                <i class="bi bi-shield-lock"></i>
            </div>
            <h2 class="fw-800 mb-1" style="font-size: 2rem; letter-spacing: -1px;">Change Password</h2>
            <p class="text-secondary fw-500 mb-4">Verify your current password to set a new one</p>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger rounded-4 border-0 shadow-sm p-3 mb-4 fw-700">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> ${param.error}
            </div>
        </c:if>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success rounded-4 border-0 shadow-sm p-3 mb-4 fw-700">
                <i class="bi bi-check-circle-fill me-2"></i> ${param.success}
            </div>
        </c:if>

        <form action="ChangePasswordServlet" method="POST" id="pwdForm">
            <div class="mb-4">
                <label class="form-label">Current Password <span style="color:#ef4444;">*</span></label>
                <div class="position-relative">
                    <input type="password" name="currentPassword" id="currentPassword" class="form-control" required placeholder="Enter your current password">
                    <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-2" onclick="togglePassword('currentPassword', this)" style="color: var(--text-secondary);">
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">New Password <span style="color:#ef4444;">*</span></label>
                <div class="position-relative">
                    <input type="password" name="newPassword" id="newPassword" class="form-control" required placeholder="Enter new password (min 6 characters)" minlength="6">
                    <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-2" onclick="togglePassword('newPassword', this)" style="color: var(--text-secondary);">
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
            </div>

            <div class="mb-5">
                <label class="form-label">Confirm New Password <span style="color:#ef4444;">*</span></label>
                <div class="position-relative">
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" required placeholder="Re-enter new password">
                    <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-2" onclick="togglePassword('confirmPassword', this)" style="color: var(--text-secondary);">
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
                <div id="passwordMismatch" class="text-danger fw-600 mt-2 small" style="display:none;">
                    <i class="bi bi-x-circle me-1"></i>Passwords do not match
                </div>
            </div>

            <button type="submit" class="btn btn-purple">
                <i class="bi bi-check2-circle me-2"></i> Update Password
            </button>
        </form>
    </div>
</div>

<script>
    document.getElementById('pwdForm').addEventListener('submit', function(e) {
        var newPwd = document.getElementById('newPassword').value;
        var confirmPwd = document.getElementById('confirmPassword').value;

        if (newPwd !== confirmPwd) {
            e.preventDefault();
            document.getElementById('passwordMismatch').style.display = 'block';
            document.getElementById('confirmPassword').focus();
            return false;
        }
        if (newPwd.length < 6) {
            e.preventDefault();
            alert('New password must be at least 6 characters.');
            document.getElementById('newPassword').focus();
            return false;
        }
        document.getElementById('passwordMismatch').style.display = 'none';
    });

    function togglePassword(fieldId, btn) {
        var field = document.getElementById(fieldId);
        var icon = btn.querySelector('i');
        if (field.type === 'password') {
            field.type = 'text';
            icon.className = 'bi bi-eye-slash';
        } else {
            field.type = 'password';
            icon.className = 'bi bi-eye';
        }
    }
</script>

</body>
</html>
