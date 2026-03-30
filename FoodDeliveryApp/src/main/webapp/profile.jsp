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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
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
        .nav-icon-link {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            color: white !important;
            transition: all 0.2s ease;
            text-decoration: none;
            font-size: 1.2rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .nav-icon-link:hover {
            background: rgba(255, 255, 255, 0.35);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .nav-icon-link i { font-size: 1.25rem; }
        .logout-box { background: rgba(255, 255, 255, 0.1); }
        .dark-toggle { width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; background: rgba(255, 255, 255, 0.1); border-radius: 12px; border: 1px solid rgba(255, 255, 255, 0.1); transition: 0.2s; color: white; cursor: pointer; }
        .dark-toggle:hover { background: rgba(255, 255, 255, 0.25); transform: translateY(-2px); }
    </style>
</head>
<body class="pb-5">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-purple-gradient shadow-sm sticky-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning me-2"></i>Urban Eats</a>
        <div class="ms-auto d-flex align-items-center gap-2">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="Mood Suggest"><i class="bi bi-stars"></i></a>
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <button class="dark-toggle mx-1" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link logout-box shadow-sm ms-2" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <!-- Profile Header/Card -->
        <div class="col-lg-8">
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show rounded-4 shadow-sm border-0 mb-4" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i> ${success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show rounded-4 shadow-sm border-0 mb-4" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="card overflow-hidden">
                <div class="bg-purple-gradient" style="height: 120px;"></div>
                <div class="card-body px-4 px-md-5">
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-center align-items-md-end mb-4 gap-3">
                        <div class="d-flex align-items-end gap-3">
                            <div class="profile-avatar">
                                <i class="bi bi-person-fill"></i>
                            </div>
                            <div>
                                <h2 class="fw-bold mb-1">${user.name}</h2>
                                <p class="text-muted mb-0"><i class="bi bi-geo-alt-fill text-purple me-1"></i> ${user.city}</p>
                            </div>
                        </div>
                        <button class="btn btn-purple rounded-pill px-4 py-2 fw-bold" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                            <i class="bi bi-pencil-square me-2"></i>Edit Profile
                        </button>
                    </div>

                    <div class="row g-3 mb-5">
                        <div class="col-md-4">
                            <div class="stat-card shadow-sm">
                                <div class="text-purple fs-3 fw-bold"><i class="bi bi-bag-check me-2"></i>${totalOrders}</div>
                                <div class="text-muted small fw-bold text-uppercase">Total Orders</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card shadow-sm">
                                <div class="text-primary fs-3 fw-bold"><i class="bi bi-star-fill me-2"></i>Gold</div>
                                <div class="text-muted small fw-bold text-uppercase">Member Level</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card shadow-sm">
                                <div class="text-success fs-3 fw-bold"><i class="bi bi-heart-fill me-2"></i>45</div>
                                <div class="text-muted small fw-bold text-uppercase">Favorites</div>
                            </div>
                        </div>
                    </div>

                    <div class="row g-4">
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold text-uppercase mb-2"><i class="bi bi-envelope-fill me-2 text-primary"></i>Email Address</label>
                            <div class="fs-6 fw-bold">${user.email}</div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold text-uppercase mb-2"><i class="bi bi-telephone-fill me-2 text-success"></i>Phone Number</label>
                            <div class="fs-6 fw-bold">${user.phone}</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Orders Section -->
            <div class="mt-5">
                <div class="d-flex justify-content-between align-items-center mb-4 px-2">
                    <h4 class="fw-bold mb-0"><i class="bi bi-clock-history me-2 text-purple"></i>Recent Orders</h4>
                    <a href="OrderTrackingServlet" class="text-purple fw-bold text-decoration-none small">View All <i class="bi bi-arrow-right"></i></a>
                </div>
                <div class="row g-3">
                    <c:forEach var="ord" items="${lastOrders}">
                        <div class="col-12">
                            <div class="order-item p-4 shadow-sm d-flex justify-content-between align-items-center">
                                <div>
                                    <div class="fw-bold fs-6"><i class="bi bi-receipt me-2 text-primary"></i>Order #${ord.orderId}</div>
                                    <div class="text-muted small"><i class="bi bi-calendar3 me-1"></i><fmt:formatDate value="${ord.createdAt}" pattern="dd MMM yyyy, hh:mm a" /></div>
                                </div>
                                <div class="text-end">
                                    <div class="fw-bold text-purple mb-2" style="font-size: 1.1rem;">₹${ord.totalAmount}</div>
                                    <span class="badge ${ord.status == 'Delivered' ? 'bg-success' : ord.status == 'Out for Delivery' ? 'bg-warning text-dark' : 'bg-info text-white'} rounded-pill px-3 py-2">
                                        <i class="bi bi-circle-fill me-1" style="font-size: 0.5rem;"></i>${ord.status}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty lastOrders}">
                        <div class="col-12 text-center py-5">
                            <i class="bi bi-inbox fs-1 text-muted mb-3 d-block"></i>
                            <p class="text-muted fw-bold">No orders found yet!</p>
                            <a href="HomeServlet" class="btn btn-purple rounded-pill px-4 mt-3 fw-bold">Browse Restaurants</a>
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
        <div class="modal-content border-0 rounded-4 shadow">
            <div class="modal-header border-0 pb-0 pt-4">
                <h5 class="modal-title fw-bold"><i class="bi bi-pencil-square text-purple me-2"></i>Update Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="ProfileServlet" method="POST" id="profileForm">
                <div class="modal-body p-4">
                    <div class="mb-3">
                        <label class="form-label small fw-bold text-muted"><i class="bi bi-person-fill text-primary me-2"></i>FULL NAME</label>
                        <div class="input-group mb-2">
                            <span class="input-group-text border-0 bg-light"><i class="bi bi-person"></i></span>
                            <input type="text" name="name" class="form-control border-0 bg-light" value="${user.name}" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold text-muted"><i class="bi bi-envelope-fill text-success me-2"></i>EMAIL ADDRESS</label>
                        <div class="input-group mb-2">
                            <span class="input-group-text border-0 bg-light"><i class="bi bi-envelope"></i></span>
                            <input type="email" name="email" class="form-control border-0 bg-light" value="${user.email}" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold text-muted"><i class="bi bi-telephone-fill text-info me-2"></i>PHONE NUMBER</label>
                        <div class="input-group mb-2">
                            <span class="input-group-text border-0 bg-light"><i class="bi bi-telephone"></i></span>
                            <input type="tel" name="phone" class="form-control border-0 bg-light" value="${user.phone}" pattern="[0-9]{10}" maxlength="10" required>
                        </div>
                        <div class="form-text small text-muted">Must be exactly 10 digits.</div>
                    </div>
                    <div class="mb-0">
                        <label class="form-label small fw-bold text-muted"><i class="bi bi-geo-alt-fill text-warning me-2"></i>CITY</label>
                        <div class="input-group mb-2">
                            <span class="input-group-text border-0 bg-light"><i class="bi bi-geo-alt"></i></span>
                            <input type="text" name="city" class="form-control border-0 bg-light" value="${user.city}" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0 pt-0 p-4 gap-2">
                    <button type="button" class="btn btn-light rounded-pill px-4 py-2 fw-bold" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-purple rounded-pill px-5 py-2 fw-bold">
                        <i class="bi bi-check-circle me-2"></i>Save Changes
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Profile Form Validation
    document.getElementById('profileForm').addEventListener('submit', function(e) {
        const phone = this.phone.value.trim();
        const name = this.name.value.trim();
        const email = this.email.value.trim();
        
        const phoneRegex = /^[0-9]{10}$/;
        const nameRegex = /^[A-Za-z\s]{2,50}$/;
        const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/;
        
        if (!nameRegex.test(name)) {
            e.preventDefault();
            alert('Please enter a valid name (letters only).');
            return;
        }
        if (!emailRegex.test(email)) {
            e.preventDefault();
            alert('Please enter a valid email address.');
            return;
        }
        if (!phoneRegex.test(phone)) {
            e.preventDefault();
            alert('Please enter a correct 10-digit number.');
            return;
        }
    });

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

    document.addEventListener('DOMContentLoaded', function() {
        const phoneInput = document.querySelector('input[name="phone"]');
        const nameInput = document.querySelector('input[name="name"]');

        // Numeric only for phone
        phoneInput.addEventListener('keypress', function(e) {
            if (!/[0-9]/.test(e.key) && e.key !== 'Backspace' && e.key !== 'Delete' && e.key !== 'ArrowLeft' && e.key !== 'ArrowRight') {
                e.preventDefault();
            }
        });

        // Alpha only for name
        nameInput.addEventListener('keypress', function(e) {
            if (!/[A-Za-z\s]/.test(e.key) && e.key !== 'Backspace' && e.key !== 'Delete' && e.key !== 'ArrowLeft' && e.key !== 'ArrowRight') {
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>
