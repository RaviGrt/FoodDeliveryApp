package com.fooddelivery.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

/**
 * Serves profile images from the persistent upload directory
 * ({catalina.base}/urban-eats-uploads/) so images survive server restarts.
 *
 * Usage: <img src="ImageServlet?path=user_1_abc123.jpg">
 */
@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {

    private String getUploadDirectory() {
        String baseDir = System.getProperty("user.home");
        return baseDir + File.separator + "urban-eats-uploads";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileName = request.getParameter("path");

        if (fileName == null || fileName.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No image path specified");
            return;
        }

        // Security: strip any path traversal attempts
        fileName = new File(fileName).getName();

        File imageFile = new File(getUploadDirectory(), fileName);

        if (!imageFile.exists() || !imageFile.isFile()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
            return;
        }

        // Determine content type
        String contentType = Files.probeContentType(imageFile.toPath());
        if (contentType == null) {
            contentType = "image/jpeg";
        }

        response.setContentType(contentType);
        response.setContentLengthLong(imageFile.length());

        // Cache for 1 hour
        response.setHeader("Cache-Control", "public, max-age=3600");

        try (OutputStream out = response.getOutputStream()) {
            Files.copy(imageFile.toPath(), out);
        }
    }
}
