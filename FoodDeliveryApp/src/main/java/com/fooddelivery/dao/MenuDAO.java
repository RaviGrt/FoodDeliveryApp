package com.fooddelivery.dao;

import com.fooddelivery.entity.MenuItem;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
    
    public List<MenuItem> getMenuByRestaurant(int restaurantId) {
        List<MenuItem> list = new ArrayList<>();
        String query = "SELECT m.*, r.name as restaurant_name FROM Menu m " +
                       "JOIN Restaurants r ON m.restaurant_id = r.restaurant_id " +
                       "WHERE m.restaurant_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, restaurantId);
            try (ResultSet rs = ps.executeQuery()) {
                ResultSetMetaData metaData = rs.getMetaData();
                boolean hasCategory = false;
                for (int i = 1; i <= metaData.getColumnCount(); i++) {
                    if ("category".equalsIgnoreCase(metaData.getColumnName(i))) {
                        hasCategory = true;
                        break;
                    }
                }
                
                while (rs.next()) {
                    MenuItem item = new MenuItem(
                        rs.getInt("item_id"), rs.getInt("restaurant_id"), rs.getString("name"),
                        rs.getDouble("price"), rs.getString("description"), 
                        rs.getInt("is_veg") == 1
                    );
                    if (hasCategory) item.setCategory(rs.getString("category"));
                    item.setRestaurantName(rs.getString("restaurant_name"));
                    list.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public MenuItem getItemById(int itemId) {
        MenuItem item = null;
        String query = "SELECT m.*, r.name as restaurant_name FROM Menu m " +
                       "JOIN Restaurants r ON m.restaurant_id = r.restaurant_id " +
                       "WHERE m.item_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, itemId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ResultSetMetaData metaData = rs.getMetaData();
                    boolean hasCategory = false;
                    for (int i = 1; i <= metaData.getColumnCount(); i++) {
                        if ("category".equalsIgnoreCase(metaData.getColumnName(i))) {
                            hasCategory = true;
                            break;
                        }
                    }
                    
                    item = new MenuItem(
                        rs.getInt("item_id"), rs.getInt("restaurant_id"), rs.getString("name"),
                        rs.getDouble("price"), rs.getString("description"), 
                        rs.getInt("is_veg") == 1
                    );
                    if (hasCategory) item.setCategory(rs.getString("category"));
                    item.setRestaurantName(rs.getString("restaurant_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return item;
    }

    /**
     * Search Across multiple fields with relevance ranking, limit, and unique results
     */
    public List<MenuItem> searchMenuItems(String keyword) {
        System.out.println("Search Query Triggered: " + keyword);
        List<MenuItem> list = new ArrayList<>();
        if (keyword == null || keyword.trim().isEmpty()) return list;

        String rawQuery = keyword.trim().toLowerCase();
        // Handle common misspellings (e.g. biriyani -> biryani)
        String cleanedQuery = rawQuery.replace("biriyani", "biryani");
        String term = "%" + cleanedQuery + "%";
        
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) return list;
            
            // 1. Check for category column first to avoid SQL crash
            boolean hasCategory = false;
            DatabaseMetaData dbMeta = conn.getMetaData();
            try (ResultSet colRs = dbMeta.getColumns(null, null, "MENU", "CATEGORY")) {
                if (colRs.next()) hasCategory = true;
            } catch (Exception e) {}

            String categoryFilter = hasCategory ? " OR LOWER(m.category) LIKE ?" : "";
            
            // 2. Build the query with DISTINCT and Relevance Ranking
            String sql = "SELECT DISTINCT m.*, r.name as restaurant_name FROM Menu m " +
                         "JOIN Restaurants r ON m.restaurant_id = r.restaurant_id " +
                         "WHERE LOWER(m.name) LIKE ? " +
                         "   OR LOWER(r.name) LIKE ? " +
                         categoryFilter +
                         "   OR LOWER(m.description) LIKE ? " +
                         "ORDER BY " +
                         "CASE " +
                         "  WHEN LOWER(m.name) = ? THEN 1 " + // Exact match
                         "  WHEN LOWER(m.name) LIKE ? THEN 2 " + // Starts with
                         "  WHEN LOWER(m.name) LIKE ? THEN 3 " + // Partial match
                         "  ELSE 4 " +
                         "END, m.name ASC " +
                         "OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY"; // Limit to 20 results (Oracle)

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                int i = 1;
                // Filters
                ps.setString(i++, term);
                ps.setString(i++, term);
                if (hasCategory) ps.setString(i++, term);
                ps.setString(i++, term);
                
                // For ORDER BY Ranking
                ps.setString(i++, cleanedQuery);      // Exact
                ps.setString(i++, cleanedQuery + "%"); // Starts with
                ps.setString(i++, term);               // Partial
                
                System.out.println("Executing SQL: " + sql);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        MenuItem item = new MenuItem(
                            rs.getInt("item_id"), rs.getInt("restaurant_id"), rs.getString("name"),
                            rs.getDouble("price"), rs.getString("description"), 
                            rs.getInt("is_veg") == 1
                        );
                        if (hasCategory) item.setCategory(rs.getString("category"));
                        item.setRestaurantName(rs.getString("restaurant_name"));
                        list.add(item);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Search Error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Get popular items when search is empty
     */
    public List<MenuItem> getPopularItems() {
        List<MenuItem> list = new ArrayList<>();
        String query = "SELECT m.*, r.name as restaurant_name FROM Menu m " +
                       "JOIN Restaurants r ON m.restaurant_id = r.restaurant_id " +
                       "WHERE ROWNUM <= 6 ORDER BY m.item_id DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            ResultSetMetaData metaData = rs.getMetaData();
            boolean hasCategory = false;
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                if ("category".equalsIgnoreCase(metaData.getColumnName(i))) {
                    hasCategory = true;
                    break;
                }
            }

            while (rs.next()) {
                MenuItem item = new MenuItem(
                    rs.getInt("item_id"), rs.getInt("restaurant_id"), rs.getString("name"),
                    rs.getDouble("price"), rs.getString("description"), 
                    rs.getInt("is_veg") == 1
                );
                if (hasCategory) item.setCategory(rs.getString("category"));
                item.setRestaurantName(rs.getString("restaurant_name"));
                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
