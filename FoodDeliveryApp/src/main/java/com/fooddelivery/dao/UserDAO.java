package com.fooddelivery.dao;

import com.fooddelivery.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    
    /**
     * Helper to build a User object from a ResultSet row.
     * Safely handles the profile_image column (may not exist in older schemas).
     */
    private User mapUser(ResultSet rs) throws SQLException {
        User user = new User(
            rs.getInt("user_id"), rs.getString("name"), rs.getString("email"),
            rs.getString("password"), rs.getString("phone"), rs.getString("city")
        );
        try {
            user.setProfileImage(rs.getString("profile_image"));
        } catch (SQLException e) {
            // Column doesn't exist yet — ignore gracefully
        }
        return user;
    }

    public User login(String phone, String password) {
        User user = null;
        String query = "SELECT * FROM Users WHERE phone = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, phone);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = mapUser(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean register(User user) {
        String query = "INSERT INTO Users (name, email, password, phone, city) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getCity());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Register a user AND return the fully-populated User object (with DB-generated user_id).
     * Used so we can immediately create a session after registration.
     */
    public User registerAndReturn(User user) {
        boolean inserted = register(user);
        if (inserted) {
            return getUserByPhone(user.getPhone());
        }
        return null;
    }
    
    public User getUserByPhone(String phone) {
        User user = null;
        String query = "SELECT * FROM Users WHERE phone = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, phone);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = mapUser(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserById(int userId) {
        User user = null;
        String query = "SELECT * FROM Users WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = mapUser(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        String query = "UPDATE Users SET name = ?, email = ?, phone = ?, city = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getCity());
            ps.setInt(5, user.getUserId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserProfile(int userId, String name, String phone, String password) {
        String query = "UPDATE Users SET name = ?, phone = ?, password = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, password);
            ps.setInt(4, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProfileImage(int userId, String imagePath) {
        String query = "UPDATE Users SET profile_image = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, imagePath);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserCity(int userId, String city) {
        String query = "UPDATE Users SET city = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, city);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
