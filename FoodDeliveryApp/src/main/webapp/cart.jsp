<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - Urban Eats</title>
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

<<<<<<< Updated upstream
        body.dark-mode .navbar { background: linear-gradient(135deg, #13011f 0%, #1f0f35 100%) !important; }
        body.dark-mode .card { background: rgba(45, 32, 72, 0.7); border: 1px solid rgba(139, 92, 246, 0.2); }
        body.dark-mode .list-group-item { background: rgba(45, 32, 72, 0.5); border-color: rgba(139, 92, 246, 0.2); color: #e9d5ff; }
        body.dark-mode .text-muted { color: #c4b5fd !important; }
        body.dark-mode .text-dark { color: #e9d5ff !important; }
        body.dark-mode .text-purple { color: #c4b5fd !important; }
        body.dark-mode h3, body.dark-mode h5 { color: #e9d5ff !important; }
        body.dark-mode .bill-row { color: #e9d5ff !important; }
        body.dark-mode .quantity-controls { background: rgba(59, 45, 94, 0.5) !important; border-color: rgba(139, 92, 246, 0.3) !important; }
        body.dark-mode .quantity-controls span { color: #e9d5ff !important; }

=======
        /* Premium Navbar */
>>>>>>> Stashed changes
        .navbar {
            background: rgba(139, 92, 246, 0.95);
            backdrop-filter: blur(10px);
            padding: 0.75rem 0;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.05);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        body.dark-mode .navbar {
            background: rgba(15, 23, 42, 0.9);
            border-bottom: 1px solid rgba(139, 92, 246, 0.2);
        }

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

        .container { margin-top: 3rem; }

        h3 {
            font-size: 2.2rem;
            font-weight: 800;
            letter-spacing: -1px;
            margin-bottom: 2rem;
            color: var(--text-primary);
        }
        body.dark-mode h3 { color: #f8fafc; }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 700;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(139, 92, 246, 0.3);
        }

        .btn-purple:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(139, 92, 246, 0.4);
            color: white;
        }

        /* Cart Cards */
        .card {
            border-radius: 24px;
            border: 1px solid var(--border-color);
            background: var(--surface);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            transition: all 0.3s ease;
            overflow: hidden;
        }
        body.dark-mode .card {
            background: rgba(30, 41, 59, 0.7);
            border: 1px solid rgba(139, 92, 246, 0.2);
            backdrop-filter: blur(10px);
        }

        .list-group-item {
            padding: 2rem;
            border: none;
            border-bottom: 1px solid var(--border-color);
            background: transparent;
            transition: background 0.3s ease;
        }
        body.dark-mode .list-group-item {
            border-bottom: 1px solid rgba(139, 92, 246, 0.1);
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 1rem;
            background: var(--surface-light);
            border-radius: 16px;
            padding: 0.6rem 1rem;
            border: 1px solid var(--border-color);
        }
        body.dark-mode .quantity-controls {
            background: rgba(15, 23, 42, 0.4);
            border-color: rgba(139, 92, 246, 0.2);
        }

        .quantity-controls button {
            background: none; border: none; color: var(--primary);
            font-size: 1.25rem; font-weight: 800; cursor: pointer;
            transition: all 0.2s ease;
        }

        .quantity-controls button:hover { transform: scale(1.3); }

        /* Bill Summary Glassmorphism */
        .bill-summary-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }
        body.dark-mode .bill-summary-card {
            background: rgba(30, 41, 59, 0.8);
            border: 1px solid rgba(139, 92, 246, 0.2);
        }

        .bill-row {
            display: flex; justify-content: space-between;
            margin-bottom: 1rem; font-weight: 500; color: var(--text-secondary);
        }
        body.dark-mode .bill-row { color: #94a3b8; }

        .bill-row strong, .bill-row span.final-total {
            color: var(--text-primary);
            font-weight: 700;
        }
        body.dark-mode .bill-row strong, body.dark-mode .final-total { color: #f8fafc; }

        .total-row {
            border-top: 2px dashed var(--border-color);
            padding-top: 1.5rem;
            margin-top: 1.5rem;
        }

        .final-total {
            font-size: 1.5rem;
            color: var(--primary) !important;
            font-weight: 800;
        }

        .empty-cart-icon {
            font-size: 5rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 2rem;
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
            <a href="MoodSuggestServlet" class="nav-icon-link" title="AI Suggest"><i class="bi bi-stars"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            <a href="ProfileServlet" class="nav-icon-link" title="My Profile"><i class="bi bi-person-circle"></i></a>
            <button class="dark-toggle" id="darkToggle" title="Toggle Theme"><i class="bi bi-moon-stars-fill"></i></button>
            <a href="login.jsp" class="nav-icon-link bg-danger bg-opacity-25 border-danger border-opacity-25" title="Logout"><i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
</nav>

<div class="container pb-5">
    <h3><i class="bi bi-cart-check-fill text-primary me-3"></i>Review Your Order</h3>
    
    <c:if test="${not empty cartItems}">
        <div class="row g-5">
            <!-- Items Column -->
            <div class="col-lg-8">
                <div class="card">
                    <div class="list-group list-group-flush">
                        <c:forEach var="item" items="${cartItems}">
                            <c:set var="mItem" value="${menuMap[item.itemId]}" />
                            <div class="list-group-item p-4 border-bottom">
                                <div class="row align-items-center">
                                    <div class="col-md-7">
                                        <div class="d-flex align-items-center mb-2">
                                            <i class="bi bi-circle-fill me-2 ${mItem.isVeg ? 'text-success' : 'text-danger'}" style="font-size: 0.6rem;"></i>
                                            <h5 class="mb-0 fw-700">${mItem.name}</h5>
                                        </div>
                                        <p class="text-secondary small mb-3">₹${mItem.price} / unit</p>
                                        
                                        <div class="quantity-controls" style="width: fit-content;">
                                            <button onclick="updateQty(${item.cartId}, ${item.quantity - 1}, this)">−</button>
                                            <span class="fw-800 fs-5" id="qty-${item.cartId}" style="min-width: 30px; text-align: center;">${item.quantity}</span>
                                            <button onclick="updateQty(${item.cartId}, ${item.quantity + 1}, this)">+</button>
                                        </div>
                                    </div>
                                    <div class="col-md-5 text-md-end mt-3 mt-md-0">
                                        <h4 class="fw-800 text-primary mb-3" id="item-total-${item.cartId}">₹${mItem.price * item.quantity}</h4>
                                        <button onclick="updateQty(${item.cartId}, 0, this)" class="btn btn-sm btn-outline-danger px-3 rounded-pill">
                                            <i class="bi bi-trash3 me-2"></i>Remove
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Bill Column -->
            <div class="col-lg-4">
                <div class="card bill-summary-card p-4 sticky-top" style="top: 100px;">
                    <h4 class="fw-800 mb-4 text-primary"><i class="bi bi-receipt-cutoff me-2"></i>Bill Summary</h4>
                    
                    <div class="bill-row">
                        <span>Items Total</span>
                        <strong id="bill-subtotal">₹${subtotal}</strong>
                    </div>
                    
                    <c:if test="${discountAmount > 0}">
                        <div class="bill-row text-success">
                            <span>Discount (${offerText})</span>
                            <strong id="bill-discount">- ₹${discountAmount}</strong>
                        </div>
                    </c:if>

                    <div class="bill-row">
                        <span>Delivery Fee</span>
                        <span class="text-success fw-700">FREE</span>
                    </div>

                    <div class="total-row">
                        <div class="bill-row">
                            <span class="text-primary fw-800 fs-5">To Pay</span>
                            <span class="final-total" id="bill-total">₹${totalAmount}</span>
                        </div>
                    </div>

                    <form action="CheckoutServlet" method="post" class="mt-4">
                        <input type="hidden" name="totalAmount" value="${totalAmount}">
                        <input type="hidden" name="restaurantId" value="${restaurantId}">
                        <button type="submit" class="btn btn-purple btn-lg w-100 py-3 rounded-pill shadow">
                            Checkout & Place Order <i class="bi bi-arrow-right-circle ms-2"></i>
                        </button>
                    </form>
                    
                    <div class="text-center mt-4">
                        <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2 rounded-pill small">
                            <i class="bi bi-shield-check me-1"></i> SSL Secure Transaction
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${empty cartItems}">
        <div class="card text-center p-5 border-0 shadow-sm mt-5">
            <div class="empty-cart-icon"><i class="bi bi-bag-x-fill"></i></div>
            <h2 class="fw-800 mb-3">Your cart is feeling light</h2>
            <p class="text-secondary mb-4 mx-auto" style="max-width: 400px;">Looks like you haven't added anything yet. Discover the best food from top-rated restaurants near you.</p>
            <a href="HomeServlet" class="btn btn-purple btn-lg px-5 rounded-pill shadow">
                Explore Restaurants
            </a>
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

    function updateQty(cartId, newQty, btn) {
        if (newQty < 0) return;
        
        const controls = btn.closest('.quantity-controls') || btn;
        controls.style.opacity = '0.4';
        controls.style.pointerEvents = 'none';

        fetch('${pageContext.request.contextPath}/CartServlet', {
            method: 'POST',
            headers: { 
                'Content-Type': 'application/x-www-form-urlencoded',
                'X-Requested-With': 'XMLHttpRequest'
            },
            body: 'action=update&cartId=' + cartId + '&newQuantity=' + newQty
        })
        .then(res => res.json())
        .then(data => {
            if (data.status === 'success') {
                if (newQty === 0) {
                    location.reload(); // Refresh to update list and totals simply
                } else {
                    // Update Item Level
                    document.getElementById('qty-' + cartId).innerText = newQty;
                    // Note: We'd need the unit price to perfectly update item total without a reload, 
                    // but the reload handles it effectively if we want total sync. 
                    // Let's reload to ensure all backend discounts stay in sync perfectly.
                    location.reload();
                }
            }
        })
        .catch(err => {
            console.error('Cart error:', err);
            location.reload(); // Fallback to safe state
        });
    }
</script>
</body>
</html>
