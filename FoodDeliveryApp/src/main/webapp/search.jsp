<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .search-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: 40px;
            padding: 3rem;
            color: white;
            margin-bottom: 3rem;
            box-shadow: 0 20px 50px rgba(139, 92, 246, 0.25);
        }

        .result-card {
            border-radius: 32px;
            border: none;
            background: var(--surface);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.04);
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        body.dark-mode .result-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(139, 92, 246, 0.15);
        }
        .result-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 60px rgba(139, 92, 246, 0.15);
        }

        .item-image-placeholder {
            height: 160px;
            background: linear-gradient(135deg, rgba(139, 92, 246, 0.1) 0%, rgba(139, 92, 246, 0.05) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }
        .item-image-placeholder i { font-size: 3.5rem; opacity: 0.3; color: var(--primary); }

        .category-badge {
            position: absolute; top: 15px; left: 15px;
            background: rgba(255,255,255,0.9);
            color: var(--primary);
            padding: 5px 15px;
            border-radius: 12px;
            font-weight: 800; font-size: 0.75rem;
            text-transform: uppercase; letter-spacing: 1px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        body.dark-mode .category-badge { background: rgba(15, 23, 42, 0.8); color: #c4b5fd; }

        .veg-indicator {
            position: absolute; top: 15px; right: 15px;
            font-size: 1.5rem;
        }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 800;
            padding: 12px 24px; border-radius: 16px;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(139, 92, 246, 0.2);
        }
        .btn-purple:hover { transform: scale(1.02); box-shadow: 0 10px 25px rgba(139, 92, 246, 0.35); color: white; }

        .restaurant-link {
            text-decoration: none;
            color: var(--primary);
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: opacity 0.2s;
        }
        .restaurant-link:hover { opacity: 0.8; }
        body.dark-mode .restaurant-link { color: #c4b5fd; }

        /* Floating Cart Bar (Same as restaurant.jsp) */
        #floatingCartBar {
            position: fixed; bottom: 30px; left: 50%; transform: translateX(-50%);
            width: 90%; max-width: 500px;
            background: rgba(139, 92, 246, 0.9);
            backdrop-filter: blur(15px);
            color: white; border-radius: 24px;
            padding: 12px 24px;
            display: none; align-items: center; justify-content: space-between;
            box-shadow: 0 15px 40px rgba(139, 92, 246, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.2);
            z-index: 1001;
            animation: slideUp 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        @keyframes slideUp { from { transform: translate(-50%, 150%); opacity: 0; } to { transform: translate(-50%, 0); opacity: 1; } }

        .btn-view-cart {
            background: white; color: var(--primary);
            font-weight: 800; padding: 10px 20px; border-radius: 16px;
            text-decoration: none; font-size: 0.9rem;
        }

        /* Toast notifications */
        .cart-toast {
            position: fixed; top: 20px; right: 20px;
            padding: 16px 28px; border-radius: 16px;
            font-weight: 700; font-size: 0.95rem; z-index: 9999;
            box-shadow: 0 12px 35px rgba(0,0,0,0.2);
            display: flex; align-items: center; gap: 10px;
            animation: toastSlideIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        .cart-toast.toast-success { background: #10b981; color: white; }
        .cart-toast.toast-warning { background: #f59e0b; color: white; }
        @keyframes toastSlideIn { from { transform: translateX(120%); opacity: 0; } to { transform: translateX(0); opacity: 1; } }

        /* Conflict Modal */
        .modal-overlay {
            position: fixed; inset: 0; background: rgba(0,0,0,0.6); backdrop-filter: blur(8px);
            z-index: 9998; display: none; align-items: center; justify-content: center;
        }
        .modal-overlay.show { display: flex; }
        .switch-modal {
            background: var(--surface); border-radius: 28px; padding: 2.5rem;
            max-width: 440px; width: 90%; text-align: center;
        }
        body.dark-mode .switch-modal { background: #1e293b; border: 1px solid rgba(139,92,246,0.2); }

        body.dark-mode .text-dark { color: #f1f5f9 !important; }
    </style>
</head>
<body class="${sessionScope.theme == 'light' ? 'light-mode' : 'dark-mode'}">

<jsp:include page="header.jsp" />

<div class="container pb-5">
    
    <!-- Search Header -->
    <div class="search-header mt-4">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h6 class="text-uppercase fw-800 opacity-75 mb-2" style="letter-spacing: 2px;">
                    ${isRecommendation ? 'Trending Now' : 'Search Results'}
                </h6>
                <h1 class="fw-800 mb-0" style="font-size: 2.8rem; letter-spacing: -1.5px;">
                    <c:choose>
                        <c:when test="${isRecommendation}">Featured Flavors ✨</c:when>
                        <c:otherwise>Discovering "<c:out value="${searchQuery}"/>"</c:otherwise>
                    </c:choose>
                </h1>
            </div>
            <div class="col-md-4 text-md-end">
                <span class="badge bg-white text-primary rounded-pill px-4 py-2 fw-800">
                    <c:out value="${resultCount}"/> Options Found
                </span>
            </div>
        </div>
    </div>

    <!-- Results Grid -->
    <div class="row g-4">
        <c:forEach var="item" items="${results}">
            <div class="col-md-6 col-lg-4">
                <div class="result-card">
                    <div class="item-image-placeholder">
                        <c:if test="${not empty item.category}">
                            <span class="category-badge">${item.category}</span>
                        </c:if>
                        <i class="bi bi-record-btn-fill veg-indicator ${item.veg ? 'text-success' : 'text-danger'}"></i>
                        <i class="bi bi-egg-fried"></i>
                    </div>
                    
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-start mb-2">
                            <h5 class="fw-800 text-dark mb-0">${item.name}</h5>
                            <h5 class="fw-800 text-primary mb-0">&#8377;${item.price}</h5>
                        </div>
                        
                        <a href="RestaurantServlet?id=${item.restaurantId}" class="restaurant-link small mb-3">
                            <i class="bi bi-shop"></i> ${item.restaurantName}
                        </a>
                        
                        <p class="text-secondary small mb-4" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                            ${item.description}
                        </p>
                        
                        <form action="CartServlet" method="post" class="ajax-add-form mt-auto">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="${item.itemId}">
                            <input type="hidden" name="restaurantId" value="${item.restaurantId}">
                            <input type="hidden" name="quantity" value="1">
                            
                            <button type="submit" class="btn btn-purple w-100 fw-800">
                                <i class="bi bi-plus-lg me-2"></i>ADD TO BAG
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty results}">
            <div class="col-12 text-center py-5">
                <div class="mb-4">
                    <i class="bi bi-search-heart text-muted opacity-25" style="font-size: 6rem;"></i>
                </div>
                <h3 class="fw-800 text-dark">No food items found</h3>
                <p class="text-secondary mb-5">"Try searching for pizza, biryani, or your favorite restaurant."</p>
                <a href="HomeServlet" class="btn btn-purple px-5 py-3 rounded-pill fw-800">Explore Restaurants</a>
            </div>
        </c:if>
    </div>
</div>

<!-- Floating Cart Bar -->
<div id="floatingCartBar">
    <div class="d-flex align-items-center gap-3">
        <div class="bg-white text-primary p-2 rounded-4"><i class="bi bi-cart-fill fs-4"></i></div>
        <div><span id="cartItemCount" class="fw-800 fs-5 d-block">0</span><span class="small opacity-75 fw-600">items in bag</span></div>
    </div>
    <a href="CartServlet" class="btn-view-cart text-uppercase">View Order <i class="bi bi-chevron-right ms-1"></i></a>
</div>

<!-- Switch Restaurant Modal -->
<div class="modal-overlay" id="switchModal">
    <div class="switch-modal">
        <div class="modal-icon" style="background: #fee2e2;"><i class="bi bi-exclamation-triangle-fill text-danger"></i></div>
        <h4>Switch Restaurant?</h4>
        <p>Adding this item will clear your current bag from <strong id="existingResName"></strong> and start a fresh order.</p>
        <div class="btn-row d-flex gap-2 justify-content-center">
            <button class="btn btn-light px-4 py-2 rounded-3 fw-700" id="switchCancel">Cancel</button>
            <button class="btn btn-danger px-4 py-2 rounded-3 fw-800" id="switchConfirm">Yes, Switch</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const cartBar = document.getElementById('floatingCartBar');
        const countSpan = document.getElementById('cartItemCount');

        function syncCartBar(count) {
            if (count > 0) { countSpan.innerText = count; cartBar.style.display = 'flex'; }
            else { cartBar.style.display = 'none'; }
        }

        function showToast(message, type) {
            const toast = document.createElement('div');
            toast.className = 'cart-toast toast-' + type;
            toast.innerHTML = '<i class="bi bi-check-circle-fill"></i>' + message;
            document.body.appendChild(toast);
            setTimeout(() => { toast.style.opacity = '0'; setTimeout(() => toast.remove(), 500); }, 3000);
        }

        // Cart Conflict Modal Logic
        const switchModal = document.getElementById('switchModal');
        const switchCancel = document.getElementById('switchCancel');
        const switchConfirm = document.getElementById('switchConfirm');
        let pendingForm = null;
        let pendingBtn = null;

        switchCancel.onclick = () => switchModal.classList.remove('show');
        
        switchConfirm.onclick = () => {
            if (!pendingForm) return;
            const data = new URLSearchParams(new FormData(pendingForm));
            data.append('force', 'true');
            
            fetch('CartServlet', { method: 'POST', body: data, headers: { 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded' }})
            .then(res => res.json())
            .then(d => {
                if(d.status === 'success') {
                    syncCartBar(d.cartCount);
                    showToast('Started new order!', 'success');
                    switchModal.classList.remove('show');
                    if(pendingBtn) pendingBtn.innerText = 'ADDED';
                }
            });
        };

        // AJAX Add to Cart
        document.querySelectorAll('.ajax-add-form').forEach(form => {
            form.onsubmit = (e) => {
                e.preventDefault();
                const btn = form.querySelector('button');
                const data = new URLSearchParams(new FormData(form));

                fetch('CartServlet', { method: 'POST', body: data, headers: { 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded' }})
                .then(res => res.json())
                .then(d => {
                    if (d.status === 'conflict') {
                        pendingForm = form; pendingBtn = btn;
                        document.getElementById('existingResName').innerText = d.existingRestaurantName;
                        switchModal.classList.add('show');
                    } else if (d.status === 'success') {
                        syncCartBar(d.cartCount);
                        const old = btn.innerHTML;
                        btn.innerHTML = '<i class="bi bi-check-lg me-2"></i>ADDED';
                        btn.classList.add('btn-success');
                        setTimeout(() => { btn.innerHTML = old; btn.classList.remove('btn-success'); }, 1500);
                        showToast('Item added to bag!', 'success');
                    }
                });
            };
        });

        // Initial Cart Sync
        fetch('CartServlet?action=count', { headers: { 'X-Requested-With': 'XMLHttpRequest' }})
        .then(res => res.json())
        .then(d => { if(d.status === 'success') syncCartBar(d.cartCount); });
    });
</script>
</body>
</html>
