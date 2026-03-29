package com.fooddelivery.servlet;

import com.fooddelivery.dao.OrderDAO;
import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.entity.Order;
import com.fooddelivery.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Refresh user details from DB to ensure accuracy
        user = userDAO.getUserById(user.getUserId());
        session.setAttribute("user", user);

        // Fetch order stats
        int totalOrders = orderDAO.getOrdersCountByUserId(user.getUserId());
        List<Order> allOrders = orderDAO.getOrdersByUser(user.getUserId());
        List<Order> lastOrders = allOrders.stream().limit(3).collect(Collectors.toList());
        
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("lastOrders", lastOrders);
        if (!lastOrders.isEmpty()) {
            request.setAttribute("lastOrderStatus", lastOrders.get(0).getStatus());
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");

        // Comprehensive Validation
        // 1. Name: Alpha-only, 2-50 chars
        if (name == null || !name.trim().matches("^[A-Za-z\\s]{2,50}$")) {
            response.sendRedirect("error.jsp?type=invalid_name");
            return;
        }
        // 2. Email: standard format
        if (email == null || !email.trim().matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")) {
            response.sendRedirect("error.jsp?type=invalid_email");
            return;
        }
        // 3. Phone: 10 digits numeric
        if (phone == null || !phone.trim().matches("^[0-9]{10}$")) {
            response.sendRedirect("error.jsp?type=invalid_phone");
            return;
        }
        // 4. City: Non-empty
        if (city == null || city.trim().isEmpty()) {
            response.sendRedirect("error.jsp?type=invalid_city");
            return;
        }

        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setCity(city);

        boolean updated = userDAO.updateUser(user);
        if (updated) {
            session.setAttribute("user", user);
            request.setAttribute("success", "Profile updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update profile. Please try again.");
        }

        doGet(request, response);
    }
}
