<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Your Cart - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
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
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #ede9fe 100%);
            transition: all 0.3s ease;
            color: var(--text-primary);
        }

        body.dark-mode {
            background: linear-gradient(135deg, #1a1625 0%, #2d1b65 100%);
            color: #e9d5ff;
        }

        body.dark-mode .navbar { background: linear-gradient(135deg, #13011f 0%, #1f0f35 100%) !important; }
        body.dark-mode .card { background: rgba(45, 32, 72, 0.7); border: 1px solid rgba(139, 92, 246, 0.2); }
        body.dark-mode .list-group-item { background: rgba(45, 32, 72, 0.5); border-color: rgba(139, 92, 246, 0.2); color: #e9d5ff; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h3, body.dark-mode h5 { color: #e9d5ff !important; }
        body.dark-mode .bill-row { color: #e9d5ff !important; }
        body.dark-mode .quantity-controls { background: rgba(59, 45, 94, 0.5) !important; border-color: rgba(139, 92, 246, 0.3) !important; }
        body.dark-mode .quantity-controls span { color: #e9d5ff !important; }

        .navbar {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .nav-icon-link {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            color: white !important;
            transition: all 0.3s ease;
            text-decoration: none;
            border: 1px solid rgba(255, 255, 255, 0.15);
        }

        .nav-icon-link:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .dark-toggle {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .dark-toggle:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-3px);
        }

        .container { margin-top: 2rem; }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            font-weight: 700;
            transition: all 0.3s ease;
        }

        .btn-purple:hover {
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary-hover) 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(139, 92, 246, 0.3);
            color: white;
        }

        .btn-outline-danger {
            color: #ef4444;
            border: 1px solid #fecaca;
            background: transparent;
        }

        .btn-outline-danger:hover {
            background: #fef2f2;
            border-color: #ef4444;
        }

        .card {
            border-radius: 16px;
            border: 1px solid var(--border-color);
            background: var(--surface);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 12px 24px rgba(139, 92, 246, 0.1);
        }

        .list-group-item {
            border-radius: 0;
            background: transparent;
            border: none;
            border-bottom: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }

        .list-group-item:hover {
            background: rgba(139, 92, 246, 0.03);
        }

        h3 {
            font-size: 1.8rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1.5rem;
        }

        h5 {
            font-weight: 700;
            color: var(--text-primary);
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            background: var(--surface-light);
            border-radius: 12px;
            padding: 0.5rem 0.75rem;
            border: 1px solid var(--border-color);
        }

        .quantity-controls button {
            background: none;
            border: none;
            color: var(--primary);
            font-weight: 700;
            cursor: pointer;
            padding: 0 0.5rem;
            transition: all 0.2s ease;
        }

        .quantity-controls button:hover {
            transform: scale(1.2);
        }

        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
        }

        .empty-state i {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .bill-summary {
            border-top: 2px solid var(--border-color);
            padding-top: 1rem;
            margin-top: 1rem;
        }

        .bill-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
            font-size: 0.95rem;
        }

        .bill-row.total {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--primary);
            margin-top: 0.75rem;
        }

        @media (max-width: 768px) {
            h3 { font-size: 1.5rem; }
            .container { margin-top: 1rem; }
        }
    </style>
</head>
<body class="pb-5">
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="HomeServlet">
            <i class="bi bi-basket-fill" style="color: #fbbf24; margin-right: 0.5rem;"></i>Urban Eats
        </a>
        <div class="ms-auto d-flex align-items-center gap-2">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="Mood Suggest"><i class="bi bi-stars"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container">
    <h3><i class="bi bi-bag-check me-2"></i>Shopping Cart</h3>
    
    <% String err = request.getParameter("error"); if (err != null) { %>
        <div class="alert alert-danger border-0" style="background: #fef2f2; color: #b91c1c;">
            <i class="bi bi-exclamation-triangle-fill me-2"></i><%= err %>
        </div>
    <% } %>

    <div class="row g-4">
        <!-- Items Column -->
        <div class="col-lg-8">
            <div class="card rounded-4">
                <div class="list-group">
                    <c:forEach var="item" items="${cartItems}">
                        <c:set var="mItem" value="${menuMap[item.itemId]}" />
                        <c:set var="itemTotal" value="${mItem.price * item.quantity}" />
                        <div class="list-group-item p-4">
                            <div class="row align-items-center">
                                <div class="col-md-7">
                                    <h5 class="mb-2">
                                        <i class="bi bi-egg-fried text-warning me-2"></i>${mItem.name}
                                    </h5>
                                    <p class="text-muted small mb-3">₹${mItem.price} per item</p>
                                    <div class="quantity-controls" style="width: fit-content;">
                                        <button onclick="updateQty(${item.cartId}, ${item.quantity - 1}, this)">−</button>
                                        <span class="fw-bold quantity-val" id="qty-${item.cartId}">${item.quantity}</span>
                                        <button onclick="updateQty(${item.cartId}, ${item.quantity + 1}, this)">+</button>
                                    </div>
                                </div>
                                <div class="col-md-5 text-md-end">
                                    <p class="mb-2 fw-bold" style="font-size: 1.2rem; color: var(--primary);" id="total-${item.cartId}">
                                        ₹${itemTotal}
                                    </p>
                                    <input type="hidden" class="item-price" data-price="${mItem.price}">
                                    <button onclick="updateQty(${item.cartId}, 0, this)" class="btn btn-outline-danger btn-sm" title="Remove">
                                        <i class="bi bi-trash3 me-1"></i>Remove
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty cartItems}">
                        <div class="empty-state">
                            <i class="bi bi-cart-x"></i>
                            <h5 class="mt-3">Your cart is empty</h5>
                            <p class="text-muted mb-4">No items yet. Browse restaurants and add your favorites!</p>
                            <a href="HomeServlet" class="btn btn-purple rounded-pill px-4 fw-bold">
                                <i class="bi bi-shop me-2"></i>Browse Restaurants
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Bill Summary Column -->
        <c:if test="${not empty cartItems}">
        <div class="col-lg-4">
            <div class="card rounded-4 position-sticky" style="top: 2rem;">
                <div class="card-body p-4">
                    <h5 class="mb-4"><i class="bi bi-receipt me-2"></i>Bill Details</h5>
                    
                    <div class="bill-row">
                        <span>Item Total</span>
                        <strong>₹${subtotal}</strong>
                    </div>
                    
                    <c:if test="${discountAmount > 0}">
                        <div class="bill-row" style="color: #10b981;">
                            <span>Discount (${offerText})</span>
                            <strong>− ₹${discountAmount}</strong>
                        </div>
                    </c:if>
                    
                    <div class="bill-row">
                        <span>Delivery</span>
                        <span style="color: #10b981; font-weight: 700;">FREE</span>
                    </div>

                    <div class="bill-summary">
                        <div class="bill-row total">
                            <span>Total</span>
                            <span>₹${totalAmount}</span>
                        </div>
                    </div>

                    <form action="CheckoutServlet" method="post" class="mt-4">
                        <input type="hidden" name="totalAmount" value="${totalAmount}">
                        <input type="hidden" name="restaurantId" value="${restaurantId}">
                        <button type="submit" class="btn btn-purple btn-lg w-100 fw-bold rounded-pill">
                            <i class="bi bi-lock-fill me-2"></i>Proceed to Payment
                        </button>
                    </form>
                    
                    <p class="text-center text-muted small mt-3 mb-0">
                        <i class="bi bi-shield-check me-1"></i>Secure checkout powered by Urban Eats
                    </p>
                </div>
            </div>
        </div>
        </c:if>
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

    function updateQty(cartId, newQty, btn) {
        if (newQty < 0) return;
        
        // Visual feedback: disable while loading
        const btnGroup = btn.closest('.rounded-pill') || btn.parentElement;
        btnGroup.style.opacity = '0.5';
        btnGroup.style.pointerEvents = 'none';

        fetch('${pageContext.request.contextPath}/CartServlet', {
            method: 'POST',
            headers: { 
                'Content-Type': 'application/x-www-form-urlencoded',
                'X-Requested-With': 'XMLHttpRequest'
            },
            body: 'action=update&cartId=' + cartId + '&newQuantity=' + newQty
        })
        .then(res => res.json())
        .then(data => {
            if (data.status === 'success') {
                if (newQty === 0) {
                    const row = btn.closest('.list-group-item');
                    row.style.opacity = '0';
                    setTimeout(() => {
                        row.remove();
                        if (document.querySelectorAll('.list-group-item').length === 0) {
                            location.reload();
                        }
                    }, 300);
                } else {
                    const qtySpan = document.getElementById('qty-' + cartId);
                    const totalSpan = document.getElementById('total-' + cartId);
                    const priceSpan = btn.closest('.list-group-item').querySelector('.item-price');
                    const price = parseFloat(priceSpan.getAttribute('data-price'));
                    
                    qtySpan.innerText = newQty;
                    totalSpan.innerText = '₹' + (price * newQty).toFixed(2);
                    
                    // Update buttons' new onclick values
                    const btns = btnGroup.querySelectorAll('button');
                    btns[0].setAttribute('onclick', 'updateQty(' + cartId + ', ' + (newQty - 1) + ', this)');
                    btns[1].setAttribute('onclick', 'updateQty(' + cartId + ', ' + (newQty + 1) + ', this)');
                }

                // Update Bill Details
                document.querySelector('.col-md-4 .text-muted .fw-bold').innerText = '₹' + data.subtotal.toFixed(2);
                const discountRow = document.querySelector('.col-md-4 .text-success .fw-bold');
                if (discountRow) {
                    discountRow.innerText = '- ₹' + data.discount.toFixed(2);
                }
                document.querySelector('.col-md-4 .text-purple.fs-4').innerText = '₹' + data.total.toFixed(2);
            }
        })
        .catch(err => {
            console.error('Error updating cart:', err);
            alert('Failed to update cart. Please try again.');
        })
        .finally(() => {
            btnGroup.style.opacity = '1';
            btnGroup.style.pointerEvents = 'auto';
        });
    }
</script>
</body>
</html>
