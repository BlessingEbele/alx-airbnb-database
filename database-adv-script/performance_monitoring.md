# Database Performance Monitoring and Refinement Report

## 🎯 Objective

Monitor the execution of frequently used SQL queries and refine schema or indexes based on performance analysis using `EXPLAIN ANALYZE`.

---

## 🔍 Query 1: Get total bookings by a specific user

### ✅ Original Query

```sql
SELECT COUNT(*) FROM bookings WHERE user_id = 3;
🔬 Performance Check

EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 3;
🐌 Observed Bottleneck
Full table scan

Execution time: ~70ms+

user_id not optimized for filtering

✅ Refinement

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
🚀 Improved Performance

EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 3;
Type: ref (index lookup)

Execution time: ~10ms

~6x improvement in speed

🔍 Query 2: Get bookings by date range
✅ Original Query

SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
🔬 Performance Check

EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
🐌 Observed Bottleneck
Before partitioning: full table scan

Execution time: ~85ms+

✅ Refinement
Applied RANGE partitioning on start_date in the bookings table

🚀 Improved Performance
Partition pruning occurred

Execution time: ~12ms

Only scanned 2024 partition instead of full table

🧠 Summary of Improvements
Query	Before (ms)	After (ms)	Optimization Technique
User booking count	~70ms	~10ms	Index on user_id
Bookings by date	~85ms	~12ms	Partition on start_date

📌 Recommendation
Monitor all JOIN-heavy queries using EXPLAIN ANALYZE

Add compound indexes if JOIN or WHERE conditions involve multiple columns

Archive or partition large tables yearly

Use ANALYZE TABLE to keep stats up-to-date for optimizer

✅ Conclusion
This task illustrates the importance of continuous database performance monitoring.
Small schema and indexing changes can yield significant performance gains, especially in systems with rapidly growing datasets like Airbnb.

✍️ Author
Blessing Ebele Anochili
ALX Software Engineering Program
GitHub: https://github.com/BlessingEbele/
