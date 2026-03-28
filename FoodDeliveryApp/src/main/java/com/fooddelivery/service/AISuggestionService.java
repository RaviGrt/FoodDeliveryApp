package com.fooddelivery.service;

import java.time.LocalTime;

public class AISuggestionService {
    
    public String getSuggestion() {
        LocalTime time = LocalTime.now();
        int hour = time.getHour();
        
        if (hour >= 6 && hour < 11) {
            return "Good Morning! Perfect time for a healthy Breakfast like Idli or Poha.";
        } else if (hour >= 11 && hour < 16) {
            return "Good Afternoon! Time for a hearty Lunch like Biryani or Thali.";
        } else if (hour >= 16 && hour < 19) {
            return "Good Evening! How about some Snacks like Samosa or Pizza?";
        } else {
            return "Good Night! Enjoy a light Dinner like Soups or Salads before bed.";
        }
    }
}
