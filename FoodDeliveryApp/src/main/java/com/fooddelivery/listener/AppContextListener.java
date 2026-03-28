package com.fooddelivery.listener;

import com.fooddelivery.dao.DBConnection;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Initializing Database Tables on Startup...");
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Notice: The sql folder was moved to src/main/resources/sql
            executeSqlScript(AppContextListener.class.getResourceAsStream("/sql/schema.sql"), stmt);
            executeSqlScript(AppContextListener.class.getResourceAsStream("/sql/data.sql"), stmt);
            
            System.out.println("Database auto-initialization complete. Missing tables were created.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void executeSqlScript(InputStream is, Statement stmt) throws Exception {
        if (is == null) {
            System.err.println("SQL script not found in resources/sql/");
            return;
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            String cleanLine = line;
            int commentIdx = cleanLine.indexOf("--");
            if (commentIdx != -1) {
                cleanLine = cleanLine.substring(0, commentIdx);
            }
            if (cleanLine.trim().isEmpty()) {
                continue;
            }
            sb.append(cleanLine).append(" ");
            
            if (cleanLine.trim().endsWith(";")) {
                String sql = sb.toString().replace(";", "").trim();
                sb.setLength(0);
                if (!sql.isEmpty() && !sql.equalsIgnoreCase("COMMIT")) {
                    try {
                        stmt.execute(sql);
                        System.out.println("Executed: " + sql.substring(0, Math.min(30, sql.length())) + "...");
                    } catch (Exception e) {
                        System.err.println("SQL Execution Failed for: " + sql.substring(0, Math.min(30, sql.length())) + "...");
                        System.err.println("Reason: " + e.getMessage());
                    }
                }
            }
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
