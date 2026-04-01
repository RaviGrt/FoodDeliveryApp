<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Settings - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .menu-container {
            max-width: 600px; margin: 4rem auto;
        }

        .menu-card {
            border-radius: 32px; border: none;
            background: var(--surface);
            box-shadow: 0 25px 60px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        body.dark-mode .menu-card { background: rgba(30, 41, 59, 0.7); backdrop-filter: blur(12px); border: 1px solid rgba(139, 92, 246, 0.1); }

        .menu-item {
            padding: 1.8rem 2.5rem;
            display: flex; align-items: center; justify-content: space-between;
            text-decoration: none; color: inherit;
            border-bottom: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }
        body.dark-mode .menu-item { border-bottom-color: rgba(139, 92, 246, 0.1); }
        .menu-item:last-child { border-bottom: none; }
        .menu-item:hover { background: #f5f3ff; transform: translateX(10px); }
        body.dark-mode .menu-item:hover { background: rgba(139, 92, 246, 0.1); }

        .item-icon {
            width: 50px; height: 50px;
            display: flex; align-items: center; justify-content: center;
            border-radius: 16px; font-size: 1.4rem;
            background: var(--primary-light); color: var(--primary);
            transition: all 0.3s ease;
        }
        body.dark-mode .item-icon { background: rgba(139, 92, 246, 0.15); color: #c4b5fd; }
        .menu-item:hover .item-icon { background: var(--primary); color: white; transform: rotate(10deg); }

        .avatar-lg {
            width: 100px; height: 100px;
            border-radius: 30px; object-fit: cover;
            border: 4px solid var(--primary);
            margin-bottom: 1rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .theme-badge {
            background: var(--primary); color: white;
            padding: 5px 12px; border-radius: 100px; font-size: 0.8rem; font-weight: 700;
        }
    </style>
</head>
<body class="${sessionScope.theme == 'light' ? 'light-mode' : 'dark-mode'}">

<jsp:include page="header.jsp" />

<div class="container menu-container">
    <div class="text-center mb-5">
        <div class="avatar-lg bg-white d-flex align-items-center justify-content-center mx-auto position-relative" style="overflow: hidden;">
            <c:choose>
                <c:when test="${not empty sessionScope.user.profileImage and sessionScope.user.profileImage != 'null' and sessionScope.user.profileImage != ''}">
                    <img src="ImageServlet?path=${sessionScope.user.profileImage}" alt="" 
                         style="width: 100%; height: 100%; object-fit: cover; position: absolute; top:0; left:0; z-index: 2;"
                         onerror="this.style.display='none';">
                    <i class="bi bi-person-fill" style="font-size: 3.5rem; color: var(--primary); z-index: 1;"></i>
                </c:when>
                <c:otherwise>
                    <i class="bi bi-person-fill" style="font-size: 3.5rem; color: var(--primary);"></i>
                </c:otherwise>
            </c:choose>
        </div>
        <h2 class="fw-800 mt-3">${sessionScope.user.name}</h2>
        <p class="text-secondary fw-500">${sessionScope.user.email}</p>
    </div>

    <div class="card menu-card">
        <a href="editProfile.jsp" class="menu-item">
            <div class="d-flex align-items-center gap-3">
                <div class="item-icon"><i class="bi bi-pencil-square"></i></div>
                <div>
                    <div class="fw-800 fs-5">Edit Profile</div>
                    <div class="text-secondary small fw-500">Update name, phone, and photo</div>
                </div>
            </div>
            <i class="bi bi-chevron-right text-muted fs-4"></i>
        </a>

        <a href="changePassword.jsp" class="menu-item">
            <div class="d-flex align-items-center gap-3">
                <div class="item-icon"><i class="bi bi-shield-lock"></i></div>
                <div>
                    <div class="fw-800 fs-5">Change Password</div>
                    <div class="text-secondary small fw-500">Verify current and set new password</div>
                </div>
            </div>
            <i class="bi bi-chevron-right text-muted fs-4"></i>
        </a>

        <a href="OrderTrackingServlet" class="menu-item">
            <div class="d-flex align-items-center gap-3">
                <div class="item-icon"><i class="bi bi-receipt"></i></div>
                <div>
                    <div class="fw-800 fs-5">Order History</div>
                    <div class="text-secondary small fw-500">Track and view past orders</div>
                </div>
            </div>
            <i class="bi bi-chevron-right text-muted fs-4"></i>
        </a>

        <c:choose>
            <c:when test="${sessionScope.theme == 'light'}">
                <a href="ThemeServlet?theme=dark" class="menu-item">
                    <div class="d-flex align-items-center gap-3">
                        <div class="item-icon"><i class="bi bi-moon-stars-fill"></i></div>
                        <div>
                            <div class="fw-800 fs-5">Switch to Dark Mode</div>
                            <div class="text-secondary small fw-500">Saves battery and looks cool</div>
                        </div>
                    </div>
                    <span class="theme-badge bg-secondary">Light Mode</span>
                </a>
            </c:when>
            <c:otherwise>
                <a href="ThemeServlet?theme=light" class="menu-item">
                    <div class="d-flex align-items-center gap-3">
                        <div class="item-icon"><i class="bi bi-sun-fill"></i></div>
                        <div>
                            <div class="fw-800 fs-5">Switch to Light Mode</div>
                            <div class="text-secondary small fw-500">Easier on eyes during day</div>
                        </div>
                    </div>
                    <span class="theme-badge">Dark Mode</span>
                </a>
            </c:otherwise>
        </c:choose>

        <a href="LogoutServlet" class="menu-item border-danger border-opacity-10">
            <div class="d-flex align-items-center gap-3">
                <div class="item-icon bg-danger-subtle text-danger"><i class="bi bi-box-arrow-right"></i></div>
                <div>
                    <div class="fw-800 fs-5 text-danger">Logout</div>
                    <div class="text-secondary small fw-500">Ends your current session</div>
                </div>
            </div>
            <i class="bi bi-chevron-right text-muted fs-4"></i>
        </a>
    </div>

    <%-- Success/Error Messages from Redirect --%>
    <c:if test="${not empty param.success}">
        <div class="alert alert-success mt-4 rounded-4 shadow-sm fw-700 p-3 text-center border-0">
            <i class="bi bi-check-circle-fill me-2"></i> ${param.success}
        </div>
    </c:if>
</div>

</body>
</html>
