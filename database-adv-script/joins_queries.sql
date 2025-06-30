-- **********************************************
-- ALX Airbnb Database: Advanced SQL - Joins Task
-- File: joins_queries.sql
-- Description: Complex SQL queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN
-- **********************************************

-- =============================================
-- 1. INNER JOIN: Bookings and their respective users
-- Objective: Retrieve all bookings along with the users who made them
-- =============================================

SELECT 
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.id;

-- =============================================
-- 2. LEFT JOIN: Properties and their reviews
-- Objective: Retrieve all properties and their reviews, including properties without reviews
-- =============================================

SELECT 
    p.id AS property_id,
    p.name AS property_name,
    r.id AS review_id,
    r.rating,
    r.comment
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.id = r.property_id
ORDER BY 
    p.id;

-- =============================================
-- 3. FULL OUTER JOIN: All users and all bookings
-- Objective: Retrieve all users and all bookings, even if not linked
-- This simulation uses UNION of LEFT and RIGHT JOIN.
-- =============================================

SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    users u
LEFT JOIN 
    bookings b ON u.id = b.user_id

UNION

SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    users u
RIGHT JOIN 
    bookings b ON u.id = b.user_id;
