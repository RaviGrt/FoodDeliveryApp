package com.fooddelivery.servlet;

import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.entity.Restaurant;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO = new RestaurantDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String query = request.getParameter("query");
        if (query == null) query = "";
        
        List<Restaurant> results = restaurantDAO.searchRestaurants(query);
        
        request.setAttribute("restaurants", results);
        request.setAttribute("searchQuery", query);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
