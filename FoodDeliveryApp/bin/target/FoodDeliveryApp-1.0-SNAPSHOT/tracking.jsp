<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Track Order - Taaza Food</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .step { position: relative; padding-left: 2.5rem; border-left: 3px solid #dee2e6; padding-bottom: 2.5rem; }
        .step:last-child { border-left: none; padding-bottom: 0; }
        .step .icon { position: absolute; left: -16px; top: -5px; background: white; width: 30px; height: 30px; border-radius: 50%; box-shadow: 0 0 0 5px white; display: flex; align-items: center; justify-content: center; font-size: 1.2rem; }
        .step.active { border-left-color: #198754; }
        .step.active .icon { color: #198754; background: #e8f5e9; }
        .step.inactive .icon { color: #adb5bd; background: #f8f9fa; }
    </style>
</head>
<body class="bg-light pb-5">
<nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-shop"></i> Taaza</a>
        <a href="HomeServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3">Back to Home</a>
    </div>
</nav>

<div class="container">
    <c:choose>
        <c:when test="${not empty order}">
            <!-- Single Order Tracking Detail -->
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-6">
                    <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
                        <div class="bg-danger p-4 text-white text-center">
                            <h4 class="fw-bold mb-1">Order #${order.orderId}</h4>
                            <p class="mb-0 opacity-75 small"><i class="bi bi-clock"></i> Placed on ${order.createdAt}</p>
                        </div>
                        <div class="card-body p-5">
                            <h5 class="fw-bold mb-5 d-flex align-items-center"><i class="bi bi-activity text-danger me-2 fs-4"></i> Live Tracking</h5>
                            
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
                                <span class="fw-bold fs-4">₹${order.totalAmount}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Orders History -->
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
                                        <p class="text-muted small mb-0"><i class="bi bi-calendar3"></i> ${o.createdAt}</p>
                                    </div>
                                    <div class="text-end">
                                        <span class="badge ${o.status == 'Delivered' ? 'bg-success' : 'bg-warning text-dark'} px-3 py-2 rounded-pill shadow-sm">${o.status}</span>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <div>
                                        <p class="text-muted small mb-0">Total Amount</p>
                                        <p class="fw-bold fs-5 mb-0">₹${o.totalAmount}</p>
                                    </div>
                                    <a href="OrderTrackingServlet?id=${o.orderId}" class="btn btn-outline-danger btn-sm rounded-pill fw-bold px-4 py-2 mt-2">Track & Details</a>
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
                        <a href="HomeServlet" class="btn btn-danger btn-lg rounded-pill px-5 mt-3 fw-bold">Start Ordering</a>
                    </div>
                </c:if>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
