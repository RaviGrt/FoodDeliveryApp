<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment - Taaza Food</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .form-check-input:checked + .form-check-label { color: #dc3545; }
        .payment-option:hover { background-color: #f8f9fa; cursor: pointer; }
    </style>
</head>
<body class="bg-light pb-5">
<nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="HomeServlet"><i class="bi bi-shop"></i> Taaza</a>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-5">
            <div class="card border-0 shadow-sm rounded-4 mt-3">
                <div class="card-body p-4 p-md-5">
                    <div class="text-center mb-5">
                        <div class="bg-danger bg-opacity-10 rounded-circle d-inline-block p-4 mb-3">
                            <i class="bi bi-wallet2 text-danger" style="font-size: 3rem;"></i>
                        </div>
                        <h4 class="fw-bold mt-2">Payment Options</h4>
                        <p class="text-muted mb-0">Total Amount: <strong class="text-dark fs-4">₹${totalAmount}</strong></p>
                    </div>
                    
                    <form action="PaymentServlet" method="post">
                        <input type="hidden" name="totalAmount" value="${totalAmount}">
                        <input type="hidden" name="restaurantId" value="${restaurantId}">
                        
                        <div class="form-check border rounded-4 p-3 mb-3 d-flex align-items-center payment-option transition">
                            <input class="form-check-input ms-2 me-3 fs-5" type="radio" name="paymentMethod" id="upi" value="UPI" checked>
                            <label class="form-check-label flex-grow-1 fw-bold fs-5 cursor-pointer" for="upi">
                                <i class="bi bi-phone me-2 text-primary fs-4"></i> UPI Pay
                            </label>
                        </div>
                        
                        <div class="form-check border rounded-4 p-3 mb-5 d-flex align-items-center payment-option transition">
                            <input class="form-check-input ms-2 me-3 fs-5" type="radio" name="paymentMethod" id="cod" value="COD">
                            <label class="form-check-label flex-grow-1 fw-bold fs-5 cursor-pointer" for="cod">
                                <i class="bi bi-cash-coin me-2 text-success fs-4"></i> Cash on Delivery
                            </label>
                        </div>
                        
                        <button type="submit" class="btn btn-danger btn-lg w-100 fw-bold rounded-pill shadow-sm py-3">Pay ₹${totalAmount} & Place Order</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
