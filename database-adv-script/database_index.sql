-- **********************************************
-- ALX Airbnb Database: Index Optimization Script
-- File: database_index.sql
-- Description: Create indexes and measure performance using EXPLAIN ANALYZE
-- **********************************************

-- =============================================
-- BEFORE indexing: Measure performance using EXPLAIN ANALYZE
-- =============================================

-- Booking count by user
EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 1;

-- Join properties with bookings (aggregation)
EXPLAIN ANALYZE
SELECT p.name, COUNT(b.id)
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id;

-- Filter bookings by date
EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date >= '2025-01-01';

-- =============================================
-- CREATE INDEX commands to optimize performance
-- =============================================

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- =============================================
-- AFTER indexing: Re-measure performance using EXPLAIN ANALYZE
-- =============================================

-- Booking count by user (post-index)
EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 1;

-- Property-booking join (post-index)
EXPLAIN ANALYZE
SELECT p.name, COUNT(b.id)
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id;

-- Filter bookings by start_date (post-index)
EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date >= '2025-01-01';
