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
    <link rel="stylesheet" href="css/style.css">
    <style>
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
        /* ═══ DARK MODE TEXT FIXES ═══ */
        body.dark-mode .text-dark { color: #f1f5f9 !important; }
        body.dark-mode h4.text-dark { color: #f1f5f9 !important; }
        body.dark-mode .small.text-dark { color: #cbd5e1 !important; }

    </style>
</head>
<body class="${sessionScope.theme == 'light' ? 'light-mode' : 'dark-mode'}">

<jsp:include page="header.jsp" />

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
                        <option value="Happy"       <c:if test="${mood == 'Happy'}">selected</c:if>>Happy</option>
                        <option value="Sad"         <c:if test="${mood == 'Sad'}">selected</c:if>>Reflective</option>
                        <option value="Romantic"    <c:if test="${mood == 'Romantic'}">selected</c:if>>Romantic</option>
                        <option value="Adventurous" <c:if test="${mood == 'Adventurous'}">selected</c:if>>Adventurous</option>
                        <option value="Comfort"     <c:if test="${mood == 'Comfort'}">selected</c:if>>Comfort</option>
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
                        <option value="Indian"       <c:if test="${cuisine == 'Indian'}">selected</c:if>>Indian</option>
                        <option value="Chinese"      <c:if test="${cuisine == 'Chinese'}">selected</c:if>>Chinese</option>
                        <option value="Italian"      <c:if test="${cuisine == 'Italian'}">selected</c:if>>Italian</option>
                        <option value="Fast Food"    <c:if test="${cuisine == 'Fast Food'}">selected</c:if>>Fast Food</option>
                        <option value="South Indian" <c:if test="${cuisine == 'South Indian'}">selected</c:if>>South Indian</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <button type="submit" class="btn btn-purple btn-lg w-100 py-3 rounded-pill">
                        Create Suggestion <i class="bi bi-stars ms-2"></i>
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

                            <form action="CartServlet" method="post" class="ajax-add-form">
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

<!-- ═══ RESTAURANT SWITCH CONFIRMATION MODAL ═══ -->
<div class="modal-overlay" id="switchModal" style="position:fixed;inset:0;background:rgba(0,0,0,0.55);backdrop-filter:blur(8px);z-index:9998;display:none;align-items:center;justify-content:center;">
    <div style="background:var(--surface,#fff);border-radius:28px;padding:2.5rem;max-width:440px;width:90%;box-shadow:0 30px 80px rgba(0,0,0,0.25);text-align:center;animation:modalPop 0.35s cubic-bezier(0.175,0.885,0.32,1.275);">
        <div style="width:72px;height:72px;background:linear-gradient(135deg,#fef3c7,#fde68a);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 1.5rem;font-size:2rem;">
            <i class="bi bi-exclamation-triangle-fill text-warning"></i>
        </div>
        <h4 class="fw-800" style="margin-bottom:0.75rem;">Switch Restaurant?</h4>
        <p style="color:var(--text-secondary,#64748b);font-size:0.95rem;line-height:1.6;margin-bottom:1.75rem;">
            Your bag contains items from <strong id="existingResName"></strong>. 
            Adding this item will clear your current bag and start fresh.
        </p>
        <div style="display:flex;gap:12px;justify-content:center;">
            <button id="switchCancel" style="background:var(--surface-light,#f8fafc);border:2px solid var(--border-color,#e2e8f0);color:var(--text-primary,#1e293b);font-weight:700;padding:12px 28px;border-radius:16px;cursor:pointer;transition:all 0.2s ease;font-size:0.95rem;">No, Keep Bag</button>
            <button id="switchConfirm" style="background:linear-gradient(135deg,#ef4444,#dc2626);color:white;border:none;font-weight:800;padding:12px 28px;border-radius:16px;cursor:pointer;transition:all 0.2s ease;box-shadow:0 6px 20px rgba(239,68,68,0.3);font-size:0.95rem;">
                <i class="bi bi-arrow-repeat me-1"></i>Yes, Switch
            </button>
        </div>
    </div>
</div>
<style>
    @keyframes modalPop {
        from { transform: scale(0.85) translateY(30px); opacity: 0; }
        to   { transform: scale(1) translateY(0); opacity: 1; }
    }
    .modal-overlay.show { display: flex !important; }
    .cart-toast {
        position: fixed; top: 20px; right: 20px;
        padding: 16px 28px; border-radius: 16px;
        font-weight: 700; font-size: 0.95rem;
        z-index: 9999;
        box-shadow: 0 12px 35px rgba(0,0,0,0.2);
        display: flex; align-items: center; gap: 10px;
        animation: toastSlideIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        transition: opacity 0.4s ease, transform 0.4s ease;
    }
    .cart-toast.toast-warning { background: linear-gradient(135deg, #f59e0b, #d97706); color: white; }
    @keyframes toastSlideIn {
        from { transform: translateX(120%); opacity: 0; }
        to   { transform: translateX(0); opacity: 1; }
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>

    document.addEventListener("DOMContentLoaded", function() {
        // Toast helper
        function showToast(message, type) {
            document.querySelectorAll('.cart-toast').forEach(t => t.remove());
            const toast = document.createElement('div');
            toast.className = 'cart-toast toast-' + type;
            toast.innerHTML = '<i class="bi bi-arrow-repeat"></i>' + message;
            document.body.appendChild(toast);
            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translateX(120%)';
                setTimeout(() => toast.remove(), 400);
            }, 4000);
        }

        // Modal handling
        const switchModal = document.getElementById('switchModal');
        const switchCancel = document.getElementById('switchCancel');
        const switchConfirm = document.getElementById('switchConfirm');
        const existingResNameEl = document.getElementById('existingResName');
        let pendingFormData = null;
        let pendingBtn = null;

        function openSwitchModal(name) {
            existingResNameEl.textContent = name;
            switchModal.classList.add('show');
        }
        function closeSwitchModal() {
            switchModal.classList.remove('show');
            if (pendingBtn) { pendingBtn.disabled = false; pendingBtn.style.opacity = '1'; }
            pendingFormData = null;
            pendingBtn = null;
        }
        switchCancel.addEventListener('click', closeSwitchModal);
        switchModal.addEventListener('click', function(e) { if (e.target === switchModal) closeSwitchModal(); });

        switchConfirm.addEventListener('click', function() {
            if (!pendingFormData || !pendingBtn) return;
            switchModal.classList.remove('show');
            pendingFormData.append('force', 'true');
            fetch('CartServlet', {
                method: 'POST',
                headers: { 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams(pendingFormData)
            })
            .then(res => res.json())
            .then(data => {
                if (data.status === 'success') {
                    showToast('Cart cleared & item added from new restaurant!', 'warning');
                    const btn = pendingBtn;
                    const oldText = btn.innerText;
                    btn.innerText = '✓ Added';
                    btn.classList.remove('btn-outline-primary');
                    btn.classList.add('btn-success');
                    setTimeout(() => {
                        btn.innerText = oldText;
                        btn.classList.remove('btn-success');
                        btn.classList.add('btn-outline-primary');
                        btn.disabled = false;
                        btn.style.opacity = '1';
                    }, 1200);
                }
                pendingFormData = null;
                pendingBtn = null;
            })
            .catch(() => { closeSwitchModal(); });
        });

        // AJAX add with conflict detection
        document.querySelectorAll('.ajax-add-form').forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                const btn = this.querySelector('button[type="submit"]');
                btn.disabled = true;
                btn.style.opacity = '0.7';
                const formData = new FormData(this);

                fetch('CartServlet', {
                    method: 'POST',
                    headers: { 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: new URLSearchParams(formData)
                })
                .then(res => res.json())
                .then(data => {
                    if (data.status === 'conflict') {
                        pendingFormData = formData;
                        pendingBtn = btn;
                        openSwitchModal(data.existingRestaurantName || 'another restaurant');
                    } else if (data.status === 'success') {
                        const oldText = btn.innerText;
                        btn.innerText = '✓ Added';
                        btn.classList.remove('btn-outline-primary');
                        btn.classList.add('btn-success');
                        setTimeout(() => {
                            btn.innerText = oldText;
                            btn.classList.remove('btn-success');
                            btn.classList.add('btn-outline-primary');
                            btn.disabled = false;
                            btn.style.opacity = '1';
                        }, 1000);
                    }
                })
                .catch(() => { btn.disabled = false; btn.style.opacity = '1'; });
            });
        });
    });
</script>
</body>
</html>
