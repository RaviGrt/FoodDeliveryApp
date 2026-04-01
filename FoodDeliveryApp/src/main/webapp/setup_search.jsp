<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.fooddelivery.dao.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Setup - Urban Eats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background: #1a1625; color: #e9d5ff; font-family: 'Inter', sans-serif; display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; }
        .card { background: rgba(45, 32, 72, 0.8); border: 1px solid rgba(139, 92, 246, 0.3); border-radius: 32px; padding: 3rem; max-width: 600px; width: 90%; backdrop-filter: blur(15px); text-align: center; }
        .btn-purple { background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%); color: white; border: none; font-weight: 800; padding: 16px 32px; border-radius: 20px; transition: 0.3s; }
        .btn-purple:hover { transform: translateY(-4px); box-shadow: 0 15px 40px rgba(139, 92, 246, 0.4); color: white; }
        .log-box { background: rgba(0,0,0,0.2); border-radius: 16px; padding: 20px; text-align: left; font-family: monospace; font-size: 0.85rem; max-height: 200px; overflow-y: auto; margin: 20px 0; }
        .text-success { color: #10b981 !important; }
        .text-danger { color: #ef4444 !important; }
    </style>
</head>
<body>
    <div class="card shadow-lg">
        <h2 class="fw-800 mb-2">Search Database Setup</h2>
        <p class="opacity-75 mb-4">Click below to automatically configure your database for intelligent search.</p>

        <%
            String action = request.getParameter("run");
            if ("true".equals(action)) {
                StringBuilder log = new StringBuilder();
                try (Connection conn = DBConnection.getConnection()) {
                    if (conn == null) throw new SQLException("Connection is null");
                    
                    Statement st = conn.createStatement();
                    
                    // 1. Check if column exists
                    log.append("Checking for 'category' column...<br>");
                    boolean exists = false;
                    try {
                        st.executeQuery("SELECT category FROM Menu WHERE ROWNUM <= 1");
                        exists = true;
                        log.append("<span class='text-success'>Column already exists!</span><br>");
                    } catch (SQLException e) {
                        log.append("Column missing. Adding column...<br>");
                    }

                    if (!exists) {
                        try {
                            st.execute("ALTER TABLE Menu ADD (category VARCHAR2(100))");
                            log.append("<span class='text-success'>Column added successfully.</span><br>");
                        } catch (SQLException e) {
                            log.append("<span class='text-danger'>Error adding column: " + e.getMessage() + "</span><br>");
                        }
                    }

                    // 2. Populate Categories
                    log.append("Populating sample categories...<br>");
                    int rows = st.executeUpdate("UPDATE Menu SET category = 'Indian' WHERE LOWER(name) LIKE '%biryani%' OR LOWER(name) LIKE '%paneer%'");
                    rows += st.executeUpdate("UPDATE Menu SET category = 'Fast Food' WHERE LOWER(name) LIKE '%burger%' OR LOWER(name) LIKE '%pizza%'");
                    rows += st.executeUpdate("UPDATE Menu SET category = 'Desserts' WHERE LOWER(name) LIKE '%sweet%' OR LOWER(name) LIKE '%ice cream%'");
                    rows += st.executeUpdate("UPDATE Menu SET category = 'Beverages' WHERE LOWER(name) LIKE '%coke%' OR LOWER(name) LIKE '%juice%'");
                    st.executeUpdate("UPDATE Menu SET category = 'Main Course' WHERE category IS NULL");
                    
                    conn.commit();
                    log.append("<span class='text-success'>Migration Complete! (" + rows + " items updated)</span><br>");
                    
                    out.println("<div class='log-box'>" + log + "</div>");
                    out.println("<div class='alert alert-success fs-5 fw-bold rounded-4'><i class='bi bi-check-circle-fill me-2'></i>Database is Ready!</div>");
                    out.println("<a href='SearchServlet?query=biryani' class='btn btn-purple mt-3'>Try Search Now</a>");
                } catch (Exception e) {
                    out.println("<div class='log-box'>" + log + "</div>");
                    out.println("<div class='alert alert-danger rounded-4'><i class='bi bi-exclamation-triangle-fill me-2'></i>" + e.getMessage() + "</div>");
                }
            } else {
        %>
            <a href="?run=true" class="btn btn-purple btn-lg shadow-sm">
                <i class="bi bi-database-fill-gear me-2"></i>Run Database Migration
            </a>
        <%
            }
        %>
        
        <div class="mt-4">
            <a href="HomeServlet" class="text-white opacity-50 small text-decoration-none">← Back to Home</a>
        </div>
    </div>
</body>
</html>
