<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .payment-container {
            max-width: 550px;
            margin: 3rem auto;
        }

        .payment-card {
            border-radius: 32px;
            border: none;
            background: var(--surface);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }
        body.dark-mode .payment-card {
            background: rgba(30, 41, 59, 0.75);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(139, 92, 246, 0.15);
        }

        .payment-header {
            text-align: center;
            padding: 2.5rem 2rem 1.5rem;
        }

        .wallet-icon-wrap {
            width: 80px; height: 80px;
            border-radius: 28px;
            background: var(--primary-light);
            display: inline-flex;
            align-items: center; justify-content: center;
            margin-bottom: 1.2rem;
        }
        body.dark-mode .wallet-icon-wrap {
            background: rgba(139, 92, 246, 0.15);
        }
        .wallet-icon-wrap i {
            font-size: 2.5rem;
            color: var(--primary);
        }

        .payment-title {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--text-primary);
            letter-spacing: -0.5px;
        }
        body.dark-mode .payment-title { color: #f1f5f9; }

        .payment-amount {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--primary);
        }

        .payment-body {
            padding: 1rem 2rem 2.5rem;
        }

        /* ═══ PAYMENT OPTION HOVER EFFECTS ═══ */
        .payment-option {
            border: 2px solid var(--border-color);
            border-radius: 20px;
            padding: 1.2rem 1.5rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            cursor: pointer;
            transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
            background: var(--surface);
            position: relative;
            overflow: hidden;
        }
        body.dark-mode .payment-option {
            background: rgba(15, 23, 42, 0.4);
            border-color: rgba(139, 92, 246, 0.15);
        }

        .payment-option:hover {
            border-color: var(--primary);
            background: var(--primary-light);
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 8px 30px rgba(139, 92, 246, 0.2);
        }
        body.dark-mode .payment-option:hover {
            background: rgba(139, 92, 246, 0.1);
            border-color: var(--primary);
            box-shadow: 0 8px 30px rgba(139, 92, 246, 0.25);
        }

        /* Selected state with CSS :has() */
        .payment-option:has(input:checked) {
            border-color: var(--primary);
            background: var(--primary-light);
            box-shadow: 0 4px 20px rgba(139, 92, 246, 0.15);
        }
        body.dark-mode .payment-option:has(input:checked) {
            background: rgba(139, 92, 246, 0.12);
            border-color: var(--primary);
        }

        .payment-option .form-check-input {
            width: 22px; height: 22px;
            margin: 0; flex-shrink: 0;
            border: 2px solid var(--border-color);
            cursor: pointer;
        }
        .payment-option .form-check-input:checked {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        .payment-option-icon {
            width: 44px; height: 44px;
            border-radius: 14px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.3rem;
            flex-shrink: 0;
            transition: all 0.3s ease;
        }

        .payment-option:hover .payment-option-icon {
            transform: scale(1.1);
        }

        .payment-option-label {
            font-weight: 700;
            font-size: 1.05rem;
            color: var(--text-primary);
        }
        body.dark-mode .payment-option-label { color: #f1f5f9; }

        /* Card Details Section */
        .card-details {
            display: none;
            background: var(--surface-light);
            border: 2px solid var(--border-color);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            animation: slideDown 0.3s ease;
        }
        body.dark-mode .card-details {
            background: rgba(15, 23, 42, 0.5);
            border-color: rgba(139, 92, 246, 0.2);
        }
        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card-details .form-label {
            font-weight: 700;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
        }

        .card-details .form-control {
            border-radius: 14px;
            border: 2px solid var(--border-color);
            height: 52px;
            font-weight: 600;
            background: var(--surface);
        }
        body.dark-mode .card-details .form-control {
            background: rgba(15, 23, 42, 0.4);
            border-color: rgba(139, 92, 246, 0.2);
            color: #f1f5f9;
        }
        .card-details .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1);
        }

        /* Pay Button */
        .btn-pay {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            border: none;
            font-weight: 800;
            font-size: 1.15rem;
            padding: 16px 28px;
            border-radius: 20px;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(139, 92, 246, 0.35);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .btn-pay:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(139, 92, 246, 0.5);
            color: white;
        }

        .secure-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--text-secondary);
            margin-top: 1.2rem;
        }
        .secure-badge i { color: #16a34a; }
    </style>
</head>
<body class="${sessionScope.theme == 'light' ? 'light-mode' : 'dark-mode'}">

<jsp:include page="header.jsp" />

<div class="container payment-container">
    <div class="card payment-card">
        <div class="payment-header">
            <div class="wallet-icon-wrap">
                <i class="bi bi-wallet2"></i>
            </div>
            <div class="payment-title">Payment Options</div>
            <p class="text-secondary fw-500 mb-0 mt-1">Total Amount: <span class="payment-amount">₹${totalAmount}</span></p>
        </div>

        <div class="payment-body">
            <form action="PaymentServlet" method="post" id="paymentForm">
                <input type="hidden" name="totalAmount" value="${totalAmount}">
                <input type="hidden" name="restaurantId" value="${restaurantId}">

                <label class="payment-option" for="upi">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="upi" value="UPI" checked onclick="toggleCard(false)">
                    <div class="payment-option-icon" style="background: #dbeafe; color: #2563eb;">
                        <i class="bi bi-phone"></i>
                    </div>
                    <span class="payment-option-label">UPI Pay</span>
                </label>

                <label class="payment-option" for="card">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="card" value="CARD" onclick="toggleCard(true)">
                    <div class="payment-option-icon" style="background: #fef3c7; color: #d97706;">
                        <i class="bi bi-credit-card"></i>
                    </div>
                    <span class="payment-option-label">Credit/Debit Card</span>
                </label>

                <!-- Card Details (Hidden by default) -->
                <div id="cardDetails" class="card-details">
                    <div class="mb-3">
                        <label class="form-label">Card Number</label>
                        <input type="text" name="cardNumber" id="cardNumber" class="form-control" placeholder="0000 0000 0000 0000" maxlength="16">
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label class="form-label">Expiry (MM/YY)</label>
                            <input type="text" name="expiry" id="expiry" class="form-control" placeholder="MM/YY" maxlength="5">
                        </div>
                        <div class="col-6 mb-3">
                            <label class="form-label">CVV</label>
                            <input type="password" name="cvv" id="cvv" class="form-control" placeholder="•••" maxlength="3">
                        </div>
                    </div>
                </div>

                <label class="payment-option" for="cod">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="COD" onclick="toggleCard(false)">
                    <div class="payment-option-icon" style="background: #dcfce7; color: #16a34a;">
                        <i class="bi bi-cash-coin"></i>
                    </div>
                    <span class="payment-option-label">Cash on Delivery</span>
                </label>

                <button type="submit" class="btn-pay">
                    <i class="bi bi-shield-lock-fill"></i>
                    Pay ₹${totalAmount} & Place Order
                </button>

                <div class="text-center">
                    <span class="secure-badge">
                        <i class="bi bi-lock-fill"></i> 256-bit SSL Encrypted Payment
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function toggleCard(show) {
        const details = document.getElementById('cardDetails');
        details.style.display = show ? 'block' : 'none';
        document.getElementById('cardNumber').required = show;
        document.getElementById('expiry').required = show;
        document.getElementById('cvv').required = show;
    }

    document.getElementById('paymentForm').addEventListener('submit', function(e) {
        const method = document.querySelector('input[name="paymentMethod"]:checked').value;
        if (method === 'CARD') {
            const card = document.getElementById('cardNumber').value.replace(/\s/g, '');
            const expiry = document.getElementById('expiry').value;
            const cvv = document.getElementById('cvv').value;
            if (card.length !== 16 || isNaN(card)) {
                e.preventDefault(); alert('Please enter a valid 16-digit card number.'); return;
            }
            if (!/^\d{2}\/\d{2}$/.test(expiry)) {
                e.preventDefault(); alert('Please enter expiry in MM/YY format.'); return;
            }
            if (cvv.length !== 3 || isNaN(cvv)) {
                e.preventDefault(); alert('Please enter a valid 3-digit CVV.'); return;
            }
        }
    });

    document.addEventListener('DOMContentLoaded', function() {
        var cardInput = document.getElementById('cardNumber');
        var cvvInput = document.getElementById('cvv');
        var expiryInput = document.getElementById('expiry');
        [cardInput, cvvInput].forEach(function(el) {
            el.addEventListener('keypress', function(e) {
                if (!/[0-9]/.test(e.key) && e.key !== 'Backspace') e.preventDefault();
            });
        });
        expiryInput.addEventListener('keypress', function(e) {
            if (!/[0-9/]/.test(e.key) && e.key !== 'Backspace') e.preventDefault();
        });
        expiryInput.addEventListener('input', function() {
            var val = this.value.replace(/\D/g, '');
            if (val.length > 2) {
                this.value = val.substring(0, 2) + '/' + val.substring(2, 4);
            }
        });
    });
</script>
</body>
</html>
