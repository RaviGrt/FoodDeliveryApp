-- ═══════════════════════════════════════════════════════════════
-- Urban Eats - Add profile_image column to Users table
-- Run this ALTER if the column doesn't already exist
-- ═══════════════════════════════════════════════════════════════

ALTER TABLE Users ADD (profile_image VARCHAR2(500));
