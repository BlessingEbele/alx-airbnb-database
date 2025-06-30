# Indexing for Optimization

## 🎯 Objective

This document outlines the process and results of adding indexes to optimize SQL query performance in the Airbnb database, using `EXPLAIN ANALYZE` to measure actual execution performance.

---

## 🧠 Step 1: Identifying High-Usage Columns

Based on query patterns from earlier tasks and expected usage in a real-world application, the following columns were selected for indexing:

| Table      | Column           | Reason for Indexing                        |
|------------|------------------|--------------------------------------------|
| `bookings` | `user_id`        | Used in JOINs, filters, and aggregations   |
| `bookings` | `property_id`    | Used in JOINs and grouping                 |
| `reviews`  | `property_id`    | Used in subqueries and JOINs               |
| `bookings` | `start_date`     | Used in range queries and sorting          |

---

## ⚙️ Step 2: CREATE INDEX Commands

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
📊 Step 3: Performance Measurement Using EXPLAIN ANALYZE
We used EXPLAIN ANALYZE before and after applying the indexes to evaluate actual performance differences.

🔍 Query 1: Count bookings by user
Before indexing:

sql
EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 1;
Type: ALL (full table scan)

Rows: 10,000+

Execution time: Relatively high

After indexing:

sql

EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 1;
Type: ref (indexed lookup)

Key: idx_bookings_user_id

Execution time: Significantly reduced

🔍 Query 2: Join properties with bookings and group
Before indexing:

sql

EXPLAIN ANALYZE
SELECT p.name, COUNT(b.id)
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id;
Join type: ALL

Execution time: Moderate to high

After indexing:

sql

EXPLAIN ANALYZE
SELECT p.name, COUNT(b.id)
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id;
Join type: ref

Key used: idx_bookings_property_id

Execution time: Much faster and optimized

🔍 Query 3: Filter bookings by start_date
Before indexing:

sql

EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date >= '2025-01-01';
Type: ALL

Execution time: Long due to date scan

After indexing:

sql

EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date >= '2025-01-01';
Type: range

Key: idx_bookings_start_date

Execution time: Shortened via index range scan

✅ Conclusion
By applying carefully chosen indexes and validating with EXPLAIN ANALYZE, we observed:

Reduced execution time

Efficient row access via indexed paths

Overall performance boost for read-heavy operations

This task demonstrates the real-world importance of indexing and performance tuning in large-scale database systems like Airbnb.

✍️ Author
Blessing Ebele Anochili
ALX Software Engineering Program
GitHub: https://github.com/BlessingEbele/ 
