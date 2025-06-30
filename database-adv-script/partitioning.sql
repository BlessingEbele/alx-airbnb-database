-- ******************************************************
-- ALX Airbnb Database: Partitioning Bookings Table
-- File: partitioning.sql
-- Description: Re-creating bookings table using RANGE partitioning on start_date
-- ******************************************************

-- Step 1: Rename original table to preserve data
RENAME TABLE bookings TO bookings_backup;

-- Step 2: Create new partitioned bookings table
CREATE TABLE bookings (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (property_id) REFERENCES properties(id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_2024 VALUES LESS THAN (2025),
    PARTITION p_2025 VALUES LESS THAN (2026),
    PARTITION p_max  VALUES LESS THAN MAXVALUE
);

-- Step 3: Copy data from backup table into partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, status)
SELECT id, user_id, property_id, start_date, end_date, status FROM bookings_backup;

-- Optional Step 4: Run a sample performance query
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
