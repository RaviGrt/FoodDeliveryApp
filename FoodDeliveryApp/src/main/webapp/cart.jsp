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
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card, body.dark-mode .list-group-item { background: #2d2048 !important; color: #e9d5ff !important; border-color: #3b2d5e; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .bg-light { background: #3b2d5e !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        .bg-purple { background: var(--primary) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; }
        .btn-purple:hover { background: var(--primary-dark); color: white; }
        .btn-outline-purple { color: var(--primary); border: 2px solid var(--primary); background: transparent; }
        .btn-outline-purple:hover { background: var(--primary); color: white; }
        .text-purple { color: var(--primary) !important; }
        .dark-toggle { background: none; border: none; color: white; font-size: 1.3rem; cursor: pointer; }
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
</head>
<body class="pb-5">
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm mb-4">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="ms-auto d-flex align-items-center gap-2">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="Mood Suggest"><i class="bi bi-stars"></i></a>
            <!-- Hidden Cart Icon -->
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle mx-1" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link logout-box shadow-sm ms-2" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container">
    <h3 class="fw-bold mb-4">Your Shopping Cart</h3>
    <% String err = request.getParameter("error"); if (err != null) { %>
        <div class="alert alert-danger border-0 shadow-sm"><%= err %></div>
    <% } %>

    <div class="row">
        <div class="col-md-8 mb-4">
            <div class="list-group shadow-sm border-0 rounded-4">
                <c:forEach var="item" items="${cartItems}">
                    <c:set var="mItem" value="${menuMap[item.itemId]}" />
                    <c:set var="itemTotal" value="${mItem.price * item.quantity}" />
                    <div class="list-group-item p-4 d-flex justify-content-between align-items-center border-0 border-bottom">
                        <div>
                            <h5 class="mb-1 fw-bold"><i class="bi bi-egg-fried text-warning me-2"></i>${mItem.name}</h5>
                            <div class="d-flex align-items-center mt-2 gap-3">
                                <div class="d-flex align-items-center border rounded-pill px-2 py-1 bg-light">
                                    <button onclick="updateQty(${item.cartId}, ${item.quantity - 1}, this)" class="btn btn-sm text-purple fw-bold p-0 px-2" style="border:none; background:none;">-</button>
                                    <span class="mx-2 fw-bold quantity-val" id="qty-${item.cartId}">${item.quantity}</span>
                                    <button onclick="updateQty(${item.cartId}, ${item.quantity + 1}, this)" class="btn btn-sm text-purple fw-bold p-0 px-2" style="border:none; background:none;">+</button>
                                </div>
                                <span class="fw-bold text-muted small item-price" data-price="${mItem.price}">@ ₹${mItem.price}</span>
                            </div>
                            <p class="mb-0 fw-bold fs-5 mt-2 text-purple item-total" id="total-${item.cartId}">₹${itemTotal}</p>
                        </div>
                        <div class="d-flex flex-column align-items-end">
                            <button onclick="updateQty(${item.cartId}, 0, this)" class="btn btn-outline-danger btn-sm rounded-circle shadow-sm" style="width: 35px; height: 35px;" title="Remove item">
                                <i class="bi bi-trash3"></i>
                            </button>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty cartItems}">
                    <div class="p-5 text-center text-muted">
                        <i class="bi bi-cart-x fs-1 mb-3 d-block"></i>
                        <h5 class="fw-bold">Your cart is empty!</h5>
                        <p>Go back to restaurants to add items.</p>
                        <a href="HomeServlet" class="btn btn-purple rounded-pill px-4 mt-3 fw-bold">Browse Restaurants</a>
                    </div>
                </c:if>
            </div>
        </div>

        <c:if test="${not empty cartItems}">
        <div class="col-md-4">
            <div class="card shadow-sm border-0 rounded-4 sticky-md-top" style="top: 20px;">
                <div class="card-body p-4">
                    <h5 class="fw-bold mb-4">Bill Details</h5>
                    <div class="d-flex justify-content-between mb-2 text-muted">
                        <span>Item Total</span>
                        <span class="fw-bold">₹${subtotal}</span>
                    </div>
                    <c:if test="${discountAmount > 0}">
                        <div class="d-flex justify-content-between mb-2 text-success">
                            <span>Discount (${offerText})</span>
                            <span class="fw-bold">- ₹${discountAmount}</span>
                        </div>
                    </c:if>
                    <div class="d-flex justify-content-between mb-3 text-muted">
                        <span>Delivery Fee</span>
                        <span class="fw-bold text-success">FREE</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between mb-4 mt-3">
                        <span class="fs-5 fw-bold">To Pay</span>
                        <span class="fs-4 fw-bold text-purple">₹${totalAmount}</span>
                    </div>
                    <form action="CheckoutServlet" method="post">
                        <input type="hidden" name="totalAmount" value="${totalAmount}">
                        <input type="hidden" name="restaurantId" value="${restaurantId}">
                        <button type="submit" class="btn btn-purple btn-lg w-100 fw-bold rounded-pill shadow-sm">Checkout</button>
                    </form>
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
