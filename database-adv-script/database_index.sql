-- **********************************************
-- ALX Airbnb Database: Index Optimization Script
-- File: database_index.sql
-- Description: Create indexes and measure performance with EXPLAIN
-- **********************************************

-- =============================================
-- Before indexing: Measure performance of common queries
-- =============================================

-- EXPLAIN query for booking count by user
EXPLAIN SELECT COUNT(*) FROM bookings WHERE user_id = 1;

-- EXPLAIN query for joining properties and bookings
EXPLAIN
SELECT p.name, COUNT(b.id)
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id;

-- EXPLAIN query for filtering bookings by date
EXPLAIN SELECT * FROM bookings WHERE start_date >= '2025-01-01';

-- =============================================
-- CREATE INDEX commands to optimize performance
-- =============================================

-- Index on user_id in bookings (for filtering, joins, counts)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in bookings (for joins and aggregations)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on property_id in reviews (for subqueries and joins)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index on start_date in bookings (for filtering ranges)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- =============================================
-- After indexing: Measure performance again
-- =============================================

-- EXPLAIN same query for booking count by user
EXPLAIN SELECT COUNT(*) FROM bookings WHERE user_id = 1;

-- EXPLAIN same query for joining properties and bookings
EXPLAIN
SELECT p.name, COUNT(b.id)
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id;

-- EXPLAIN query for filtering bookings by date (post-index)
EXPLAIN SELECT * FROM bookings WHERE start_date >= '2025-01-01';
