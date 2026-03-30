<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Order - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
<<<<<<< Updated upstream
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card { background: #2d2048 !important; color: #e9d5ff; border: none; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .bg-light { background: #2d2048 !important; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h4, body.dark-mode h6 { color: #e9d5ff !important; }
        body.dark-mode .step.active .icon { box-shadow: 0 0 0 5px #2d2048, 0 4px 12px rgba(16, 185, 129, 0.3) !important; }
        body.dark-mode .step .icon { background: #2d2048; box-shadow: 0 0 0 5px #2d2048; }
        .bg-purple { background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; transition: all 0.3s ease; }
        .btn-purple:hover { background: var(--primary-dark); color: white; transform: translateY(-2px); box-shadow: 0 4px 12px rgba(139, 92, 246, 0.3); }
        .btn-outline-purple { color: var(--primary); border: 2px solid var(--primary); background: transparent; }
        .btn-outline-purple:hover { background: var(--primary); color: white; }
        .text-purple { color: var(--primary) !important; }
        .dark-toggle { background: none; border: none; color: white; font-size: 1.3rem; cursor: pointer; }
        .step { position: relative; padding-left: 2.5rem; border-left: 3px solid #dee2e6; padding-bottom: 2.5rem; }
        .step:last-child { border-left: none; padding-bottom: 0; }
        .step .icon { 
            position: absolute; 
            left: -16px; 
            top: -5px; 
            background: white; 
            width: 35px; 
            height: 35px; 
            border-radius: 50%; 
            box-shadow: 0 0 0 5px white; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 1.3rem;
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
            --success: #10b981;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #ede9fe 100%);
            min-height: 100vh;
            color: var(--text-primary);
>>>>>>> Stashed changes
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

        .container { margin-top: 3rem; }

        h3 {
            font-size: 2.2rem;
            font-weight: 800;
            letter-spacing: -1px;
            margin-bottom: 2rem;
            color: var(--text-primary);
        }
        body.dark-mode h3 { color: #f8fafc; }

        /* Order Header Card */
        .order-header-card {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: 28px;
            padding: 3rem;
            color: white;
            box-shadow: 0 15px 40px rgba(139, 92, 246, 0.25);
            margin-bottom: -40px;
            position: relative;
            z-index: 1;
        }

        /* Timeline Card */
        .timeline-card {
            border-radius: 28px;
            border: none;
            background: var(--surface);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.05);
            padding: 5rem 3rem 3rem;
        }
        body.dark-mode .timeline-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        /* Timeline Steps (Apple Style) */
        .timeline {
            position: relative;
            padding-left: 3rem;
        }
        .timeline::before {
            content: ""; position: absolute; left: 14px; top: 10px; bottom: 10px;
            width: 4px; background: var(--border-color);
            border-radius: 4px;
        }
        body.dark-mode .timeline::before { background: rgba(255,255,255,0.1); }

        .timeline-step {
            position: relative;
            padding-bottom: 3rem;
            transition: all 0.5s ease;
        }
        .timeline-step:last-child { padding-bottom: 0; }

        .step-indicator {
            position: absolute; left: -3rem; top: 0;
            width: 32px; height: 32px;
            background: var(--surface);
            border: 4px solid var(--border-color);
            border-radius: 50%;
            z-index: 2;
            transition: all 0.3s ease;
            display: flex; align-items: center; justify-content: center;
        }
        body.dark-mode .step-indicator { background: #1e293b; border-color: rgba(255,255,255,0.1); }

        .timeline-step.active .step-indicator {
            background: var(--success);
            border-color: var(--success);
            box-shadow: 0 0 0 8px rgba(16, 185, 129, 0.15);
            color: white;
        }
        .timeline-step.active .step-indicator i { visibility: visible; }
        .step-indicator i { font-size: 0.8rem; visibility: hidden; }

        .step-content {
            opacity: 0.5;
            transition: all 0.3s ease;
        }
        .timeline-step.active .step-content { opacity: 1; transform: translateX(10px); }

        .step-title { font-weight: 800; font-size: 1.25rem; margin-bottom: 4px; }
        .step-desc { font-weight: 500; font-size: 0.95rem; color: var(--text-secondary); }

        /* Order List UI */
        .order-row-card {
            background: var(--surface);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid var(--border-color);
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        body.dark-mode .order-row-card {
            background: rgba(30, 41, 59, 0.5);
            border-color: rgba(139, 92, 246, 0.1);
        }
        .order-row-card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.05); }

        .status-badge {
            padding: 8px 16px;
            border-radius: 12px;
            font-weight: 800;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        @keyframes pulse-success {
            0% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.4); }
            70% { box-shadow: 0 0 0 15px rgba(16, 185, 129, 0); }
            100% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0); }
        }
        .timeline-step.active .step-indicator { animation: pulse-success 2s infinite; }

    </style>
    <c:if test="${not empty order and order.status != 'Delivered'}">
        <meta http-equiv="refresh" content="7">
    </c:if>
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
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle" id="darkToggle" title="Toggle Theme"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link bg-danger bg-opacity-25 border-danger border-opacity-25" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container pb-5">
    
    <c:choose>
        <c:when test="${not empty order}">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <!-- Order Header -->
                    <div class="order-header-card text-center">
                        <div class="mb-3">
                            <span class="badge bg-white text-primary rounded-pill fw-800 px-3 py-2">LIVE TRACKING</span>
                        </div>
                        <h1 class="fw-800 mb-2" style="font-size: 3rem; letter-spacing: -2px;">Order #${order.orderId}</h1>
                        <p class="fs-5 opacity-90 fw-500 mb-0">
                            <i class="bi bi-clock-history me-2"></i>Placed <fmt:formatDate value="${order.createdAt}" pattern="hh:mm a" />
                        </p>
                    </div>

                    <!-- Timeline Content -->
                    <div class="timeline-card">
                        <div class="timeline">
                            <c:set var="st" value="${order.status}" />
                            
                            <div class="timeline-step ${st == 'Preparing' || st == 'Food Ready' || st == 'Out for Delivery' || st == 'Delivered' ? 'active' : ''}">
                                <div class="step-indicator"><i class="bi bi-check-lg"></i></div>
                                <div class="step-content">
                                    <div class="step-title">Order Confirmed</div>
                                    <div class="step-desc">Your order has been received and is being prepared with care.</div>
                                </div>
                            </div>

                            <div class="timeline-step ${st == 'Food Ready' || st == 'Out for Delivery' || st == 'Delivered' ? 'active' : ''}">
                                <div class="step-indicator"><i class="bi bi-check-lg"></i></div>
                                <div class="step-content">
                                    <div class="step-title">Preparing Your Meal</div>
                                    <div class="step-desc">The chef is working their magic. Almost ready for pickup!</div>
                                </div>
                            </div>

                            <div class="timeline-step ${st == 'Out for Delivery' || st == 'Delivered' ? 'active' : ''}">
                                <div class="step-indicator"><i class="bi bi-check-lg"></i></div>
                                <div class="step-content">
                                    <div class="step-title">Out for Delivery</div>
                                    <div class="step-desc">A delivery hero is on their way to your doorstep.</div>
                                </div>
                            </div>

                            <div class="timeline-step ${st == 'Delivered' ? 'active' : ''}">
                                <div class="step-indicator"><i class="bi bi-check-lg"></i></div>
                                <div class="step-content">
                                    <div class="step-title">Delivered</div>
                                    <div class="step-desc">Enjoy your meal! Thank you for choosing Urban Eats.</div>
                                </div>
                            </div>
                        </div>

                        <div class="mt-5 p-4 rounded-4 bg-light bg-opacity-50 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="text-secondary small fw-800 text-uppercase">Payment Amount</span>
                                <div class="fs-3 fw-800 text-primary">₹${order.totalAmount}</div>
                            </div>
                            <div class="text-end">
                                <span class="text-secondary small fw-800 text-uppercase">Method</span>
                                <div class="fw-700 text-dark"><i class="bi bi-credit-card me-2"></i>${order.paymentMethod}</div>
                            </div>
                        </div>

                        <a href="OrderTrackingServlet" class="btn btn-outline-primary w-100 rounded-pill py-3 fw-800 mt-4">
                            Back to My Orders
                        </a>
                    </div>
                </div>
            </div>
        </c:when>
        
        <c:otherwise>
            <div class="d-flex justify-content-between align-items-center mb-5">
                <h3 class="fw-800 mb-0">My Orders</h3>
                <a href="HomeServlet" class="btn btn-purple rounded-pill px-4 fw-800">New Order <i class="bi bi-plus-lg ms-2"></i></a>
            </div>

            <div class="row g-4">
                <c:forEach var="o" items="${orders}">
                    <div class="col-lg-6">
                        <div class="order-row-card">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                    <h5 class="fw-800 mb-1 text-dark">Order #${o.orderId}</h5>
                                    <p class="text-secondary small fw-600 mb-0"><i class="bi bi-calendar3 me-2"></i><fmt:formatDate value="${o.createdAt}" pattern="dd MMM yyyy, hh:mm a" /></p>
                                </div>
                                <span class="status-badge ${o.status == 'Delivered' ? 'bg-success bg-opacity-10 text-success' : 'bg-primary bg-opacity-10 text-primary'}">
                                    ${o.status}
                                </span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <h4 class="fw-800 text-primary mb-0">₹${o.totalAmount}</h4>
                                <a href="OrderTrackingServlet?id=${o.orderId}" class="btn btn-sm btn-outline-primary px-4 rounded-pill fw-800 border-2">
                                    Track Status
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty orders}">
                    <div class="col-12 text-center py-5">
                        <i class="bi bi-receipt fs-1 text-muted opacity-25 mb-3 d-block"></i>
                        <h4 class="fw-800">Your order history is empty</h4>
                        <p class="text-secondary">Start your food journey today!</p>
                        <a href="HomeServlet" class="btn btn-purple rounded-pill px-5 py-3 mt-3 fw-800">Browse Menu</a>
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
