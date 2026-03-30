<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mood Suggest - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
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
<<<<<<< Updated upstream
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
=======

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
            width: 42px; height: 42px; display: flex; align-items: center; justify-content: center;
            background: rgba(255, 255, 255, 0.15); border-radius: 14px; color: white !important;
            transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            text-decoration: none; border: 1px solid rgba(255, 255, 255, 0.1);
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

        .container { margin-top: 3rem; }

        /* Mood Hero Section */
        .mood-hero {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: 32px;
            padding: 4rem 2rem;
            color: white;
            text-align: center;
            box-shadow: 0 20px 50px rgba(139, 92, 246, 0.2);
            margin-bottom: 4rem;
            position: relative;
            overflow: hidden;
        }
        .mood-hero::before {
            content: "✨"; position: absolute; top: 10%; left: 5%; font-size: 3rem; opacity: 0.2;
        }
        .mood-hero::after {
            content: "🍱"; position: absolute; bottom: 10%; right: 5%; font-size: 3rem; opacity: 0.2;
        }

        /* Selection Card */
        .selection-card {
            background: var(--surface);
            border-radius: 28px;
            border: none;
            padding: 3rem;
            margin-top: -80px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.06);
            position: relative;
            z-index: 10;
        }
        body.dark-mode .selection-card {
            background: rgba(30, 41, 59, 0.8);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .form-select-lg {
            border-radius: 14px;
            border: 2px solid var(--border-color);
            padding: 14px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            background-color: var(--surface-light);
        }
        body.dark-mode .form-select-lg {
            background-color: rgba(15, 23, 42, 0.4);
            border-color: rgba(139, 92, 246, 0.2);
            color: white;
        }
        .form-select-lg:focus { border-color: var(--primary); box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1); }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 800;
            transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            box-shadow: 0 8px 20px rgba(139, 92, 246, 0.3);
        }
        .btn-purple:hover { transform: translateY(-4px); box-shadow: 0 12px 30px rgba(139, 92, 246, 0.4); color: white; }

        /* Dish Cards */
        .dish-card {
            border-radius: 24px;
            border: none;
            background: var(--surface);
            box-shadow: 0 4px 20px rgba(0,0,0,0.04);
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            overflow: hidden;
            height: 100%;
        }
        .dish-card:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(139,92,246,0.15); }
        body.dark-mode .dish-card {
            background: rgba(30, 41, 59, 0.7);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .dish-header {
            height: 100px;
            background: linear-gradient(135deg, var(--primary-light) 0%, #fff 100%);
            position: relative;
        }
        body.dark-mode .dish-header { background: linear-gradient(135deg, rgba(139,92,246,0.2) 0%, rgba(30, 41, 59, 0.7) 100%); }

        .dish-price-tag {
            position: absolute; right: 20px; top: -15px;
            background: var(--primary); color: white;
            padding: 8px 16px; border-radius: 14px;
            font-weight: 800; box-shadow: 0 4px 12px rgba(139, 92, 246, 0.3);
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
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle" id="darkToggle" title="Toggle Theme"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link bg-danger bg-opacity-25 border-danger border-opacity-25" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container pb-5">
    
    <div class="mood-hero">
        <h1 class="fw-800 mb-2" style="font-size: 3.5rem; letter-spacing: -2px;">How's it going, <c:out value="${user.name}"/>?</h1>
        <p class="fs-4 opacity-90 fw-500 mb-0">Select your mood and cravings — let our AI curate the perfect dish.</p>
    </div>

    <div class="selection-card mb-5">
        <form action="MoodSuggestServlet" method="post">
            <div class="row g-4 align-items-end">
                <div class="col-lg-3">
                    <label class="form-label text-muted small fw-800 text-uppercase mb-2">My Current Mood</label>
                    <select name="mood" class="form-select form-select-lg shadow-none" required>
                        <option value="" disabled <c:if test="${empty mood}">selected</c:if>>Select mood...</option>
                        <option value="Happy"       <c:if test="${mood == 'Happy'}">selected</c:if>>Happy ☀️</option>
                        <option value="Sad"         <c:if test="${mood == 'Sad'}">selected</c:if>>Reflective 🌙</option>
                        <option value="Romantic"    <c:if test="${mood == 'Romantic'}">selected</c:if>>Romantic ❤️</option>
                        <option value="Adventurous" <c:if test="${mood == 'Adventurous'}">selected</c:if>>Adventurous 🚀</option>
                        <option value="Comfort"     <c:if test="${mood == 'Comfort'}">selected</c:if>>Comfort 🛋️</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label class="form-label text-muted small fw-800 text-uppercase mb-2">Location</label>
                    <select name="city" class="form-select form-select-lg shadow-none" required>
                        <option value="All" <c:if test="${city == 'All' || empty city}">selected</c:if>>All Cities</option>
                        <c:forEach var="c" items="${allCities}">
                            <option value="${c}" <c:if test="${c == city}">selected</c:if>>${c}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label class="form-label text-muted small fw-800 text-uppercase mb-2">Cuisine Cravings</label>
                    <select name="cuisine" class="form-select form-select-lg shadow-none" required>
                        <option value="" disabled <c:if test="${empty cuisine}">selected</c:if>>Select cuisine...</option>
                        <option value="Indian"       <c:if test="${cuisine == 'Indian'}">selected</c:if>>Indian 🥘</option>
                        <option value="Chinese"      <c:if test="${cuisine == 'Chinese'}">selected</c:if>>Chinese 🍜</option>
                        <option value="Italian"      <c:if test="${cuisine == 'Italian'}">selected</c:if>>Italian 🍕</option>
                        <option value="Fast Food"    <c:if test="${cuisine == 'Fast Food'}">selected</c:if>>Fast Food 🍔</option>
                        <option value="South Indian" <c:if test="${cuisine == 'South Indian'}">selected</c:if>>South Indian ☕</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <button type="submit" class="btn btn-purple btn-lg w-100 py-3 rounded-pill">
                        Curate Suggestions <i class="bi bi-stars ms-2"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>

    <!-- Results Section -->
    <c:if test="${not empty mood}">
        <div class="d-flex align-items-center gap-3 mb-5 px-3">
            <div class="bg-primary bg-opacity-10 p-3 rounded-4">
                <i class="bi bi-stars fs-3 text-primary"></i>
            </div>
            <div>
                <h2 class="fw-800 mb-1">AI Curated Gems</h2>
                <p class="text-secondary fw-600 mb-0">Specially picked for your <span class="text-primary">${mood}</span> mood in <span class="text-primary">${city}</span>.</p>
            </div>
        </div>

        <div class="row g-4">
            <c:forEach var="s" items="${suggestions}">
                <div class="col-md-6 col-lg-4">
                    <div class="dish-card">
                        <div class="dish-header"></div>
                        <div class="card-body p-4 pt-0">
                            <div class="position-relative">
                                <div class="dish-price-tag">₹${s.price}</div>
                            </div>
                            
                            <div class="d-flex align-items-center mb-3 mt-2">
                                <i class="bi bi-circle-fill me-2 ${s.isVeg ? 'text-success' : 'text-danger'}" style="font-size: 0.6rem;"></i>
                                <h4 class="fw-800 mb-0 text-dark">${s.name}</h4>
                            </div>
                            
                            <p class="text-secondary small mb-4 fw-500" style="min-height: 48px;">${s.description}</p>
                            
                            <div class="bg-light p-3 rounded-4 mb-4 d-flex align-items-center gap-3">
                                <i class="bi bi-shop fs-4 text-primary opacity-50"></i>
                                <div>
                                    <div class="fw-800 small text-dark">${s.restaurantName}</div>
                                    <div class="text-secondary extra-small fw-600">${s.restaurantCity}</div>
                                </div>
                            </div>

                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="itemId" value="${s.itemId}">
                                <input type="hidden" name="restaurantId" value="${s.restaurantId}">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-outline-primary w-100 rounded-pill fw-800 py-2 border-2">
                                    Add to Bag
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty suggestions}">
                <div class="col-12 text-center py-5">
                    <i class="bi bi-emoji-neutral fs-1 text-muted opacity-25 mb-3 d-block"></i>
                    <h4 class="fw-800">We couldn't find an exact match</h4>
                    <p class="text-secondary">Try a different vibe or explore your neighborhood favorites.</p>
                    <a href="HomeServlet" class="btn btn-purple rounded-pill px-5 py-3 mt-3">Back to Restaurants</a>
                </div>
            </c:if>
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
