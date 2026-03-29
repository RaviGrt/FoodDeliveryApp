<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Track Order - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card { background: #2d2048 !important; color: #e9d5ff; border: none; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .bg-light { background: #2d2048 !important; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .step .icon { background: #2d2048; box-shadow: 0 0 0 5px #2d2048; }
        .bg-purple { background: var(--primary) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; }
        .btn-purple:hover { background: var(--primary-dark); color: white; }
        .btn-outline-purple { color: var(--primary); border: 2px solid var(--primary); background: transparent; }
        .btn-outline-purple:hover { background: var(--primary); color: white; }
        .text-purple { color: var(--primary) !important; }
        .dark-toggle { background: none; border: none; color: white; font-size: 1.3rem; cursor: pointer; }
        .step { position: relative; padding-left: 2.5rem; border-left: 3px solid #dee2e6; padding-bottom: 2.5rem; }
        .step:last-child { border-left: none; padding-bottom: 0; }
        .step .icon { position: absolute; left: -16px; top: -5px; background: white; width: 30px; height: 30px; border-radius: 50%; box-shadow: 0 0 0 5px white; display: flex; align-items: center; justify-content: center; font-size: 1.2rem; }
        .step.active { border-left-color: #198754; }
        .step.active .icon { color: #198754; background: #e8f5e9; }
        .step.inactive .icon { color: #adb5bd; background: #f8f9fa; }
        .order-header { background: linear-gradient(135deg, #8b5cf6 0%, #a78bfa 100%); }
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
        .dark-toggle { width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; background: rgba(255, 255, 255, 0.1); border-radius: 12px; border: 1px solid rgba(255, 255, 255, 0.1); transition: 0.2s; color: white; }
        .dark-toggle:hover { background: rgba(255, 255, 255, 0.25); transform: translateY(-2px); }
    </style>
    <c:if test="${not empty order and order.status != 'Delivered'}">
        <meta http-equiv="refresh" content="5">
    </c:if>
</head>
<body class="pb-5">
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm mb-4">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="ms-auto d-flex align-items-center gap-2">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="Mood Suggest"><i class="bi bi-stars"></i></a>
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <!-- Hidden Orders Icon -->
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle mx-1" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link logout-box shadow-sm ms-2" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container">
    <c:choose>
        <c:when test="${not empty order}">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-6">
                    <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
                        <div class="order-header p-4 text-white text-center">
                            <h4 class="fw-bold mb-1">Order #${order.orderId}</h4>
                            <p class="mb-0 opacity-75 small"><i class="bi bi-clock"></i> Placed on <fmt:formatDate value="${order.createdAt}" pattern="dd MMM yyyy, hh:mm a" /></p>
                        </div>
                        <div class="card-body p-5">
                            <h5 class="fw-bold mb-5 d-flex align-items-center"><i class="bi bi-activity text-purple me-2 fs-4"></i> Live Tracking</h5>
                            <c:set var="st" value="${order.status}" />
                            <div class="step ${st == 'Preparing' || st == 'Food Ready' || st == 'Out for Delivery' || st == 'Delivered' ? 'active' : 'inactive'}">
                                <div class="icon"><i class="bi bi-check-lg"></i></div>
                                <h6 class="fw-bold mb-1">Order Confirmed</h6>
                                <p class="text-muted small mb-0">Your food is being prepared.</p>
                            </div>
                            <div class="step ${st == 'Food Ready' || st == 'Out for Delivery' || st == 'Delivered' ? 'active' : 'inactive'}">
                                <div class="icon"><i class="bi bi-box-seam"></i></div>
                                <h6 class="fw-bold mb-1">Food Ready</h6>
                                <p class="text-muted small mb-0">Food is packed and ready for pickup.</p>
                            </div>
                            <div class="step ${st == 'Out for Delivery' || st == 'Delivered' ? 'active' : 'inactive'}">
                                <div class="icon"><i class="bi bi-bicycle"></i></div>
                                <h6 class="fw-bold mb-1">Out for Delivery</h6>
                                <p class="text-muted small mb-0">Delivery partner is on the way.</p>
                            </div>
                            <div class="step ${st == 'Delivered' ? 'active' : 'inactive'}" style="border: none;">
                                <div class="icon"><i class="bi bi-house-check"></i></div>
                                <h6 class="fw-bold mb-1">Delivered</h6>
                                <p class="text-muted small mb-0">Enjoy your meal!</p>
                            </div>
                        </div>
                        <div class="bg-light p-4 border-top">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-muted fw-bold">Paid via ${order.paymentMethod}</span>
                                <span class="fw-bold fs-4 text-purple">₹${order.totalAmount}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="d-flex justify-content-between align-items-end mb-4">
                <h3 class="fw-bold mb-0">My Orders</h3>
            </div>
            <div class="row">
                <c:forEach var="o" items="${orders}">
                    <div class="col-md-6 mb-4">
                        <div class="card border-0 shadow-sm rounded-4 h-100">
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between mb-3 border-bottom pb-3">
                                    <div>
                                        <h5 class="fw-bold mb-1">Order #${o.orderId}</h5>
                                        <p class="text-muted small mb-0"><i class="bi bi-calendar3"></i> <fmt:formatDate value="${o.createdAt}" pattern="dd MMM yyyy, hh:mm a" /></p>
                                    </div>
                                    <div class="text-end">
                                        <span class="badge ${o.status == 'Delivered' ? 'bg-success' : 'bg-warning text-dark'} px-3 py-2 rounded-pill shadow-sm">${o.status}</span>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <div>
                                        <p class="text-muted small mb-0">Total Amount</p>
                                        <p class="fw-bold fs-5 mb-0 text-purple">₹${o.totalAmount}</p>
                                    </div>
                                    <a href="OrderTrackingServlet?id=${o.orderId}" class="btn btn-outline-purple btn-sm rounded-pill fw-bold px-4 py-2 mt-2">Track &amp; Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty orders}">
                    <div class="col-12 text-center my-5 py-5 bg-white rounded-4 shadow-sm border-0">
                        <i class="bi bi-receipt text-muted fs-1 d-block mb-3"></i>
                        <h4 class="fw-bold text-muted">No past orders found.</h4>
                        <p class="text-muted">Looks like you haven't placed an order yet.</p>
                        <a href="HomeServlet" class="btn btn-purple btn-lg rounded-pill px-5 mt-3 fw-bold">Start Ordering</a>
                    </div>
                </c:if>
            </div>
        </c:otherwise>
    </c:choose>
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
