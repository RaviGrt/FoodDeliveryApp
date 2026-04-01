<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container-fluid px-5">
        <a class="navbar-brand fw-900" href="HomeServlet" style="font-size: 2.2rem; letter-spacing: -2px;">
            <i class="bi bi-basket-fill text-warning me-2"></i>Urban <span style="color:rgba(255,255,255,0.9)">Eats</span>
        </a>
        <div class="ms-auto d-flex align-items-center gap-3">
            <a href="HomeServlet" class="nav-icon-link" title="Home"><i class="bi bi-house-door-fill"></i></a>
            <a href="MoodSuggestServlet" class="nav-icon-link" title="AI Suggest"><i class="bi bi-stars"></i></a>
            <a href="CartServlet" class="nav-icon-link" title="My Cart"><i class="bi bi-cart3"></i></a>
            <a href="OrderTrackingServlet" class="nav-icon-link" title="My Orders"><i class="bi bi-box-seam"></i></a>
            
            <%-- Global Profile Icon with Dropdown --%>
            <div class="profile-dropdown">
                <div class="nav-icon-link" style="padding: 0; overflow: hidden; border: 2px solid rgba(255,255,255,0.3); width: 60px; height: 60px; min-width: 60px; cursor: pointer;">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user.profileImage}">
                            <img src="ImageServlet?path=${sessionScope.user.profileImage}" alt="Profile" style="width: 100%; height: 100%; object-fit: cover; aspect-ratio: 1/1;">
                        </c:when>
                        <c:otherwise>
                            <i class="bi bi-person-circle"></i>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div class="dropdown-content">
                  <div class="dropdown-content-inner shadow-lg">
                    <a href="profileMenu.jsp" class="dropdown-item">
                        <i class="bi bi-person-gear"></i>
                        <span>Profile Settings</span>
                    </a>

                    <a href="changePassword.jsp" class="dropdown-item">
                        <i class="bi bi-shield-lock"></i>
                        <span>Change Password</span>
                    </a>
                    
                    <a href="ThemeServlet?theme=${sessionScope.theme == 'light' ? 'dark' : 'light'}" class="dropdown-item">
                        <c:choose>
                            <c:when test="${sessionScope.theme == 'light'}">
                                <i class="bi bi-moon-stars-fill"></i>
                                <span>Dark Mode</span>
                            </c:when>
                            <c:otherwise>
                                <i class="bi bi-sun-fill"></i>
                                <span>Light Mode</span>
                            </c:otherwise>
                        </c:choose>
                    </a>
                    
                    <hr class="my-2 border-opacity-10" style="border-color: var(--primary);">
                    
                    <a href="LogoutServlet" class="dropdown-item logout-item">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>
                    </a>
                  </div>
                </div>
            </div>
        </div>
    </div>
</nav>
