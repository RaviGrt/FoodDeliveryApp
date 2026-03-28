package com.fooddelivery.servlet;

import com.fooddelivery.dao.CartDAO;
import com.fooddelivery.entity.Cart;
import com.fooddelivery.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import com.fooddelivery.dao.MenuDAO;
import com.fooddelivery.dao.RestaurantDAO;
import com.fooddelivery.entity.MenuItem;
import com.fooddelivery.entity.Restaurant;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        List<Cart> cartItems = cartDAO.getCartByUser(user.getUserId());
        int restaurantId = cartDAO.getRestaurantIdFromCart(user.getUserId());
        
        MenuDAO menuDAO = new MenuDAO();
        RestaurantDAO resDAO = new RestaurantDAO();
        Map<Integer, MenuItem> menuMap = new HashMap<>();
        double subtotal = 0;
        
        for (Cart c : cartItems) {
            MenuItem item = menuDAO.getItemById(c.getItemId());
            if (item != null) {
                menuMap.put(c.getItemId(), item);
                subtotal += (item.getPrice() * c.getQuantity());
            }
        }
        
        double discountAmount = 0;
        String offerText = "";
        if (restaurantId > 0) {
            Restaurant res = resDAO.getRestaurantById(restaurantId);
            if (res != null) {
                String offers = res.getOffers();
                if (offers != null && offers.contains("%")) {
                    try {
                        String clean = offers.replaceAll("[^0-9]", "");
                        if (!clean.isEmpty()) {
                            int pct = Integer.parseInt(clean);
                            discountAmount = subtotal * (pct / 100.0);
                            offerText = pct + "% OFF";
                        }
                    } catch(Exception e) {}
                } else if (offers != null && offers.toLowerCase().contains("off")) {
                     discountAmount = subtotal * 0.10; // flat 10% 
                     offerText = "10% OFF";
                }
            }
        }
        
        double total = subtotal - discountAmount;
        if (total < 0) total = 0;

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("menuMap", menuMap);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("totalAmount", total);
        request.setAttribute("offerText", offerText);
        request.setAttribute("restaurantId", restaurantId);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int qty = Integer.parseInt(request.getParameter("quantity"));
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            User user = (User) request.getSession().getAttribute("user");
            
            Cart cart = new Cart(0, user.getUserId(), itemId, qty);
            cartDAO.addToCart(cart);
            
            response.sendRedirect("RestaurantServlet?id=" + restaurantId);
        } else if ("remove".equals(action)) {
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            cartDAO.removeFromCart(cartId);
            response.sendRedirect("CartServlet");
        }
    }
}
