<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${restaurant.name} - Menu - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; --primary-hover: #6d28d9; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card, body.dark-mode .list-group-item { background: #2d2048 !important; color: #e9d5ff !important; border-color: #3b2d5e; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
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
        
        /* Floating Cart Bar */
        #floatingCartBar {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            width: 90%;
            max-width: 600px;
            background: #8b5cf6;
            color: white;
            border-radius: 16px;
            padding: 14px 24px;
            display: none; /* Shown via JS */
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 10px 25px rgba(139, 92, 246, 0.4);
            z-index: 1000;
            backdrop-filter: blur(8px);
            animation: slideUp 0.3s ease-out;
        }
        @keyframes slideUp {
            from { transform: translate(-50%, 100%); opacity: 0; }
            to { transform: translate(-50%, 0); opacity: 1; }
        }
        .cart-info { display: flex; align-items: center; gap: 12px; }
        .btn-view-cart {
            background: white;
            color: #8b5cf6;
            border: none;
            border-radius: 12px;
            padding: 6px 16px;
            font-weight: 800;
            text-decoration: none;
            font-size: 0.9rem;
            transition: 0.2s;
        }
        .btn-view-cart:hover { background: #f3f4f6; color: #7c3aed; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="ms-auto d-flex align-items-center gap-2">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="Mood Suggest"><i class="bi bi-stars"></i></a>
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle mx-1" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link logout-box shadow-sm ms-2" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="card shadow-sm border-0 mb-4 rounded-4 overflow-hidden">
        <div class="rest-header p-4 text-white">
            <div class="d-flex justify-content-between align-items-center mb-1">
                <h2 class="fw-bold mb-0">${restaurant.name}</h2>
                <span class="badge bg-success fs-6"><i class="bi bi-star-fill"></i> ${restaurant.rating}</span>
            </div>
            <p class="opacity-75 mb-0 fs-5"><i class="bi bi-geo-alt"></i> ${restaurant.city} &nbsp;|&nbsp; <i class="bi bi-clock"></i> ${restaurant.deliveryTime} mins</p>
        </div>
        <c:if test="${not empty restaurant.offers}">
            <div class="px-4 py-3 offer-badge fw-bold"><i class="bi bi-tag-fill"></i> ${restaurant.offers}</div>
        </c:if>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="fw-bold mb-0">Order Online</h4>
        <div class="pe-2">
            <label class="veg-switch">
                <input type="checkbox" id="vegToggleMenu">
                <span class="veg-slider"></span>
                <span class="veg-label">Veg Only</span>
            </label>
        </div>
    </div>
    <div class="list-group shadow-sm border-0 mb-5 rounded-4 overflow-hidden">
        <c:forEach var="item" items="${menu}">
            <div class="list-group-item p-4 border-0 border-bottom menu-item" data-is-veg="${item.isVeg()}">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h5 class="mb-1 fw-bold">
                            <i class="bi bi-stop-circle${item.veg ? '-fill text-success' : ' text-danger'}"></i> ${item.name}
                        </h5>
                        <p class="mb-2 fw-bold fs-5 text-purple">₹${item.price}</p>
                        <p class="mb-0 text-muted small pe-4">${item.description}</p>
                    </div>
                    <form action="CartServlet" method="post" class="d-flex flex-column align-items-end" style="width: 120px;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="itemId" value="${item.itemId}">
                        <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}">
                        <div class="input-group mb-2 shadow-sm rounded-pill overflow-hidden">
                            <button class="btn btn-light border-0 px-2" type="button" onclick="this.nextElementSibling.stepDown()">-</button>
                            <input type="number" name="quantity" value="1" min="1" max="99" class="form-control text-center border-0 bg-light px-0" style="min-width: 40px;" readonly>
                            <button class="btn btn-light border-0 px-2" type="button" onclick="this.previousElementSibling.stepUp()">+</button>
                        </div>
                        <button type="submit" class="btn btn-outline-purple btn-sm w-100 fw-bold rounded-pill">ADD</button>
                    </form>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty menu}">
            <div class="p-5 text-center text-muted">
                <i class="bi bi-journal-x fs-1 mb-2"></i>
                <p>Menu is currently unavailable.</p>
            </div>
        </c:if>
    </div>
