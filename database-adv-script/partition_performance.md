# Booking Table Partitioning Report

## 🎯 Objective

Improve performance on the `bookings` table using **partitioning by `start_date`** to speed up queries on date ranges.

---

## ⚙️ Methodology

1. **Renamed** the existing `bookings` table to `bookings_backup`.
2. **Created a new `bookings` table** partitioned by year using:
   ```sql
   PARTITION BY RANGE (YEAR(start_date))
Defined partitions:

2022 and earlier

2023

2024

2025

Everything else (MAXVALUE)

Migrated existing data using:

sql

INSERT INTO bookings (...) SELECT ... FROM bookings_backup;
🔍 Performance Testing
📌 Query Tested:
sql

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
⚖️ Comparison
Metric	Before Partitioning	After Partitioning
Execution Time	Slow (scans all rows)	Faster (scans only 2024 partition)
Partitions Used	N/A	1 out of 5
Rows Scanned	All	Only relevant
Query Plan	Full Table Scan	Partition Pruning

✅ Conclusion
Partitioning the bookings table by year:

Greatly reduces scan time for queries targeting specific date ranges

Makes the system more scalable for growing datasets

Simplifies performance tuning for analytics

This is a critical real-world technique when working with time-based transactional data.

✍️ Author
Blessing Ebele Anochili
ALX Software Engineering Program
GitHub: https://github.com/BlessingEbele/
