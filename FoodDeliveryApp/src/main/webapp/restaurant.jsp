<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${restaurant.name} - Menu - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
<<<<<<< Updated upstream
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; --primary-hover: #6d28d9; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card, body.dark-mode .list-group-item { background: #2d2048 !important; color: #e9d5ff !important; border-color: #3b2d5e; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h2, body.dark-mode h4, body.dark-mode h5 { color: #e9d5ff !important; }
        body.dark-mode .bg-light { background: #3b2d5e !important; }
        .bg-purple { background: var(--primary) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; }
        .btn-purple:hover { background: var(--primary-hover); color: white; }
        .btn-outline-purple { color: var(--primary); border: 2px solid var(--primary); background: transparent; }
        .btn-outline-purple:hover { background: var(--primary); color: white; }
        .text-purple { color: var(--primary) !important; }
        .dark-toggle { background: none; border: none; color: white; font-size: 1.3rem; cursor: pointer; }
        .offer-badge { background: var(--primary-light); color: var(--primary); }
        body.dark-mode .offer-badge { background: #3b2d5e; color: #c4b5fd; }
        .rest-header { background: linear-gradient(135deg, #8b5cf6 0%, #a78bfa 100%); }
        
        /* Modern Toggle Switch */
        .veg-switch { display: flex; align-items: center; cursor: pointer; user-select: none; }
        .veg-switch input { display: none; }
        .veg-slider { width: 44px; height: 22px; background: #cbd5e1; border-radius: 100px; position: relative; transition: 0.3s; margin-right: 10px; }
        .veg-slider::before { content: ""; position: absolute; width: 16px; height: 16px; background: white; border-radius: 50%; top: 3px; left: 3px; transition: 0.3s; }
        .veg-switch input:checked + .veg-slider { background: #10b981; } /* Emerald Green */
        .veg-switch input:checked + .veg-slider::before { transform: translateX(22px); }
        .veg-label { font-weight: 700; font-size: 0.9rem; color: #64748b; }
        .veg-switch input:checked ~ .veg-label { color: #10b981; }
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
>>>>>>> Stashed changes
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

        /* Restaurant Header Overlay */
        .rest-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: 28px;
            padding: 3rem;
            color: white;
            box-shadow: 0 15px 40px rgba(139, 92, 246, 0.25);
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
        }
        .rest-header::after {
            content: ""; position: absolute; top: -50%; right: -10%;
            width: 300px; height: 300px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
        }

        .rating-chip {
            background: #10b981;
            padding: 6px 14px;
            border-radius: 14px;
            font-weight: 800;
            font-size: 1.1rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .menu-card {
            border-radius: 24px;
            border: none;
            background: var(--surface);
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.04);
            overflow: hidden;
        }
        body.dark-mode .menu-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .menu-item {
            padding: 2.5rem;
            border-bottom: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }
        body.dark-mode .menu-item { border-bottom-color: rgba(139, 92, 246, 0.1); }
        .menu-item:hover { background: rgba(139, 92, 246, 0.02); }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 700;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(139, 92, 246, 0.2);
        }
        .btn-purple:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(139, 92, 246, 0.35); color: white; }

        /* Quantity Widget */
        .qty-widget {
            background: var(--surface-light);
            border-radius: 14px;
            border: 1px solid var(--border-color);
            display: flex; align-items: center;
        }
        body.dark-mode .qty-widget { background: rgba(15, 23, 42, 0.4); border-color: rgba(139, 92, 246, 0.2); }
        .qty-widget button {
            background: none; border: none; color: var(--primary);
            width: 36px; height: 36px; font-weight: 800; cursor: pointer;
        }
        .qty-widget input {
            width: 40px; border: none; background: transparent; text-align: center;
            font-weight: 800; color: var(--text-primary);
        }
        body.dark-mode .qty-widget input { color: #f8fafc; }

        /* Veg Switch */
        .veg-switch { display: flex; align-items: center; cursor: pointer; user-select: none; }
        .veg-switch input { display: none; }
        .veg-slider { width: 48px; height: 24px; background: #cbd5e1; border-radius: 100px; position: relative; transition: 0.3s; margin-right: 12px; }
        .veg-slider::before { content: ""; position: absolute; width: 18px; height: 18px; background: white; border-radius: 50%; top: 3px; left: 3px; transition: 0.3s; }
        .veg-switch input:checked + .veg-slider { background: #10b981; }
        .veg-switch input:checked + .veg-slider::before { transform: translateX(24px); }
        .veg-label { font-weight: 700; font-size: 0.95rem; color: var(--text-secondary); }
        .veg-switch input:checked ~ .veg-label { color: #10b981; }

        /* Floating Cart Bar - Premium Glassmorphism */
        #floatingCartBar {
            position: fixed; bottom: 30px; left: 50%; transform: translateX(-50%);
            width: 90%; max-width: 500px;
            background: rgba(139, 92, 246, 0.9);
            backdrop-filter: blur(15px);
            color: white; border-radius: 24px;
            padding: 12px 24px;
            display: none; align-items: center; justify-content: space-between;
            box-shadow: 0 15px 40px rgba(139, 92, 246, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.2);
            z-index: 1001;
            animation: slideUp 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        @keyframes slideUp {
            from { transform: translate(-50%, 150%); opacity: 0; }
            to { transform: translate(-50%, 0); opacity: 1; }
        }

        .btn-view-cart {
            background: white; color: var(--primary);
            font-weight: 800; padding: 10px 20px; border-radius: 16px;
            text-decoration: none; font-size: 0.9rem; transition: all 0.3s ease;
        }
        .btn-view-cart:hover { background: #f8fafc; transform: scale(1.05); }

    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-800 fs-3" href="HomeServlet">
            <i class="bi bi-basket-fill text-warning me-2"></i>Urban Eats
        </a>
        <div class="ms-auto d-flex align-items-center gap-3">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="AI Suggest"><i class="bi bi-stars"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle" id="darkToggle" title="Toggle Theme"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link bg-danger bg-opacity-25 border-danger border-opacity-25" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container pb-5">
    <!-- Header Section -->
    <div class="rest-header mt-5">
        <div class="row align-items-center g-4">
            <div class="col-md-8">
                <div class="d-flex align-items-center gap-3 mb-2">
                    <span class="badge bg-white text-primary rounded-pill fw-800 px-3 py-2">Open Now</span>
                    <span class="badge bg-white bg-opacity-20 text-white rounded-pill fw-700 px-3 py-2"><i class="bi bi-clock me-1"></i> ${restaurant.deliveryTime}m</span>
                </div>
                <h1 class="fw-800 mb-2" style="font-size: 3.5rem; letter-spacing: -2px;">${restaurant.name}</h1>
                <p class="fs-5 opacity-90 fw-500 mb-0"><i class="bi bi-geo-alt-fill me-2"></i>${restaurant.city}</p>
            </div>
            <div class="col-md-4 text-md-end">
                <div class="rating-chip d-inline-block">
                    <i class="bi bi-star-fill me-1"></i> ${restaurant.rating}
                </div>
                <c:if test="${not empty restaurant.offers}">
                    <div class="mt-3 fs-5 fw-700">
                        <i class="bi bi-gift-fill me-2"></i> ${restaurant.offers}
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Filter Bar -->
    <div class="d-flex justify-content-between align-items-center mb-5 px-3">
        <h3 class="fw-800 letter-tight mb-0">Menu Discovery</h3>
        <label class="veg-switch">
            <input type="checkbox" id="vegToggleMenu">
            <span class="veg-slider"></span>
            <span class="veg-label"><i class="bi bi-leaf-fill me-1"></i>Pure Veg Selection</span>
        </label>
    </div>

    <!-- Menu Grid -->
    <div class="menu-card mb-5">
        <c:forEach var="item" items="${menu}">
            <div class="menu-item border-bottom last-child-border-0" data-is-veg="${item.isVeg()}">
                <div class="row align-items-center g-4">
                    <div class="col-md-1">
                        <i class="bi bi-record-btn-fill fs-3 ${item.veg ? 'text-success' : 'text-danger'}"></i>
                    </div>
                    <div class="col-md-7">
                        <h4 class="fw-800 mb-1 text-dark">${item.name}</h4>
                        <h5 class="fw-800 text-primary mb-3">₹${item.price}</h5>
                        <p class="text-secondary small mb-0 pe-md-5">${item.description}</p>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <form action="CartServlet" method="post" class="d-inline-flex flex-column align-items-md-end gap-3 ajax-add-form">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="${item.itemId}">
                            <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}">
                            
                            <div class="qty-widget p-1">
                                <button type="button" onclick="this.nextElementSibling.stepDown()">-</button>
                                <input type="number" name="quantity" value="1" min="1" max="99" readonly>
                                <button type="button" onclick="this.previousElementSibling.stepUp()">+</button>
                            </div>
                            
                            <button type="submit" class="btn btn-purple px-5 py-2 fw-800 rounded-pill">
                                ADD TO BAG
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty menu}">
            <div class="p-5 text-center py-5">
                <i class="bi bi-cloud-slash fs-1 text-muted opacity-25 mb-3 d-block"></i>
                <h4 class="fw-700">Digital menu loading...</h4>
                <p class="text-secondary">Please check back in a few moments.</p>
            </div>
        </c:if>
    </div>
</div>

<!-- Floating Cart Bar -->
<div id="floatingCartBar">
    <div class="d-flex align-items-center gap-3">
        <div class="bg-white bg-opacity-20 p-2 rounded-4">
            <i class="bi bi-cart-fill fs-4"></i>
        </div>
        <div>
            <span id="cartItemCount" class="fw-800 fs-5 d-block line-height-1">0</span>
            <span class="small opacity-75 fw-600">items in bag</span>
        </div>
    </div>
    <a href="CartServlet" class="btn-view-cart text-uppercase">
        View Order <i class="bi bi-chevron-right ms-1"></i>
    </a>
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

    document.addEventListener("DOMContentLoaded", function() {
        // Veg Filtering
        const vegToggle = document.getElementById('vegToggleMenu');
        const menuItems = document.querySelectorAll('.menu-item');
        
        vegToggle.addEventListener('change', () => {
            const onlyVeg = vegToggle.checked;
            menuItems.forEach(item => {
                const isVeg = item.getAttribute('data-is-veg') === 'true';
                item.style.display = (onlyVeg && !isVeg) ? 'none' : 'block';
            });
        });

        const cartBar = document.getElementById('floatingCartBar');
        const countSpan = document.getElementById('cartItemCount');

        function syncCartBar(count) {
            if (count > 0) {
                countSpan.innerText = count;
                cartBar.style.display = 'flex';
            } else {
                cartBar.style.display = 'none';
            }
        }

        // Initial Sync
        fetch('CartServlet?action=count', { headers: { 'X-Requested-With': 'XMLHttpRequest' }})
        .then(res => res.json())
        .then(data => { if (data.status === 'success') syncCartBar(data.cartCount); });

        // AJAX Add Logic
        document.querySelectorAll('.ajax-add-form').forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                const btn = this.querySelector('button[type="submit"]');
                btn.disabled = true;
                btn.style.opacity = '0.7';

                fetch('CartServlet', {
                    method: 'POST',
                    headers: { 
                        'X-Requested-With': 'XMLHttpRequest',
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams(new FormData(this))
                })
                .then(res => res.json())
                .then(data => {
                    if (data.status === 'success') {
                        syncCartBar(data.cartCount);
                        const oldText = btn.innerText;
                        btn.innerText = 'ADDED';
                        btn.classList.add('bg-success');
                        setTimeout(() => {
                            btn.innerText = oldText;
                            btn.classList.remove('bg-success');
                            btn.disabled = false;
                            btn.style.opacity = '1';
                        }, 1000);
                    }
                })
                .catch(() => { btn.disabled = false; btn.style.opacity = '1'; });
            });
        });
    });
</script>
</body>
</html>
