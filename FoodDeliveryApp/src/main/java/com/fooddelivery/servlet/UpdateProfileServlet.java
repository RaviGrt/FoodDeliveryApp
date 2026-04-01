package com.fooddelivery.servlet;

import com.fooddelivery.dao.UserDAO;
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
import java.util.UUID;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1 MB
    maxFileSize       = 5 * 1024 * 1024,  // 5 MB
    maxRequestSize    = 10 * 1024 * 1024   // 10 MB
)
public class UpdateProfileServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    /**
     * Returns a persistent upload directory outside the webapp deployment path.
     * Uses {catalina.base}/urban-eats-uploads/ so images survive server restarts.
     */
    private String getUploadDirectory() {
        String baseDir = System.getProperty("user.home");
        return baseDir + File.separator + "urban-eats-uploads";
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
        String phone = request.getParameter("phone");

        // Validation
        if (name == null || name.trim().isEmpty() || 
            phone == null || phone.trim().isEmpty()) {
            response.sendRedirect("editProfile.jsp?error=Name and phone are required");
            return;
        }

        // Handle Image Upload if present
        Part filePart = request.getPart("profileImage");
        String finalImagePath = user.getProfileImage();

        if (filePart != null && filePart.getSize() > 0) {
            String contentType = filePart.getContentType();
            if (contentType.equals("image/jpeg") || contentType.equals("image/png") || contentType.equals("image/jpg")) {
                String uploadPath = getUploadDirectory();
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                String ext = contentType.equals("image/png") ? ".png" : ".jpg";
                String fileName = "user_" + user.getUserId() + "_" + UUID.randomUUID().toString().substring(0, 8) + ext;
                String filePath = uploadPath + File.separator + fileName;

                filePart.write(filePath);
                String newDbPath = fileName; // Just the filename, served via ImageServlet
                
                // Update DB for image
                boolean imgUpdated = userDAO.updateProfileImage(user.getUserId(), newDbPath);
                if (imgUpdated) {
                    // Delete old image if it exists
                    if (finalImagePath != null && !finalImagePath.isEmpty()) {
                        File oldFile = new File(uploadPath + File.separator + finalImagePath);
                        if (oldFile.exists()) oldFile.delete();
                    }
                    finalImagePath = newDbPath;
                } else {
                    response.sendRedirect("editProfile.jsp?error=Database error updating image");
                    return;
                }
            }
        }

        // Update name and phone (keep current password unchanged)
        boolean success = userDAO.updateUserProfile(user.getUserId(), name.trim(), phone.trim(), user.getPassword());

        if (success) {
            user.setName(name.trim());
            user.setPhone(phone.trim());
            user.setProfileImage(finalImagePath);
            session.setAttribute("user", user);
            response.sendRedirect("editProfile.jsp?success=Profile updated successfully!");
        } else {
            response.sendRedirect("editProfile.jsp?error=Database update failed");
        }
    }
}
