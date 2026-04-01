<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Profile Header */
        .profile-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            height: 160px;
            border-radius: 28px 28px 0 0;
            position: relative;
            overflow: hidden;
        }
        .profile-header::after {
            content: ""; position: absolute; top: -50%; right: -15%;
            width: 350px; height: 350px;
            background: rgba(255,255,255,0.06); border-radius: 50%;
        }

        .profile-card {
            border-radius: 28px; border: none;
            background: var(--surface);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.05);
            margin-top: -60px; overflow: visible;
        }
        body.dark-mode .profile-card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        /* Avatar with Upload */
        .avatar-container {
            position: relative; display: inline-block;
            margin-top: -60px; margin-bottom: 20px;
        }
        .avatar-box {
            width: 120px; height: 120px;
            background: white; border-radius: 32px;
            display: flex; align-items: center; justify-content: center;
            font-size: 3.5rem; color: var(--primary);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border: 4px solid var(--surface);
            overflow: hidden;
        }
        .avatar-box img {
            width: 100%; height: 100%; object-fit: cover;
        }
        body.dark-mode .avatar-box { background: #1e293b; border-color: #334155; }

        .avatar-upload-btn {
            position: absolute; bottom: -4px; right: -4px;
            width: 38px; height: 38px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border: 3px solid white; border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            color: white; cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(139,92,246,0.3);
        }
        .avatar-upload-btn:hover { transform: scale(1.15); }
        .avatar-upload-btn input { display: none; }

        .stat-card {
            background: var(--surface-light); padding: 1.5rem;
            border-radius: 20px; text-align: center;
            border: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }
        body.dark-mode .stat-card {
            background: rgba(15, 23, 42, 0.3);
            border-color: rgba(139, 92, 246, 0.1);
        }
        .stat-card:hover { transform: translateY(-5px); border-color: var(--primary); }

        .order-card {
            background: var(--surface); border-radius: 20px;
            padding: 1.5rem; border-left: 6px solid var(--primary);
            margin-bottom: 1rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.02);
            transition: all 0.3s ease;
        }
        body.dark-mode .order-card {
            background: rgba(30, 41, 59, 0.5); border-color: var(--primary);
        }
        .order-card:hover { transform: scale(1.01); box-shadow: 0 10px 25px rgba(139,92,246,0.1); }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 700;
            transition: all 0.3s ease;
        }
        .btn-purple:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(139, 92, 246, 0.3); color: white; }

        .form-control-lg {
            border-radius: 14px;
            background: var(--surface-light); border: 2px solid var(--border-color);
            font-weight: 600;
        }
        body.dark-mode .form-control-lg {
            background: rgba(15, 23, 42, 0.4); border-color: rgba(139, 92, 246, 0.2); color: white;
        }
        .form-control-lg:focus { border-color: var(--primary); box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1); }

        /* Info Rows */
        .info-row {
            padding: 1.2rem 0;
            border-bottom: 1px solid var(--border-color);
        }
        .info-row:last-child { border-bottom: none; }
        body.dark-mode .info-row { border-bottom-color: rgba(139,92,246,0.1); }

        /* Image Upload Progress */
        .upload-overlay {
            position: absolute; inset: 0;
            background: rgba(139,92,246,0.85);
            border-radius: 32px;
            display: none; align-items: center; justify-content: center;
            color: white; font-weight: 700;
        }
        .upload-overlay.active { display: flex; }

        /* Dark mode text */
        body.dark-mode .text-dark { color: #f1f5f9 !important; }
        body.dark-mode .profile-card h1 { color: #f1f5f9 !important; }
        body.dark-mode .profile-card .fs-5 { color: #cbd5e1 !important; }
        body.dark-mode .order-card .fw-800 { color: #f1f5f9 !important; }
        body.dark-mode h3 { color: #f8fafc; }
        body.dark-mode .modal-content { background: #1e293b; color: #e2e8f0; }
        body.dark-mode .modal-content .form-control-lg { background: rgba(15,23,42,0.4); color: white; border-color: rgba(139,92,246,0.2); }
    </style>
</head>
<body class="${sessionScope.theme == 'light' ? 'light-mode' : 'dark-mode'} pb-5">

<jsp:include page="header.jsp" />

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-9">
            
            <!-- Success / Error Alerts -->
            <c:if test="${not empty success}">
                <div class="alert border-0 rounded-4 shadow-sm mb-4 p-3 d-flex align-items-center" style="background: linear-gradient(135deg, #f0fdf4, #dcfce7); color: #15803d;">
                    <i class="bi bi-check-circle-fill fs-4 me-3"></i> <strong>Success!</strong>&nbsp; ${success}
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert border-0 rounded-4 shadow-sm mb-4 p-3 d-flex align-items-center" style="background: linear-gradient(135deg, #fef2f2, #fee2e2); color: #b91c1c;">
                    <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i> ${error}
                </div>
            </c:if>

            <div class="profile-header"></div>
            <div class="card profile-card p-4 p-md-5">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-center align-items-md-start">
                    <div class="text-center text-md-start">
                        
                        <!-- Avatar with Upload -->
                        <form action="ProfileServlet" method="POST" enctype="multipart/form-data" id="imageUploadForm" class="d-inline-block">
                            <input type="hidden" name="action" value="uploadImage">
                            <div class="avatar-container mx-auto mx-md-0">
                                <div class="avatar-box" id="avatarBox">
                                    <c:choose>
                                        <c:when test="${not empty user.profileImage}">
                                            <img src="ImageServlet?path=${user.profileImage}" alt="Profile" id="avatarImg">
                                        </c:when>
                                        <c:otherwise>
                                            <i class="bi bi-person-bounding-box" id="avatarIcon"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <label class="avatar-upload-btn" title="Change Photo">
                                    <i class="bi bi-camera-fill" style="font-size: 0.9rem;"></i>
                                    <input type="file" name="profileImage" id="profileImageInput" accept="image/jpeg,image/png" style="display:none;">
                                </label>
                            </div>
                        </form>
                        
                        <h1 class="fw-800 mb-1" style="font-size: 2.5rem; letter-spacing: -1.5px;">${user.name}</h1>
                        <p class="text-secondary fw-600 mb-4">
                            <i class="bi bi-geo-alt-fill text-primary me-2"></i>
                            <c:choose>
                                <c:when test="${user.city == 'Pending'}">Set your city in profile settings</c:when>
                                <c:otherwise>Resident of ${user.city}</c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                    <button class="btn btn-purple btn-lg rounded-pill px-4" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                        <i class="bi bi-pencil-square me-2"></i>Edit Profile
                    </button>
                </div>

                <div class="row g-4 mt-2 mb-5">
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h2 class="fw-800 text-primary mb-1">${totalOrders}</h2>
                            <span class="text-secondary small fw-700 text-uppercase letter-wide">Total Orders</span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h2 class="fw-800 text-warning mb-1">
                                <c:choose>
                                    <c:when test="${totalOrders >= 20}">Elite</c:when>
                                    <c:when test="${totalOrders >= 10}">Gold</c:when>
                                    <c:when test="${totalOrders >= 5}">Silver</c:when>
                                    <c:otherwise>New</c:otherwise>
                                </c:choose>
                            </h2>
                            <span class="text-secondary small fw-700 text-uppercase letter-wide">Account Rank</span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-card">
                            <h2 class="fw-800 text-success mb-1">Active</h2>
                            <span class="text-secondary small fw-700 text-uppercase letter-wide">Member Status</span>
                        </div>
                    </div>
                </div>

                <!-- Contact Info -->
                <div class="row g-5">
                    <div class="col-md-6 info-row">
                        <label class="text-secondary small fw-800 text-uppercase mb-2">Registered Email</label>
                        <div class="fs-5 fw-600"><i class="bi bi-envelope-at me-2 text-primary"></i>${user.email}</div>
                    </div>
                    <div class="col-md-6 info-row">
                        <label class="text-secondary small fw-800 text-uppercase mb-2">Mobile Number</label>
                        <div class="fs-5 fw-600"><i class="bi bi-phone-vibrate me-2 text-success"></i>${user.phone}</div>
                    </div>
                </div>
            </div>

            <!-- Recent Orders -->
            <div class="mt-5">
                <div class="d-flex justify-content-between align-items-center mb-4 px-2">
                    <h3 class="fw-800 mb-0">Order History</h3>
                    <a href="OrderTrackingServlet" class="btn btn-link text-primary fw-700 text-decoration-none p-0">View tracking dashboard <i class="bi bi-chevron-right"></i></a>
                </div>
                
                <div class="row g-3">
                    <c:forEach var="ord" items="${lastOrders}">
                        <div class="col-12">
                            <div class="order-card d-flex flex-wrap justify-content-between align-items-center">
                                <div>
                                    <div class="fw-800 fs-5 mb-1 text-dark"><i class="bi bi-hash me-1"></i>Order #${ord.orderId}</div>
                                    <div class="text-secondary small fw-600"><i class="bi bi-calendar3 me-2"></i><fmt:formatDate value="${ord.createdAt}" pattern="dd MMM yyyy" /></div>
                                </div>
                                <div class="text-md-end mt-3 mt-md-0">
                                    <div class="fw-800 text-primary fs-4 mb-2">&#8377;${ord.totalAmount}</div>
                                    <span class="badge rounded-pill px-3 py-2 fw-700 ${ord.status == 'Delivered' ? 'bg-success bg-opacity-10 text-success' : 'bg-primary bg-opacity-10 text-primary'}">
                                        <i class="bi bi-circle-fill me-2" style="font-size: 0.5rem;"></i>${ord.status}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty lastOrders}">
                        <div class="card text-center p-5 border-0 bg-light" style="border-radius: 20px;">
                            <i class="bi bi-clock-history fs-1 text-muted opacity-25 mb-3"></i>
                            <h5 class="fw-700">No recent orders found</h5>
                            <p class="text-secondary">Ready to try something delicious?</p>
                            <a href="HomeServlet" class="btn btn-purple rounded-pill px-4 mt-2 fw-700">See Restaurants</a>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Edit Profile Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 rounded-4 shadow-lg">
            <div class="modal-header border-0 pb-0 pt-4 px-4">
                <h4 class="modal-title fw-800">Update Profile Details</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="ProfileServlet" method="POST" enctype="multipart/form-data" id="profileForm">
                <div class="modal-body p-4">
                    <div class="mb-4">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Display Name</label>
                        <input type="text" name="name" class="form-control form-control-lg" value="${user.name}" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Account Email</label>
                        <input type="email" name="email" class="form-control form-control-lg" value="${user.email}" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Phone Identifier</label>
                        <input type="tel" name="phone" class="form-control form-control-lg" value="${user.phone}" pattern="[0-9]{10}" maxlength="10" required>
                    </div>
                    <div class="mb-0">
                        <label class="form-label small fw-800 text-muted text-uppercase mb-2">Delivery City</label>
                        <input type="text" name="city" class="form-control form-control-lg" value="${user.city}" required>
                    </div>
                </div>
                <div class="modal-footer border-0 p-4 pt-0 gap-3">
                    <button type="button" class="btn btn-light rounded-pill px-4 fw-700 flex-grow-1" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-purple rounded-pill px-4 fw-700 flex-grow-1">Apply Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // ═══ PROFILE IMAGE UPLOAD ═══
    document.getElementById('profileImageInput').addEventListener('change', function() {
        const file = this.files[0];
        if (!file) return;

        // Client-side validation
        const validTypes = ['image/jpeg', 'image/png', 'image/jpg'];
        if (!validTypes.includes(file.type)) {
            alert('Only JPG and PNG images are allowed.');
            this.value = '';
            return;
        }
        if (file.size > 5 * 1024 * 1024) {
            alert('Image too large. Maximum size is 5MB.');
            this.value = '';
            return;
        }

        // Preview the image immediately
        const avatarBox = document.getElementById('avatarBox');
        const reader = new FileReader();
        reader.onload = function(e) {
            const existingImg = avatarBox.querySelector('img');
            const existingIcon = avatarBox.querySelector('i');
            if (existingImg) {
                existingImg.src = e.target.result;
            } else {
                if (existingIcon) existingIcon.remove();
                const img = document.createElement('img');
                img.src = e.target.result;
                img.alt = 'Profile';
                avatarBox.appendChild(img);
            }
        };
        reader.readAsDataURL(file);

        // Submit the form directly
        document.getElementById('imageUploadForm').submit();
    });
</script>
</body>
</html>
