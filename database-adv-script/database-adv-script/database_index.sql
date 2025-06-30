-- **********************************************
-- ALX Airbnb Database: Index Optimization Script
-- File: database_index.sql
-- Description: Indexes to optimize query performance
-- **********************************************

-- Indexes on Booking table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Optional: If WHERE conditions or sorting involves dates
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- No need to index primary keys (e.g., users.id, properties.id) — already indexed by default
