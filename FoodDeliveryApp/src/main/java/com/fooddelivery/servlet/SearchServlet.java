package com.fooddelivery.servlet;

import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.entity.MenuItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private MenuDAO menuDAO = new MenuDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String query = request.getParameter("query");
        System.out.println("SearchServlet: Received query=[" + query + "]");
        List<MenuItem> results;
        boolean isEmptyQuery = (query == null || query.trim().isEmpty());

        if (isEmptyQuery) {
            results = menuDAO.getPopularItems();
            request.setAttribute("isRecommendation", true);
        } else {
            results = menuDAO.searchMenuItems(query.trim());
            request.setAttribute("searchQuery", query);
            request.setAttribute("isRecommendation", false);
        }

        request.setAttribute("results", results);
        request.setAttribute("resultCount", results.size());
        
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
