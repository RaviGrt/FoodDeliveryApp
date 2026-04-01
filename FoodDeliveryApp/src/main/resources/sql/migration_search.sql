-- ═══════════════════════════════════════════════════════════════
-- Urban Eats - Intelligent Search Migration
-- This script adds the 'category' column to the Menu table
-- and populates it with sample data for better search results.
-- ═══════════════════════════════════════════════════════════════

-- 1. Add category column
ALTER TABLE Menu ADD (category VARCHAR2(100));

-- 2. Populate Categories based on common keywords
UPDATE Menu SET category = 'Indian' 
WHERE LOWER(name) LIKE '%biryani%' 
   OR LOWER(name) LIKE '%paneer%' 
   OR LOWER(name) LIKE '%dal%' 
   OR LOWER(name) LIKE '%masala%'
   OR LOWER(name) LIKE '%curry%'
   OR LOWER(name) LIKE '%roti%'
   OR LOWER(name) LIKE '%naan%'
   OR LOWER(name) LIKE '%tikka%';

UPDATE Menu SET category = 'Fast Food' 
WHERE LOWER(name) LIKE '%burger%' 
   OR LOWER(name) LIKE '%pizza%' 
   OR LOWER(name) LIKE '%fries%' 
   OR LOWER(name) LIKE '%sandwich%'
   OR LOWER(name) LIKE '%wrap%'
   OR LOWER(name) LIKE '%nuggets%';

UPDATE Menu SET category = 'Chinese' 
WHERE LOWER(name) LIKE '%noodle%' 
   OR LOWER(name) LIKE '%fried rice%' 
   OR LOWER(name) LIKE '%manchurian%'
   OR LOWER(name) LIKE '%manchow%'
   OR LOWER(name) LIKE '%spring roll%';

UPDATE Menu SET category = 'Desserts' 
WHERE LOWER(name) LIKE '%sweet%' 
   OR LOWER(name) LIKE '%ice cream%' 
   OR LOWER(name) LIKE '%cake%'
   OR LOWER(name) LIKE '%jamun%'
   OR LOWER(name) LIKE '%pastry%'
   OR LOWER(name) LIKE '%pudding%';

UPDATE Menu SET category = 'Beverages' 
WHERE LOWER(name) LIKE '%coke%' 
   OR LOWER(name) LIKE '%juice%' 
   OR LOWER(name) LIKE '%tea%'
   OR LOWER(name) LIKE '%coffee%'
   OR LOWER(name) LIKE '%shake%'
   OR LOWER(name) LIKE '%smoothie%';

-- 3. Set a default category for anything else
UPDATE Menu SET category = 'Main Course' WHERE category IS NULL;

-- 4. Commit changes
COMMIT;
