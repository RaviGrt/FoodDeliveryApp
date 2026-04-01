package com.fooddelivery.servlet;

import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String city = "Pending";

        // ── Server-side validation ──

        // Phone: exactly 10 digits
        if (phone == null || !phone.trim().matches("^[0-9]{10}$")) {
            response.sendRedirect("register.jsp?error=Invalid+phone+number.+Must+be+10+digits.&phone=" + (phone != null ? phone.trim() : ""));
            return;
        }
        
        // Check duplicate phone
        User existingUser = userDAO.getUserByPhone(phone.trim());
        if (existingUser != null) {
            response.sendRedirect("register.jsp?error=Phone+Number+Already+Registered&phone=" + phone);
            return;
        }
        
        // Name: Alpha + spaces, 2-50 chars
        if (name == null || !name.trim().matches("^[A-Za-z\\s]{2,50}$")) {
            response.sendRedirect("register.jsp?error=Invalid+name.+Use+only+letters+(2-50+characters).&phone=" + phone);
            return;
        }

        // Email: standard format
        if (email == null || !email.trim().matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")) {
            response.sendRedirect("register.jsp?error=Invalid+email+address.&phone=" + phone);
            return;
        }

        // Password: minimum 6 chars
        if (password == null || password.length() < 6) {
            response.sendRedirect("register.jsp?error=Password+must+be+at+least+6+characters.&phone=" + phone);
            return;
        }

        // ── Register & auto-login ──
        User user = new User(0, name.trim(), email.trim(), password, phone.trim(), city);
        User registeredUser = userDAO.registerAndReturn(user);

        if (registeredUser != null) {
            // Create session immediately — user is now logged in
            HttpSession session = request.getSession();
            session.setAttribute("user", registeredUser);
            // Redirect straight to home — NOT back to login
            response.sendRedirect("HomeServlet");
        } else {
            response.sendRedirect("register.jsp?error=Registration+Failed.+Please+try+again.&phone=" + phone);
        }
    }
}
