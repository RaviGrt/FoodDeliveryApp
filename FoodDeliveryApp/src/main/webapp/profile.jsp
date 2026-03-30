<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
<<<<<<< Updated upstream
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; --accent: #f59e0b; }
        body { font-family: 'Inter', sans-serif; background: #f8fafc; color: #1e293b; }
        .bg-purple-gradient { background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%); }
        .text-purple { color: var(--primary) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; transition: 0.3s; }
        .btn-purple:hover { background: var(--primary-dark); transform: translateY(-2px); box-shadow: 0 4px 12px rgba(139, 92, 246, 0.3); color: white; }
        .card { border: none; border-radius: 1.25rem; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05); }
        .profile-avatar { width: 100px; height: 100px; background: var(--primary-light); color: var(--primary); font-size: 3rem; display: flex; align-items: center; justify-content: center; border-radius: 50%; border: 4px solid white; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); margin-top: -50px; }
        .stat-card { background: white; border-radius: 1rem; padding: 1.5rem; text-align: center; border-bottom: 4px solid var(--primary); }
        .order-item { border-left: 4px solid var(--primary); background: white; transition: 0.2s; border-radius: 0.75rem; }
        .order-item:hover { transform: scale(1.02); }
        .nav-link-custom { color: rgba(255,255,255,0.8); font-weight: 600; text-decoration: none; padding: 0.5rem 1rem; border-radius: 50rem; transition: 0.3s; }
        .nav-link-custom:hover { background: rgba(255,255,255,0.2); color: white; }
        .form-control { border-radius: 0.75rem; padding: 0.75rem 1rem; border: 1px solid #e2e8f0; }
        .form-control:focus { border-color: var(--primary); box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.2); }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card, body.dark-mode .modal-content, body.dark-mode .stat-card, body.dark-mode .order-item { background: #2d2048 !important; color: #e9d5ff !important; border: none !important; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h2, body.dark-mode h4, body.dark-mode h5 { color: #e9d5ff !important; }
        body.dark-mode .form-label { color: #c4b5fd !important; }
        body.dark-mode .stat-card .text-purple { color: #e9d5ff !important; }
        body.dark-mode .profile-avatar { background: #3b2d5e !important; color: #e9d5ff !important; border-color: #2d2048 !important; }
        body.dark-mode .bg-white { background: #3b2d5e !important; color: #e9d5ff !important; }
        body.dark-mode .bg-light { background: #2d2048 !important; }
        .navbar .bi { font-size: 0.85rem; }
        
        /* Navbar Icon Box Style */
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
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #ede9fe 100%);
            min-height: 100vh;
            color: var(--text-primary);
            transition: all 0.3s ease;
        }

        body.dark-mode {
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%);
            color: #e2e8f0;
        }

        /* Premium Navbar */
        .navbar {
            background: rgba(139, 92, 246, 0.95);
            backdrop-filter: blur(10px);
            padding: 0.75rem 0;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.05);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            z-index: 1000;
        }
        body.dark-mode .navbar {
            background: rgba(15, 23, 42, 0.9);
            border-bottom: 1px solid rgba(139, 92, 246, 0.2);
        }

>>>>>>> Stashed changes
        .nav-icon-link {
            width: 42px; height: 42px; display: flex; align-items: center; justify-content: center;
            background: rgba(255, 255, 255, 0.15); border-radius: 14px; color: white !important;
            transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            text-decoration: none; border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .nav-icon-link:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .dark-toggle {
            width: 42px; height: 42px; display: flex; align-items: center; justify-content: center;
            background: rgba(255, 255, 255, 0.15); border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px; color: white; cursor: pointer; transition: all 0.3s ease;
        }

        .dark-toggle:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
        }

        /* Profile Card */
        .profile-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            height: 160px;
            border-radius: 28px 28px 0 0;
        }

        .profile-card {
            border-radius: 28px;
            border: none;
            background: var(--surface);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.05);
            margin-top: -60px;
            overflow: visible;
        }
        body.dark-mode .profile-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .avatar-box {
            width: 120px; height: 120px;
            background: white;
            border-radius: 32px;
            display: flex; align-items: center; justify-content: center;
            font-size: 3.5rem;
            color: var(--primary);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border: 4px solid var(--surface);
            margin-top: -60px;
            margin-bottom: 20px;
        }
        body.dark-mode .avatar-box { background: #1e293b; border-color: #334155; }

        .stat-card {
            background: var(--surface-light);
            padding: 1.5rem;
            border-radius: 20px;
            text-align: center;
            border: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }
        body.dark-mode .stat-card {
            background: rgba(15, 23, 42, 0.3);
            border-color: rgba(139, 92, 246, 0.1);
        }
        .stat-card:hover { transform: translateY(-5px); border-color: var(--primary); }

        /* Order Items */
        .order-card {
            background: var(--surface);
            border-radius: 20px;
            padding: 1.5rem;
            border-left: 6px solid var(--primary);
            margin-bottom: 1rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.02);
            transition: all 0.3s ease;
        }
        body.dark-mode .order-card {
            background: rgba(30, 41, 59, 0.5);
            border-color: var(--primary);
        }
        .order-card:hover { transform: scale(1.01); box-shadow: 0 10px 25px rgba(139,92,246,0.1); }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 700;
            transition: all 0.3s ease;
        }
        .btn-purple:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(139, 92, 246, 0.3); color: white; }

        .form-control-lg {
            border-radius: 14px;
            background: var(--surface-light); border: 2px solid var(--border-color);
            font-weight: 600;
        }
        body.dark-mode .form-control-lg {
            background: rgba(15, 23, 42, 0.4); border-color: rgba(139, 92, 246, 0.2); color: white;
        }
        .form-control-lg:focus { border-color: var(--primary); box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1); }
    </style>
