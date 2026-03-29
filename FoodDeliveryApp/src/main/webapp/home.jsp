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
        .city-group-title { margin-top: 2rem; margin-bottom: 1.5rem; position: relative; padding-bottom: 0.5rem; border-bottom: 2px solid var(--primary-light); }
        .city-group-title::after { content: ""; position: absolute; bottom: -2px; left: 0; width: 60px; height: 2px; background: var(--primary); }
        
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
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="ms-auto d-flex align-items-center gap-2">
            <!-- Hidden Home Icon as we are on Home page -->
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
    <c:if test="${not empty aiSuggestion}">
        <div class="alert border-0 shadow-sm rounded-3 d-flex align-items-center mb-4" style="background:var(--primary-light); color:var(--primary);">
            <i class="bi bi-stars fs-4 me-3"></i>
            <div><strong>AI Suggestion:</strong> <c:out value="${aiSuggestion}"/></div>
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
                <div class="col-md-9 d-flex gap-3 align-items-center">
                    <form action="SearchServlet" method="get" class="d-flex flex-grow-1">
                        <input type="text" name="query" class="form-control form-control-lg bg-light border-0 me-2 shadow-sm" placeholder="Search for restaurants or cuisines..." value="<c:out value='${searchQuery}'/>">
                        <button type="submit" class="btn btn-purple btn-lg px-4 fw-bold shadow-sm rounded-pill">Search</button>
                    </form>
                    
                    <!-- Veg Only Switch -->
                    <div class="ms-md-4 ps-md-4 border-start d-none d-md-block">
                        <label class="veg-switch">
                            <input type="checkbox" id="vegToggle">
                            <span class="veg-slider"></span>
                            <span class="veg-label">Veg Only</span>
                        </label>
                    </div>
                </div>
                <!-- Mobile Veg Toggle -->
                <div class="col-12 d-md-none mt-2 px-2">
                    <label class="veg-switch">
                        <input type="checkbox" id="vegToggleMobile" onchange="document.getElementById('vegToggle').click()">
                        <span class="veg-slider"></span>
                        <span class="veg-label">Veg Only</span>
                    </label>
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
        <c:set var="lastCity" value="" />
        <c:forEach var="r" items="${restaurants}">
            <c:if test="${r.city != lastCity}">
                <div class="col-12 city-group-title mb-4 restaurant-card-group-header" data-city="${r.city}">
                    <h3 class="fw-extrabold mb-0 text-dark">
                        <i class="bi bi-geo-alt-fill text-purple me-2"></i>Restaurants in <c:out value="${r.city}"/>
                    </h3>
                </div>
                <c:set var="lastCity" value="${r.city}" />
            </c:if>
            <div class="col-md-4 mb-4 restaurant-card" data-veg-only="${r.isVegOnly()}" data-city="${r.city}">
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

        // Veg Filtering Logic
        const vegToggle = document.getElementById('vegToggle');
        const restaurantCards = document.querySelectorAll('.restaurant-card');
        const noResultsMsg = document.getElementById('noVegMsg');

        function filterVeg() {
            const isVegOnly = vegToggle.checked;
            let visibleCount = 0;
            const citiesWithVisibleRestaurants = new Set();

            restaurantCards.forEach(card => {
                const isCardVeg = card.getAttribute('data-veg-only') === 'true';
                const city = card.getAttribute('data-city');
                
                if (isVegOnly && !isCardVeg) {
                    card.style.display = 'none';
                } else {
                    card.style.display = 'block';
                    visibleCount++;
                    citiesWithVisibleRestaurants.add(city);
                }
            });

            // Handle Header Visibility
            document.querySelectorAll('.restaurant-card-group-header').forEach(header => {
                const headerCity = header.getAttribute('data-city');
                header.style.display = citiesWithVisibleRestaurants.has(headerCity) ? 'block' : 'none';
            });

            if (visibleCount === 0 && restaurantCards.length > 0) {
                if (!noResultsMsg) {
                    const msg = document.createElement('div');
                    msg.id = 'noVegMsg';
                    msg.className = 'col-12 text-center text-muted my-5 py-5';
                    msg.innerHTML = '<i class="bi bi-patch-exclamation fs-1 mb-3 d-block"></i><h5>No pure veg restaurants found in this view!</h5>';
                    document.querySelector('.row').appendChild(msg);
                }
            } else if (noResultsMsg) {
                noResultsMsg.remove();
            }
        }

        vegToggle.addEventListener('change', filterVeg);
    });
</script>
</body>
</html>
