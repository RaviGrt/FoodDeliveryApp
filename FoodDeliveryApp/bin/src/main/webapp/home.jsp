<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Taaza Food Delivery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .card-hover:hover { transform: translateY(-3px); transition: 0.2s ease-in-out; box-shadow: 0 10px 20px rgba(0,0,0,0.1)!important; cursor: pointer; }
    </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-shop"></i> Taaza</a>
        <div class="d-flex">
            <a href="CartServlet" class="btn btn-outline-light me-2 fw-bold"><i class="bi bi-cart3"></i> Cart</a>
            <a href="OrderTrackingServlet" class="btn btn-outline-light me-2 fw-bold"><i class="bi bi-box-seam"></i> Orders</a>
            <a href="login.jsp" class="btn btn-light fw-bold text-danger">Logout</a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <c:if test="${not empty aiSuggestion}">
        <div class="alert alert-danger border-0 shadow-sm rounded-3 d-flex align-items-center">
            <i class="bi bi-stars fs-4 me-3"></i>
            <div>
                <strong>AI Suggestion:</strong> ${aiSuggestion}
            </div>
        </div>
    </c:if>

    <div class="card mb-5 shadow-sm border-0 rounded-4">
        <div class="card-body p-4">
            <form action="SearchServlet" method="get" class="d-flex gx-2">
                <input type="text" name="query" class="form-control form-control-lg bg-light border-0 me-2" placeholder="Search for restaurants or cuisines..." value="${searchQuery}">
                <button type="submit" class="btn btn-danger btn-lg px-4 fw-bold">Search</button>
            </form>
        </div>
    </div>

    <h4 class="fw-bold mb-4">Top Restaurants Around You</h4>
    <div class="row">
        <c:forEach var="r" items="${restaurants}">
            <div class="col-md-4 mb-4">
                <a href="RestaurantServlet?id=${r.restaurantId}" class="text-decoration-none text-dark">
                <div class="card shadow-sm h-100 border-0 rounded-4 card-hover">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-start mb-2">
                            <h5 class="card-title fw-bold mb-0">${r.name}</h5>
                            <span class="badge bg-success py-2 px-2"><i class="bi bi-star-fill"></i> ${r.rating}</span>
                        </div>
                        <p class="card-text text-muted mb-3"><small><i class="bi bi-geo-alt"></i> ${r.city}</small></p>
                        
                        <div class="d-flex align-items-center mb-3">
                            <span class="text-muted small me-3"><i class="bi bi-clock"></i> ${r.deliveryTime} mins</span>
                            <c:if test="${r.vegOnly}">
                                <span class="badge text-bg-success"><i class="bi bi-leaf"></i> Pure Veg</span>
                            </c:if>
                        </div>
                        
                        <c:if test="${not empty r.offers}">
                            <div class="bg-light p-2 rounded-3 text-danger small fw-bold mt-auto mb-2">
                                <i class="bi bi-tag-fill"></i> ${r.offers}
                            </div>
                        </c:if>
                        <button class="btn btn-outline-danger w-100 fw-bold rounded-pill">View Menu</button>
                    </div>
                </div>
                </a>
            </div>
        </c:forEach>
        <c:if test="${empty restaurants}">
            <div class="col-12 text-center text-muted my-5 py-5">
                <i class="bi bi-emoji-frown fs-1 mb-3 d-block"></i>
                <h5>No restaurants found. Try a different search!</h5>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
