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

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate all fields present
        if (currentPassword == null || currentPassword.trim().isEmpty() ||
            newPassword == null || newPassword.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            response.sendRedirect("changePassword.jsp?error=All fields are required");
            return;
        }

        // Verify current password
        if (!currentPassword.equals(user.getPassword())) {
            response.sendRedirect("changePassword.jsp?error=Current password is incorrect");
            return;
        }

        // Check new password length
        if (newPassword.trim().length() < 6) {
            response.sendRedirect("changePassword.jsp?error=New password must be at least 6 characters");
            return;
        }

        // Check passwords match
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("changePassword.jsp?error=New passwords do not match");
            return;
        }

        // Check not same as current
        if (newPassword.equals(currentPassword)) {
            response.sendRedirect("changePassword.jsp?error=New password must be different from current password");
            return;
        }

        // Update password in database
        boolean success = userDAO.updateUserProfile(user.getUserId(), user.getName(), user.getPhone(), newPassword.trim());

        if (success) {
            user.setPassword(newPassword.trim());
            session.setAttribute("user", user);
            response.sendRedirect("changePassword.jsp?success=Password changed successfully!");
        } else {
            response.sendRedirect("changePassword.jsp?error=Failed to update password. Please try again.");
        }
    }
}
