<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${restaurant.name} - Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-shop"></i> Taaza</a>
        <div class="d-flex">
            <a href="CartServlet" class="btn btn-outline-light me-2 fw-bold"><i class="bi bi-cart3"></i> Cart</a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="card bg-white shadow-sm border-0 mb-4 p-4 rounded-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h2 class="fw-bold mb-0">${restaurant.name}</h2>
            <span class="badge bg-success fs-6"><i class="bi bi-star-fill"></i> ${restaurant.rating}</span>
        </div>
        <p class="text-muted fs-5"><i class="bi bi-geo-alt"></i> ${restaurant.city} | <i class="bi bi-clock"></i> ${restaurant.deliveryTime} mins</p>
        <c:if test="${not empty restaurant.offers}">
            <div class="alert alert-danger mb-0 border-0 py-2 d-inline-block fw-bold"><i class="bi bi-tag-fill"></i> ${restaurant.offers}</div>
        </c:if>
    </div>

    <h4 class="fw-bold mb-3">Order Online</h4>
    <div class="list-group mt-3 shadow-sm border-0 mb-5 rounded-4 overflow-hidden">
        <c:forEach var="item" items="${menu}">
            <div class="list-group-item p-4 border-0 border-bottom">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h5 class="mb-1 fw-bold">
                            <i class="bi bi-stop-circle${item.veg ? '-fill text-success' : ' text-danger'}"></i> ${item.name} 
                        </h5>
                        <p class="mb-2 fw-bold fs-5">₹${item.price}</p>
                        <p class="mb-0 text-muted small pe-4">${item.description}</p>
                    </div>
                    <form action="CartServlet" method="post" class="d-flex flex-column align-items-end" style="width: 120px;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="itemId" value="${item.itemId}">
                        <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}">
                        <div class="input-group mb-2 shadow-sm rounded-pill overflow-hidden">
                            <button class="btn btn-light border-0 px-2" type="button" onclick="this.nextElementSibling.stepDown()">-</button>
                            <input type="number" name="quantity" value="1" min="1" class="form-control text-center border-0 bg-light px-0" style="min-width: 40px;">
                            <button class="btn btn-light border-0 px-2" type="button" onclick="this.previousElementSibling.stepUp()">+</button>
                        </div>
                        <button type="submit" class="btn btn-outline-danger btn-sm w-100 fw-bold rounded-pill">ADD</button>
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
</body>
</html>
