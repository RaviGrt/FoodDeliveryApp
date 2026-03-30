<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Mood Suggest - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #8b5cf6;
            --primary-dark: #7c3aed;
            --primary-light: #ede9fe;
            --primary-hover: #6d28d9;
        }
        body { font-family: 'Inter', sans-serif; background: #f5f3ff; transition: background 0.3s, color 0.3s; }
        body.dark-mode { background: #1a1625 !important; color: #e9d5ff !important; }
        body.dark-mode .card { background: #2d2048 !important; color: #e9d5ff !important; border: none; }
        body.dark-mode .navbar { background: #13011f !important; }
        body.dark-mode .form-select, body.dark-mode .form-control { background: #3b2d5e !important; color: #e9d5ff !important; border: 1px solid #5b3f8c; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h2, body.dark-mode h4, body.dark-mode h5 { color: #e9d5ff !important; }
        body.dark-mode .form-label { color: #c4b5fd !important; }
        .bg-purple { background: var(--primary) !important; }
        .btn-purple { background: var(--primary); color: white; border: none; }
        .btn-purple:hover { background: var(--primary-hover); color: white; }
        .btn-outline-purple { color: var(--primary); border: 2px solid var(--primary); background: transparent; }
        .btn-outline-purple:hover { background: var(--primary); color: white; }
        .text-purple { color: var(--primary) !important; }
        .mood-card { cursor: pointer; border: 2px solid transparent; transition: all 0.2s; }
        .mood-card:hover { border-color: var(--primary); transform: translateY(-3px); box-shadow: 0 8px 25px rgba(139,92,246,0.2); }
        .mood-card.selected { border-color: var(--primary); background: var(--primary-light); }
        body.dark-mode .mood-card.selected { background: #3b2d5e; }
        .suggestion-card { transition: all 0.2s; }
        .suggestion-card:hover { transform: translateY(-3px); box-shadow: 0 10px 30px rgba(139,92,246,0.15); }
        .navbar-brand span { color: var(--primary); }
        .dark-toggle { background: none; border: none; color: white; font-size: 1.3rem; cursor: pointer; }
        .emoji-bg { font-size: 2.5rem; }
        .hero-section { background: linear-gradient(135deg, #8b5cf6 0%, #a78bfa 100%); border-radius: 24px; }
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
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-purple shadow-sm">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-basket-fill text-warning"></i> Urban Eats</a>
        <div class="ms-auto d-flex align-items-center gap-2">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <!-- Hidden Mood Suggest Icon -->
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle mx-1" id="darkToggle" title="Toggle dark mode"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link logout-box shadow-sm ms-2" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container mt-4 pb-5">
    <!-- Hero -->
    <div class="hero-section text-white text-center p-5 mb-5">
        <div class="emoji-bg mb-3">🎭</div>
        <h2 class="fw-bold mb-2">What's Your Mood Today?</h2>
        <p class="opacity-75 mb-0">Tell us how you feel and what you crave — we'll find the perfect dish for you.</p>
        <c:if test="${not empty city}">
            <span class="badge bg-white text-purple mt-3 px-3 py-2 rounded-pill fw-bold"><i class="bi bi-geo-alt-fill"></i> ${city}</span>
        </c:if>
    </div>

    <!-- Form Card -->
    <div class="card shadow border-0 rounded-4 p-4 mb-5 mx-auto" style="max-width: 780px;">
        <form action="MoodSuggestServlet" method="post">
            <div class="row g-4">
                <div class="col-md-4">
                    <label class="form-label fw-bold text-purple"><i class="bi bi-emoji-smile"></i> Your Mood</label>
                    <select name="mood" class="form-select form-select-lg border-0 bg-light" required id="moodSelect">
                        <option value="" disabled <c:if test="${empty mood}">selected</c:if>>Select a mood...</option>
                        <option value="Happy"       <c:if test="${mood == 'Happy'}">selected</c:if>>Happy</option>
                        <option value="Sad"         <c:if test="${mood == 'Sad'}">selected</c:if>>Sad</option>
                        <option value="Romantic"    <c:if test="${mood == 'Romantic'}">selected</c:if>>Romantic</option>
                        <option value="Adventurous" <c:if test="${mood == 'Adventurous'}">selected</c:if>>Adventurous</option>
                        <option value="Comfort"     <c:if test="${mood == 'Comfort'}">selected</c:if>>Comfort</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold text-purple"><i class="bi bi-geo-alt-fill"></i> City</label>
                    <select name="city" class="form-select form-select-lg border-0 bg-light" required>
                        <option value="" disabled <c:if test="${empty city}">selected</c:if>>Select city...</option>
                        <option value="All" <c:if test="${city == 'All'}">selected</c:if>>All Cities</option>
                        <c:forEach var="c" items="${allCities}">
                            <option value="${c}" <c:if test="${c == city}">selected</c:if>>${c}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold text-purple"><i class="bi bi-bowl-hot"></i> Cuisine Preference</label>
                    <select name="cuisine" class="form-select form-select-lg border-0 bg-light" required id="cuisineSelect">
                        <option value="" disabled <c:if test="${empty cuisine}">selected</c:if>>Select a cuisine...</option>
                        <option value="Indian"       <c:if test="${cuisine == 'Indian'}">selected</c:if>>Indian</option>
                        <option value="Chinese"      <c:if test="${cuisine == 'Chinese'}">selected</c:if>>Chinese</option>
                        <option value="Italian"      <c:if test="${cuisine == 'Italian'}">selected</c:if>>Italian</option>
                        <option value="Fast Food"    <c:if test="${cuisine == 'Fast Food'}">selected</c:if>>Fast Food</option>
                        <option value="South Indian" <c:if test="${cuisine == 'South Indian'}">selected</c:if>>South Indian</option>
                    </select>
                </div>
                <div class="col-12 text-center mt-2">
                    <button type="submit" class="btn btn-purple btn-lg px-5 py-3 fw-bold rounded-pill shadow-sm">
                        <i class="bi bi-stars me-2"></i>Suggest Food For Me!
                    </button>
                </div>
            </div>
        </form>
    </div>

    <!-- Results -->
    <c:if test="${not empty mood}">
        <div class="mb-4">
            <h4 class="fw-bold">
                <i class="bi bi-stars text-purple"></i>
                <c:choose>
                    <c:when test="${not empty suggestions}">Suggestions for "${mood}" mood craving "${cuisine}"</c:when>
                    <c:otherwise>No dishes found for this combo. Try another mood, cuisine or city!</c:otherwise>
                </c:choose>
            </h4>
        </div>
        <div class="row g-4">
            <c:forEach var="s" items="${suggestions}">
                <div class="col-md-4">
                    <div class="card suggestion-card shadow-sm border-0 rounded-4 h-100">
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <h5 class="fw-bold mb-0">
                                    <i class="bi bi-stop-circle${s.isVeg ? '-fill text-success' : ' text-danger'} me-1"></i>
                                    ${s.name}
                                </h5>
                                <span class="badge rounded-pill" style="background:var(--primary-light); color:var(--primary);">₹${s.price}</span>
                            </div>
                            <p class="text-muted small mb-3">${s.description}</p>
                            <p class="small fw-bold mb-3"><i class="bi bi-shop text-purple me-1"></i>${s.restaurantName} <span class="text-muted fw-normal">· ${s.restaurantCity}</span></p>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="itemId" value="${s.itemId}">
                                <input type="hidden" name="restaurantId" value="${s.restaurantId}">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-outline-purple w-100 fw-bold rounded-pill">
                                    <i class="bi bi-cart-plus me-1"></i>Add to Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
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
