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
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="d-flex align-items-center gap-2">
            <a href="MoodSuggestServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3"><i class="bi bi-stars me-1"></i>Mood</a>
            <a href="CartServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3"><i class="bi bi-cart3"></i> Cart</a>
            <button class="dark-toggle" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
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

    <h4 class="fw-bold mb-3">Order Online</h4>
    <div class="list-group shadow-sm border-0 mb-5 rounded-4 overflow-hidden">
        <c:forEach var="item" items="${menu}">
            <div class="list-group-item p-4 border-0 border-bottom">
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
                            <input type="number" name="quantity" value="1" min="1" class="form-control text-center border-0 bg-light px-0" style="min-width: 40px;">
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
