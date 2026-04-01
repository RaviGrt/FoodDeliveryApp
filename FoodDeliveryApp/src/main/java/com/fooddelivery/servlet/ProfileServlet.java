package com.fooddelivery.servlet;

import com.fooddelivery.dao.OrderDAO;
import com.fooddelivery.dao.UserDAO;
import com.fooddelivery.entity.Order;
import com.fooddelivery.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@WebServlet("/ProfileServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1 MB
    maxFileSize       = 5 * 1024 * 1024,  // 5 MB
    maxRequestSize    = 10 * 1024 * 1024   // 10 MB
)
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

        // Refresh user from DB
        user = userDAO.getUserById(user.getUserId());
        session.setAttribute("user", user);

        // Order stats
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

        String action = request.getParameter("action");

        if ("uploadImage".equals(action)) {
            handleImageUpload(request, response, session, user);
        } else {
            handleProfileUpdate(request, response, session, user);
        }
    }

    /**
     * Returns a persistent upload directory outside the webapp deployment path.
     * Uses {catalina.base}/urban-eats-uploads/ so images survive server restarts.
     */
    private String getPersistentUploadDirectory() {
        String baseDir = System.getProperty("user.home");
        return baseDir + File.separator + "urban-eats-uploads";
    }

    /**
     * Handle profile picture upload.
     */
    private void handleImageUpload(HttpServletRequest request, HttpServletResponse response,
                                   HttpSession session, User user) 
            throws ServletException, IOException {
        try {
            Part filePart = request.getPart("profileImage");

            if (filePart == null || filePart.getSize() == 0) {
                request.setAttribute("error", "Please select an image file.");
                doGet(request, response);
                return;
            }

            // Validate file size (max 5MB)
            if (filePart.getSize() > 5 * 1024 * 1024) {
                request.setAttribute("error", "Image too large. Maximum size is 5MB.");
                doGet(request, response);
                return;
            }

            // Validate file type
            String contentType = filePart.getContentType();
            if (contentType == null || 
                (!contentType.equals("image/jpeg") && !contentType.equals("image/png") && !contentType.equals("image/jpg"))) {
                request.setAttribute("error", "Only JPG and PNG images are allowed.");
                doGet(request, response);
                return;
            }

            String ext = contentType.equals("image/png") ? ".png" : ".jpg";
            String uploadPath = getPersistentUploadDirectory();
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String fileName = "user_" + user.getUserId() + "_" + UUID.randomUUID().toString().substring(0, 8) + ext;
            String filePath = uploadPath + File.separator + fileName;

            // Delete old profile image file if it exists in persistent storage
            String oldImage = user.getProfileImage();
            if (oldImage != null && !oldImage.isEmpty()) {
                File oldFile = new File(uploadPath + File.separator + oldImage);
                if (oldFile.exists()) oldFile.delete();
            }

            filePart.write(filePath);
            String dbPath = fileName; // Just the filename
            boolean updated = userDAO.updateProfileImage(user.getUserId(), dbPath);

            if (updated) {
                user.setProfileImage(dbPath);
                session.setAttribute("user", user);
                request.setAttribute("success", "Profile picture updated successfully!");
            } else {
                request.setAttribute("error", "Failed to save profile image reference in database.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error uploading image: " + e.getMessage());
        }

        doGet(request, response);
    }

    /**
     * Handle profile details update (name, email, phone, city).
     */
    private void handleProfileUpdate(HttpServletRequest request, HttpServletResponse response,
                                     HttpSession session, User user) 
            throws ServletException, IOException {
        String name  = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String city  = request.getParameter("city");

        // Validation
        if (name == null || !name.trim().matches("^[A-Za-z\\s]{2,50}$")) {
            request.setAttribute("error", "Invalid name. Use only letters (2-50 characters).");
            doGet(request, response);
            return;
        }
        if (email == null || !email.trim().matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")) {
            request.setAttribute("error", "Invalid email address.");
            doGet(request, response);
            return;
        }
        if (phone == null || !phone.trim().matches("^[0-9]{10}$")) {
            request.setAttribute("error", "Invalid phone number. Must be 10 digits.");
            doGet(request, response);
            return;
        }
        if (city == null || city.trim().isEmpty()) {
            request.setAttribute("error", "City cannot be empty.");
            doGet(request, response);
            return;
        }

        user.setName(name.trim());
        user.setEmail(email.trim());
        user.setPhone(phone.trim());
        user.setCity(city.trim());

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
