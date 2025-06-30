-- ***************************************************
-- ALX Airbnb Database: Complex Query Optimization
-- File: perfomance.sql
-- Description: Initial and optimized complex join queries with EXPLAIN ANALYZE
-- ***************************************************

-- =============================================
-- 1. Initial Query (Unoptimized with WHERE and AND)
-- Retrieves all bookings with user, property, and payment details
-- =============================================

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_date
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE 
    b.start_date >= '2024-01-01'
    AND u.email LIKE '%@example.com';

-- =============================================
-- 2. Optimized Query (Refactored)
-- - Removes unnecessary columns
-- - Uses indexed columns and filtered WHERE
-- =============================================

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE 
    b.start_date >= '2024-01-01'
    AND u.email LIKE '%@example.com';
