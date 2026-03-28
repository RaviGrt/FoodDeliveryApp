<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - Taaza Food</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light pb-5">
<nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-shop"></i> Taaza</a>
        <div class="d-flex">
            <a href="OrderTrackingServlet" class="btn btn-outline-light me-2 fw-bold"><i class="bi bi-box-seam"></i> Orders</a>
            <a href="login.jsp" class="btn btn-light fw-bold text-danger">Logout</a>
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
                <c:set var="total" value="0"/>
                <c:forEach var="item" items="${cartItems}">
                    <c:set var="itemTotal" value="${250 * item.quantity}" />
                    <c:set var="total" value="${total + itemTotal}"/>
                    
                    <div class="list-group-item p-4 d-flex justify-content-between align-items-center border-0 border-bottom">
                        <div>
                            <h5 class="mb-1 fw-bold"><i class="bi bi-egg-fried text-warning me-2"></i> Item Reference #${item.itemId}</h5>
                            <p class="text-muted mb-0 small">Quantity: <strong>${item.quantity}</strong></p>
                            <p class="mb-0 fw-bold fs-5 mt-2">₹${itemTotal}</p>
                        </div>
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="cartId" value="${item.cartId}">
                            <button type="submit" class="btn btn-outline-danger btn-sm rounded-circle shadow-sm" style="width: 40px; height: 40px;"><i class="bi bi-trash3"></i></button>
                        </form>
                    </div>
                </c:forEach>
                <c:if test="${empty cartItems}">
                    <div class="p-5 text-center text-muted">
                        <i class="bi bi-cart-x fs-1 mb-3 d-block"></i>
                        <h5 class="fw-bold">Your cart is empty!</h5>
                        <p>Go back to restaurants to add items.</p>
                        <a href="HomeServlet" class="btn btn-danger rounded-pill px-4 mt-3 fw-bold">Browse Restaurants</a>
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
                        <span class="fw-bold text-dark">₹${total}</span>
                    </div>
                    <div class="d-flex justify-content-between mb-3 text-muted">
                        <span>Delivery Fee</span>
                        <span class="fw-bold text-success">FREE</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between mb-4 mt-3">
                        <span class="fs-5 fw-bold">To Pay</span>
                        <span class="fs-4 fw-bold text-danger">₹${total}</span>
                    </div>
                    <form action="CheckoutServlet" method="post">
                        <input type="hidden" name="totalAmount" value="${total}">
                        <input type="hidden" name="restaurantId" value="1">
                        <button type="submit" class="btn btn-danger btn-lg w-100 fw-bold rounded-pill shadow-sm">Checkout</button>
                    </form>
                </div>
            </div>
        </div>
        </c:if>
    </div>
</div>
</body>
</html>
