<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .edit-container {
            max-width: 650px; margin: 4rem auto;
        }

        .edit-card {
            border-radius: 32px; border: none;
            background: var(--surface);
            box-shadow: 0 25px 60px rgba(0,0,0,0.08);
            padding: 3rem;
        }
        body.dark-mode .edit-card { 
            background: rgba(30, 41, 59, 0.7); 
            backdrop-filter: blur(15px);
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .form-label {
            font-weight: 700; color: var(--text-secondary); margin-bottom: 0.8rem;
            text-transform: uppercase; font-size: 0.85rem; letter-spacing: 1px;
        }
        body.dark-mode .form-label { color: #94a3b8; }

        .form-control {
            border-radius: 16px; height: 58px; font-weight: 600;
            border: 2px solid var(--border-color); background: #f8fafc;
        }
        body.dark-mode .form-control { 
            background: rgba(15, 23, 42, 0.4); 
            border-color: rgba(139, 92, 246, 0.2);
            color: white;
        }
        .form-control:focus {
            border-color: var(--primary); box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.15);
        }

        .btn-purple {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white; border: none; font-weight: 800; border-radius: 18px;
            height: 60px; font-size: 1.1rem; transition: all 0.3s ease;
            width: 100%; box-shadow: 0 8px 25px rgba(139, 92, 246, 0.3);
        }
        .btn-purple:hover { transform: translateY(-3px); box-shadow: 0 15px 35px rgba(139, 92, 246, 0.4); color: white; }

        .avatar-preview {
            width: 120px; height: 120px; border-radius: 35px; object-fit: cover;
            border: 4px solid var(--primary); margin-bottom: 2rem;
            box-shadow: 0 15px 30px rgba(139, 92, 246, 0.2);
        }

        .upload-area {
            border: 2px dashed var(--border-color); border-radius: 20px;
            padding: 2rem; text-align: center; cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }
        .upload-area:hover { 
            border-color: var(--primary); 
            background: rgba(139, 92, 246, 0.05);
            transform: translateY(-2px);
        }
        body.dark-mode .upload-area { border-color: rgba(139, 92, 246, 0.3); }

        .btn-back {
            display: flex; align-items: center; gap: 8px; text-decoration: none;
            color: var(--text-secondary); font-weight: 700; margin-bottom: 2rem;
            transition: color 0.3s ease;
        }
        .btn-back:hover { color: var(--primary); }
    </style>
</head>
<body class="${sessionScope.theme == 'light' ? 'light-mode' : 'dark-mode'}">

<jsp:include page="header.jsp" />

<div class="container edit-container">
    <a href="profileMenu.jsp" class="btn-back"><i class="bi bi-arrow-left"></i> Back to Menu</a>

    <div class="card edit-card">
        <div class="text-center">
            <h2 class="fw-800 mb-4" style="font-size: 2.2rem; letter-spacing: -1.5px;">Update Profile</h2>
            <c:choose>
                <c:when test="${not empty sessionScope.user.profileImage}">
                    <img src="ImageServlet?path=${sessionScope.user.profileImage}" alt="Profile" class="avatar-preview">
                </c:when>
                <c:otherwise>
                    <div class="avatar-preview bg-light d-flex align-items-center justify-content-center mx-auto" style="font-size: 3.5rem; color: var(--primary);">
                        <i class="bi bi-person-circle"></i>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger rounded-4 border-0 shadow-sm p-3 mb-4 fw-700">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> ${param.error}
            </div>
        </c:if>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success rounded-4 border-0 shadow-sm p-3 mb-4 fw-700">
                <i class="bi bi-check-circle-fill me-2"></i> ${param.success}
            </div>
        </c:if>

        <form action="UpdateProfileServlet" method="POST" enctype="multipart/form-data" id="profileForm">
            <div class="mb-4">
                <label class="form-label">Full Name</label>
                <input type="text" name="name" class="form-control" value="${sessionScope.user.name}" required>
            </div>
            <div class="mb-4">
                <label class="form-label">Phone Number</label>
                <input type="tel" name="phone" class="form-control" value="${sessionScope.user.phone}" pattern="[0-9]{10}" required>
            </div>

            <div class="mb-5">
                <label class="form-label">Update Profile Picture</label>
                <div class="upload-area">
                    <i class="bi bi-cloud-arrow-up fs-1 text-primary mb-2 d-block"></i>
                    <p class="mb-0 fw-600 text-secondary small">Click to select image (Max 5MB)</p>
                    <input type="file" name="profileImage" class="form-control border-0 bg-transparent opacity-0" style="position: absolute; top:0; left:0; width:100%; height:100%; cursor:pointer;" accept="image/jpeg,image/png">
                </div>
            </div>

            <button type="submit" class="btn btn-purple" id="submitBtn">
                Save Profile Changes
            </button>
        </form>
    </div>
</div>

</body>
</html>
