package com.fooddelivery.servlet;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.entity.Restaurant;
import com.fooddelivery.entity.User;
import com.fooddelivery.service.AISuggestionService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO = new RestaurantDAO();
    private AISuggestionService aiService = new AISuggestionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        String action = request.getParameter("action");
        String selectedCity = request.getParameter("city");

        if ("setCity".equals(action) && selectedCity != null && !selectedCity.isEmpty()) {
            user.setCity(selectedCity);
            new com.fooddelivery.dao.UserDAO().updateUserCity(user.getUserId(), selectedCity);
            response.sendRedirect("HomeServlet");
            return;
        }

        if (selectedCity == null || selectedCity.isEmpty() || "All".equals(selectedCity)) {
            selectedCity = user.getCity(); // default to user's registered city
        }
        
        boolean showCityModal = false;
        if (selectedCity == null || selectedCity.trim().isEmpty()) {
            showCityModal = true;
        }
        
        List<Restaurant> restaurants = restaurantDAO.getRestaurantsByCity(selectedCity);
        List<String> allCities = restaurantDAO.getAllCities();
        String aiSuggestion = aiService.getSuggestion();
        
        request.setAttribute("restaurants", restaurants);
        request.setAttribute("allCities", allCities);
        request.setAttribute("selectedCity", selectedCity);
        request.setAttribute("aiSuggestion", aiSuggestion);
        request.setAttribute("showCityModal", showCityModal);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
