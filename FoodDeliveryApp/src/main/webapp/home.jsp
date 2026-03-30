<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
<<<<<<< Updated upstream
        :root { --primary: #8b5cf6; --primary-dark: #7c3aed; --primary-light: #ede9fe; --primary-hover: #6d28d9; }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; transition: background 0.3s, color 0.3s; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card { background: #2d2048 !important; color: #e9d5ff !important; border: none; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .modal-content { background: #2d2048; color: #e9d5ff; }
        body.dark-mode .form-select, body.dark-mode .form-control { background: #3b2d5e !important; color: #e9d5ff !important; border: 1px solid #5b3f8c; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode .bg-light { background: #2d2048 !important; }
        body.dark-mode h3, body.dark-mode h4, body.dark-mode h5 { color: #e9d5ff !important; }
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
        .city-group-title { margin-top: 2rem; margin-bottom: 1.5rem; position: relative; padding-bottom: 0.5rem; border-bottom: 2px solid var(--primary-light); color: #1e293b; }
        .city-group-title::after { content: ""; position: absolute; bottom: -2px; left: 0; width: 60px; height: 2px; background: var(--primary); }
        body.dark-mode .city-group-title { color: #e9d5ff !important; border-bottom-color: #5b3f8c; }
        
        /* Navbar Icon Box Style */
=======
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
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #ede9fe 100%);
            min-height: 100vh;
            color: var(--text-primary);
            transition: all 0.3s ease;
        }

        body.dark-mode {
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%);
            color: #e2e8f0;
        }

        /* Premium Navbar */
        .navbar {
            background: rgba(139, 92, 246, 0.95);
            backdrop-filter: blur(10px);
            padding: 0.75rem 0;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.05);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            z-index: 1000;
        }
        body.dark-mode .navbar {
            background: rgba(15, 23, 42, 0.9);
            border-bottom: 1px solid rgba(139, 92, 246, 0.2);
        }

>>>>>>> Stashed changes
        .nav-icon-link {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 14px;
            color: white !important;
            transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            text-decoration: none;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .nav-icon-link:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .dark-toggle {
            width: 42px; height: 42px; display: flex; align-items: center; justify-content: center;
            background: rgba(255, 255, 255, 0.15); border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px; color: white; cursor: pointer; transition: all 0.3s ease;
        }

        .dark-toggle:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
        }

        .container { margin-top: 2rem; }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 700;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(139, 92, 246, 0.3);
        }

        .btn-purple:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(139, 92, 246, 0.4);
            color: white;
        }

        /* Filter Section */
        .filter-card {
            border-radius: 24px;
            border: none;
            background: var(--surface);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
        }
        body.dark-mode .filter-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .form-select-lg, .form-control-lg {
            border-radius: 14px;
            font-size: 1rem;
            font-weight: 600;
            border: 2px solid var(--border-color);
            transition: all 0.3s ease;
        }

        .form-select-lg:focus, .form-control-lg:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1);
        }

        /* Restaurant Cards */
        .restaurant-card {
            transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .card {
            border-radius: 24px;
            border: none;
            background: var(--surface);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .restaurant-card:hover {
            transform: translateY(-8px);
        }
        .restaurant-card:hover .card {
            box-shadow: 0 20px 40px rgba(139, 92, 246, 0.15);
        }

        body.dark-mode .card {
            background: rgba(30, 41, 59, 0.7);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .rating-badge {
            background: #10b981;
            color: white;
            padding: 4px 10px;
            border-radius: 10px;
            font-weight: 800;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .offer-banner {
            background: var(--primary-light);
            color: var(--primary);
            padding: 8px 12px;
            border-radius: 12px;
            font-weight: 700;
            font-size: 0.85rem;
        }
        body.dark-mode .offer-banner {
            background: rgba(139, 92, 246, 0.2);
        }

        /* Veg Switch */
        .veg-switch { display: flex; align-items: center; cursor: pointer; user-select: none; }
        .veg-switch input { display: none; }
        .veg-slider { width: 48px; height: 24px; background: #cbd5e1; border-radius: 100px; position: relative; transition: 0.3s; margin-right: 12px; }
        .veg-slider::before { content: ""; position: absolute; width: 18px; height: 18px; background: white; border-radius: 50%; top: 3px; left: 3px; transition: 0.3s; }
        .veg-switch input:checked + .veg-slider { background: #10b981; }
        .veg-switch input:checked + .veg-slider::before { transform: translateX(24px); }
        .veg-label { font-weight: 700; font-size: 0.95rem; color: var(--text-secondary); }
        .veg-switch input:checked ~ .veg-label { color: #10b981; }

        .city-title {
            margin: 3rem 0 2rem;
            font-weight: 800;
            font-size: 1.75rem;
            display: flex;
            align-items: center;
            gap: 12px;
            color: var(--text-primary);
        }
        body.dark-mode .city-title { color: #f8fafc; }
        .city-title::after {
            content: ""; flex: 1; height: 2px;
            background: var(--border-color);
            opacity: 0.5;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-800 fs-3" href="HomeServlet">
            <i class="bi bi-basket-fill text-warning me-2"></i>Urban Eats
        </a>
        <div class="ms-auto d-flex align-items-center gap-3">
            <a href="MoodSuggestServlet" class="nav-icon-link" title="AI Suggest"><i class="bi bi-stars"></i></a>
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle" id="darkToggle" title="Toggle Theme"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link bg-danger bg-opacity-25 border-danger border-opacity-25" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container pb-5">
    <!-- AI Suggestion Alert -->
    <c:if test="${not empty aiSuggestion}">
        <div class="alert border-0 shadow-sm rounded-4 d-flex align-items-center mb-5 p-4" style="background: rgba(139, 92, 246, 0.1); color: var(--primary);">
            <div class="me-4 fs-1 text-primary animate-pulse"><i class="bi bi-stars"></i></div>
            <div>
                <h6 class="fw-800 mb-1">Tailored for your taste</h6>
                <p class="mb-0 fw-500 opacity-90"><c:out value="${aiSuggestion}"/></p>
            </div>
        </div>
    </c:if>

    <!-- Global Filter Card -->
    <div class="card filter-card p-4 mb-5">
        <div class="row align-items-center g-4">
            <div class="col-lg-3">
                <form action="HomeServlet" method="get" id="cityFilterForm">
                    <label class="form-label text-muted small fw-800 text-uppercase mb-2">Location</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0 border-2 rounded-start-3"><i class="bi bi-geo-alt-fill text-primary"></i></span>
                        <select name="city" class="form-select form-select-lg bg-light border-start-0 border-2 shadow-none rounded-end-3" onchange="document.getElementById('cityFilterForm').submit()">
                            <option value="All" <c:if test="${selectedCity == 'All' || empty selectedCity}">selected</c:if>>All Cities</option>
                            <c:forEach var="c" items="${allCities}">
                                <option value="${c}" <c:if test="${c == selectedCity}">selected</c:if>>${c}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>
            <div class="col-lg-6">
                <form action="SearchServlet" method="get">
                    <label class="form-label text-muted small fw-800 text-uppercase mb-2">Search</label>
                    <div class="input-group">
                        <input type="text" name="query" class="form-control form-control-lg bg-light border-2 shadow-none" placeholder="Search for sushi, burgers, or pizza..." value="<c:out value='${searchQuery}'/>" style="border-radius: 14px 0 0 14px;">
                        <button type="submit" class="btn btn-purple btn-lg px-4" style="border-radius: 0 14px 14px 0;">Find Food</button>
                    </div>
                </form>
            </div>
            <div class="col-lg-3">
                <div class="d-flex justify-content-lg-end">
                    <label class="veg-switch">
                        <input type="checkbox" id="vegToggle">
                        <span class="veg-slider"></span>
                        <span class="veg-label">Vegetarian Only</span>
                    </label>
                </div>
            </div>
        </div>
    </div>

    <!-- Restaurant Listings -->
    <div class="row g-4">
        <c:set var="lastCity" value="" />
        <c:forEach var="r" items="${restaurants}">
            <c:if test="${r.city != lastCity}">
                <div class="col-12 city-title restaurant-card-group-header" data-city="${r.city}">
                    <i class="bi bi-pin-map text-primary"></i> <c:out value="${r.city}"/>
                </div>
                <c:set var="lastCity" value="${r.city}" />
            </c:if>
            
            <div class="col-md-6 col-lg-4 restaurant-card" data-veg-only="${r.isVegOnly()}" data-city="${r.city}">
                <a href="RestaurantServlet?id=${r.restaurantId}" class="text-decoration-none">
                    <div class="card h-100 p-0">
                        <!-- Card Image / Header placeholder for premium feel -->
                        <div style="height: 120px; background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%); opacity: 0.05;"></div>
                        
                        <div class="card-body p-4" style="margin-top: -60px;">
                            <div class="d-flex justify-content-between align-items-end mb-3">
                                <div class="bg-white p-2 rounded-4 shadow-sm border" style="width: 80px; height: 80px; display: flex; align-items: center; justify-content: center;">
                                    <i class="bi bi-shop fs-1 text-primary opacity-50"></i>
                                </div>
                                <div class="rating-badge">
                                    <i class="bi bi-star-fill"></i> ${r.rating}
                                </div>
                            </div>

                            <h5 class="fw-800 text-dark mb-1">${r.name}</h5>
                            <p class="text-secondary small mb-3"><i class="bi bi-geo-alt me-1"></i>${r.city}</p>
                            
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <span class="badge bg-light text-secondary rounded-pill px-3 py-2 fw-700">
                                    <i class="bi bi-clock me-1 text-primary"></i> ${r.deliveryTime}m
                                </span>
                                <c:if test="${r.vegOnly}">
                                    <span class="badge bg-success bg-opacity-10 text-success rounded-pill px-3 py-2 fw-700">
                                        <i class="bi bi-leaf me-1"></i> Pure Veg
                                    </span>
                                </c:if>
                            </div>

                            <c:if test="${not empty r.offers}">
                                <div class="offer-banner mb-4">
                                    <i class="bi bi-gift-fill me-2"></i> ${r.offers}
                                </div>
                            </c:if>
                            
                            <button class="btn btn-outline-primary w-100 rounded-pill fw-700 py-2 border-2">
                                View Menu
                            </button>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
        
        <c:if test="${empty restaurants}">
            <div class="col-12 text-center py-5">
                <i class="bi bi-search fs-1 text-muted opacity-25 mb-3 d-block"></i>
                <h4 class="fw-800">No restaurants found</h4>
                <p class="text-secondary">Try adjusting your filters or location</p>
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

    document.addEventListener("DOMContentLoaded", function() {
        // Veg Filtering Logic
        const vegToggle = document.getElementById('vegToggle');
        const restaurantCards = document.querySelectorAll('.restaurant-card');

        function filterVeg() {
            const isVegOnly = vegToggle.checked;
            const citiesWithVisibleRestaurants = new Set();

            restaurantCards.forEach(card => {
                const isCardVeg = card.getAttribute('data-veg-only') === 'true';
                const city = card.getAttribute('data-city');
                
                if (isVegOnly && !isCardVeg) {
                    card.style.display = 'none';
                } else {
                    card.style.display = 'block';
                    citiesWithVisibleRestaurants.add(city);
                }
            });

            document.querySelectorAll('.restaurant-card-group-header').forEach(header => {
                const headerCity = header.getAttribute('data-city');
                header.style.display = citiesWithVisibleRestaurants.has(headerCity) ? 'flex' : 'none';
            });
        }

        vegToggle.addEventListener('change', filterVeg);
    });
</script>
</body>
</html>