</head>
<body class="pb-5">

<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-800 fs-3" href="HomeServlet">
            <i class="bi bi-basket-fill text-warning me-2"></i>Urban Eats
        </a>
        <div class="ms-auto d-flex align-items-center gap-3">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="AI Suggest"><i class="bi bi-stars"></i></a>
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <button class="dark-toggle" id="darkToggle" title="Toggle Theme"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link bg-danger bg-opacity-25 border-danger border-opacity-25" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-9">
            
            <c:if test="${not empty success}">
                <div class="alert alert-success border-0 rounded-4 shadow-sm mb-4 p-3 d-flex align-items-center">
                    <i class="bi bi-check-circle-fill fs-4 me-3"></i> <strong>Success!</strong> ${success}
                </div>
            </c:if>

            <div class="profile-header"></div>
            <div class="card profile-card p-4 p-md-5">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-center align-items-md-start">
                    <div class="text-center text-md-start">
                        <div class="avatar-box mx-auto mx-md-0">
                            <i class="bi bi-person-bounding-box"></i>
                        </div>
                        <h1 class="fw-800 mb-1" style="font-size: 2.5rem; letter-spacing: -1.5px;">${user.name}</h1>
                        <p class="text-secondary fw-600 mb-4"><i class="bi bi-geo-alt-fill text-primary me-2"></i>Resident of ${user.city}</p>
                    </div>
                    <button class="btn btn-purple btn-lg rounded-pill px-4" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                        <i class="bi bi-pencil-square me-2"></i>Edit Profile
                    </button>
                </div>

                <div class="row g-4 mt-2 mb-5">
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h2 class="fw-800 text-primary mb-1">${totalOrders}</h2>
                            <span class="text-secondary small fw-700 text-uppercase letter-wide">Total Orders</span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h2 class="fw-800 text-warning mb-1">Elite</h2>
                            <span class="text-secondary small fw-700 text-uppercase letter-wide">Account Rank</span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h2 class="fw-800 text-success mb-1">Active</h2>
                            <span class="text-secondary small fw-700 text-uppercase letter-wide">Member Since 2024</span>
                        </div>
                    </div>
                </div>

                <div class="row g-5">
                    <div class="col-md-6">
                        <label class="text-secondary small fw-800 text-uppercase mb-2">Registered Email</label>
                        <div class="fs-5 fw-600"><i class="bi bi-envelope-at me-2 text-primary"></i>${user.email}</div>
                    </div>
                    <div class="col-md-6">
                        <label class="text-secondary small fw-800 text-uppercase mb-2">Mobile Number</label>
                        <div class="fs-5 fw-600"><i class="bi bi-phone-vibrate me-2 text-success"></i>${user.phone}</div>
                    </div>
                </div>
            </div>

            <!-- Recent Orders -->
            <div class="mt-5">
                <div class="d-flex justify-content-between align-items-center mb-4 px-2">
                    <h3 class="fw-800 mb-0">Order History</h3>
                    <a href="OrderTrackingServlet" class="btn btn-link text-primary fw-700 text-decoration-none p-0">View tracking dashboard <i class="bi bi-chevron-right"></i></a>
                </div>
                
                <div class="row g-3">
                    <c:forEach var="ord" items="${lastOrders}">
                        <div class="col-12">
                            <div class="order-card d-flex flex-wrap justify-content-between align-items-center">
                                <div>
                                    <div class="fw-800 fs-5 mb-1 text-dark">Order ID #${ord.orderId}</div>
                                    <div class="text-secondary small fw-600"><i class="bi bi-calendar3 me-2"></i><fmt:formatDate value="${ord.createdAt}" pattern="dd MMM yyyy" /></div>
                                </div>
                                <div class="text-md-end mt-3 mt-md-0">
                                    <div class="fw-800 text-primary fs-4 mb-2">₹${ord.totalAmount}</div>
                                    <span class="badge rounded-pill px-3 py-2 fw-700 ${ord.status == 'Delivered' ? 'bg-success bg-opacity-10 text-success' : 'bg-primary bg-opacity-10 text-primary'}">
                                        <i class="bi bi-circle-fill me-2" style="font-size: 0.5rem;"></i>${ord.status}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty lastOrders}">
                        <div class="card text-center p-5 border-0 bg-light">
                            <i class="bi bi-clock-history fs-1 text-muted opacity-25 mb-3"></i>
                            <h5 class="fw-700">No recent orders found</h5>
                            <p class="text-secondary">Ready to try something delicious?</p>
                            <a href="HomeServlet" class="btn btn-purple rounded-pill px-4 mt-2 fw-700">See Restaurants</a>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Edit Profile Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 rounded-4 shadow-lg">
            <div class="modal-header border-0 pb-0 pt-4 px-4">
                <h4 class="modal-title fw-800">Update Profile Details</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="ProfileServlet" method="POST" id="profileForm">
                <div class="modal-body p-4">
                    <div class="mb-4">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Display Name</label>
                        <input type="text" name="name" class="form-control form-control-lg" value="${user.name}" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Account Email</label>
                        <input type="email" name="email" class="form-control form-control-lg" value="${user.email}" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Phone Identifier</label>
                        <input type="tel" name="phone" class="form-control form-control-lg" value="${user.phone}" pattern="[0-9]{10}" maxlength="10" required>
                    </div>
                    <div class="mb-0">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Delivery City</label>
                        <input type="text" name="city" class="form-control form-control-lg" value="${user.city}" required>
                    </div>
                </div>
                <div class="modal-footer border-0 p-4 pt-0 gap-3">
                    <button type="button" class="btn btn-light rounded-pill px-4 fw-700 flex-grow-1" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-purple rounded-pill px-4 fw-700 flex-grow-1">Apply Changes</button>
                </div>
            </form>
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
</script>
</body>
</html>