</div>

<!-- Floating Cart Bar -->
<div id="floatingCartBar">
    <div class="cart-info">
        <i class="bi bi-bag-check-fill fs-4"></i>
        <div>
            <span id="cartItemCount" class="fw-bold fs-5">0</span>
            <span class="small opacity-75 d-block">Items in your cart</span>
        </div>
    </div>
    <a href="CartServlet" class="btn-view-cart text-uppercase">
        View Cart <i class="bi bi-arrow-right ms-1"></i>
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

    // Veg Filtering Logic for Menu
    document.addEventListener("DOMContentLoaded", function() {
        const vegToggle = document.getElementById('vegToggleMenu');
        const menuItems = document.querySelectorAll('.menu-item');
        const menuList = document.querySelector('.list-group');

        function filterMenu() {
            const isVegOnly = vegToggle.checked;
            let visibleCount = 0;

            menuItems.forEach(item => {
                const isItemVeg = item.getAttribute('data-is-veg') === 'true';
                if (isVegOnly && !isItemVeg) {
                    item.style.display = 'none';
                } else {
                    item.style.display = 'block';
                    visibleCount++;
                }
            });

            const noVegMsgId = 'noVegMenuMsg';
            let noVegMsg = document.getElementById(noVegMsgId);

            if (visibleCount === 0 && menuItems.length > 0) {
                if (!noVegMsg) {
                    noVegMsg = document.createElement('div');
                    noVegMsg.id = noVegMsgId;
                    noVegMsg.className = 'p-5 text-center text-muted';
                    noVegMsg.innerHTML = '<i class="bi bi-patch-exclamation fs-1 mb-2 d-block"></i><p>No vegetarian options available in this menu.</p>';
                    menuList.appendChild(noVegMsg);
                }
            } else if (noVegMsg) {
                noVegMsg.remove();
            }
        }

        if (vegToggle) {
            vegToggle.addEventListener('change', filterMenu);
        }

        // AJAX Add to Cart & Floating Bar Logic
        const cartBar = document.getElementById('floatingCartBar');
        const countSpan = document.getElementById('cartItemCount');

        function updateCartBar(count) {
            if (count > 0) {
                countSpan.innerText = count;
                cartBar.style.display = 'flex';
            } else {
                cartBar.style.display = 'none';
            }
        }

        // Initial check
        fetch('CartServlet?action=count', {
            method: 'POST',
            headers: { 'X-Requested-With': 'XMLHttpRequest' }
        })
        .then(res => res.json())
        .then(data => {
            if (data.status === 'success') updateCartBar(data.cartCount);
        });

        // Intercept Form Submit
        const addForms = document.querySelectorAll('form[action="CartServlet"]');
        addForms.forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                const params = new URLSearchParams(formData);

                fetch('CartServlet', {
                    method: 'POST',
                    headers: { 
                        'X-Requested-With': 'XMLHttpRequest',
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: params
                })
                .then(res => res.json())
                .then(data => {
                    if (data.status === 'success') {
                        updateCartBar(data.cartCount);
                        // Subtle feedback on button
                        const btn = form.querySelector('button[type="submit"]');
                        const originalText = btn.innerText;
                        btn.innerText = 'ADDED!';
                        btn.classList.add('btn-success');
                        btn.classList.remove('btn-outline-purple');
                        setTimeout(() => {
                            btn.innerText = originalText;
                            btn.classList.remove('btn-success');
                            btn.classList.add('btn-outline-purple');
                        }, 1500);
                    } else if (data.status === 'error') {
                        alert(data.message);
                        if (data.message.includes('login')) window.location.href = 'login.jsp';
                    }
                })
                .catch(err => {
                    console.error('Add to cart failed:', err);
                });
            });
        });
    });
</script>
</body>
</html>
