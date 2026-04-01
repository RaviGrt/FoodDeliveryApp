package com.fooddelivery.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ThemeServlet")
public class ThemeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String theme = request.getParameter("theme");
        if (theme != null && (theme.equals("dark") || theme.equals("light"))) {
            HttpSession session = request.getSession();
            session.setAttribute("theme", theme);
        }
        
        // Redirect back to the referring page
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect("HomeServlet");
        }
    }
}
