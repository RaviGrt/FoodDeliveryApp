<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; --primary-hover: #6d28d9; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; transition: background 0.3s, color 0.3s; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card { background: #2d2048 !important; color: #e9d5ff !important; border: none; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .modal-content { background: #2d2048; color: #e9d5ff; }
        body.dark-mode .form-select, body.dark-mode .form-control { background: #3b2d5e !important; color: #e9d5ff !important; border: 1px solid #5b3f8c; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .bg-light { background: #2d2048 !important; }
        .bg-purple { background: var(--primary) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; }
        .btn-purple:hover { background: var(--primary-hover); color: white; }
        .btn-outline-purple { color: var(--primary); border: 2px solid var(--primary); background: transparent; }
        .btn-outline-purple:hover { background: var(--primary); color: white; }
        .text-purple { color: var(--primary) !important; }
        .card-hover:hover { transform: translateY(-4px); transition: 0.2s ease-in-out; box-shadow: 0 12px 30px rgba(139,92,246,0.2) !important; cursor: pointer; }
        .dark-toggle { background: none; border: none; color: white; font-size: 1.3rem; cursor: pointer; }
        .offer-badge { background: var(--primary-light); color: var(--primary); }
        body.dark-mode .offer-badge { background: #3b2d5e; color: #c4b5fd; }
        .city-select select { color: var(--primary); font-weight: 700; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="d-flex align-items-center gap-2">
            <a href="MoodSuggestServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3"><i class="bi bi-stars me-1"></i>Mood Suggest</a>
            <a href="CartServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3"><i class="bi bi-cart3"></i> Cart</a>
            <a href="OrderTrackingServlet" class="btn btn-outline-light btn-sm fw-bold rounded-pill px-3"><i class="bi bi-box-seam"></i> Orders</a>
            <button class="dark-toggle" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="btn btn-light btn-sm fw-bold text-purple rounded-pill px-3">Logout</a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <c:if test="${not empty aiSuggestion}">
        <div class="alert border-0 shadow-sm rounded-3 d-flex align-items-center mb-4" style="background:var(--primary-light); color:var(--primary);">
            <i class="bi bi-stars fs-4 me-3"></i>
            <div><strong>AI Suggestion:</strong> ${aiSuggestion}</div>
        </div>
    </c:if>

    <div class="card mb-5 shadow-sm border-0 rounded-4">
        <div class="card-body p-4">
            <div class="row g-2">
                <div class="col-md-3 city-select">
                    <form action="HomeServlet" method="get" id="cityFilterForm">
                        <select name="city" class="form-select form-select-lg bg-light border-0 fw-bold shadow-sm" style="color:var(--primary)" onchange="document.getElementById('cityFilterForm').submit()">
                            <option value="All" <c:if test="${selectedCity == 'All' || empty selectedCity}">selected</c:if>>All Cities</option>
                            <c:forEach var="c" items="${allCities}">
                                <option value="${c}" <c:if test="${c == selectedCity}">selected</c:if>>${c}</option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
                <div class="col-md-9">
                    <form action="SearchServlet" method="get" class="d-flex">
                        <input type="text" name="query" class="form-control form-control-lg bg-light border-0 me-2 shadow-sm" placeholder="Search for restaurants or cuisines..." value="${searchQuery}">
                        <button type="submit" class="btn btn-purple btn-lg px-4 fw-bold shadow-sm rounded-pill">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-bold mb-0">Top Restaurants Around You</h4>
        <a href="MoodSuggestServlet" class="btn btn-outline-purple rounded-pill fw-bold px-4">
            <i class="bi bi-stars me-1"></i>Mood Suggest
        </a>
    </div>
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
                            <div class="offer-badge p-2 rounded-3 small fw-bold mt-auto mb-2">
                                <i class="bi bi-tag-fill"></i> ${r.offers}
                            </div>
                        </c:if>
                        <button class="btn btn-outline-purple w-100 fw-bold rounded-pill mt-2">View Menu</button>
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

<!-- City Selection Modal -->
<div class="modal fade" id="cityModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="cityModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 rounded-4 shadow-lg">
      <div class="modal-header border-0 pb-0 justify-content-center mt-3">
        <h4 class="modal-title fw-bold" id="cityModalLabel">Select Your City</h4>
      </div>
      <div class="modal-body text-center p-4">
        <p class="text-muted mb-4">Please select your city to see restaurants near you.</p>
        <div class="d-grid gap-3">
            <a href="HomeServlet?action=setCity&city=Delhi" class="btn btn-outline-purple btn-lg fw-bold rounded-pill">Delhi</a>
            <a href="HomeServlet?action=setCity&city=BENGALORE" class="btn btn-outline-purple btn-lg fw-bold rounded-pill">Bangalore</a>
            <a href="HomeServlet?action=setCity&city=HYDERABAD" class="btn btn-outline-purple btn-lg fw-bold rounded-pill">Hyderabad</a>
        </div>
      </div>
    </div>
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
    document.addEventListener("DOMContentLoaded", function() {
        var showModal = "${showCityModal}" === "true";
        if (showModal) {
            var myModal = new bootstrap.Modal(document.getElementById('cityModal'), { keyboard: false });
            myModal.show();
        }
    });
</script>
</body>
</html>
