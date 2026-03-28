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
    </style>
</head>
<body class="pb-5">
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="d-flex align-items-center gap-2">
            <a href="MoodSuggestServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3"><i class="bi bi-stars"></i> Mood</a>
            <a href="OrderTrackingServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3"><i class="bi bi-box-seam"></i> Orders</a>
            <button class="dark-toggle" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="btn btn-light btn-sm fw-bold text-purple rounded-pill px-3">Logout</a>
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
                            <p class="text-muted mb-0 small">Quantity: <strong>${item.quantity}</strong></p>
                            <p class="mb-0 fw-bold fs-5 mt-2 text-purple">₹${itemTotal}</p>
                        </div>
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="cartId" value="${item.cartId}">
                            <button type="submit" class="btn btn-outline-purple btn-sm rounded-circle shadow-sm" style="width: 40px; height: 40px;"><i class="bi bi-trash3"></i></button>
                        </form>
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
</script>
</body>
</html>
