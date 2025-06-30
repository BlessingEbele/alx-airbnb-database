# Indexing for Optimization

## 🎯 Objective

This document outlines the process and results of adding indexes to optimize SQL query performance in the Airbnb database.

---

## 🧠 Step 1: Identifying High-Usage Columns

Based on previous tasks and query analysis, the following columns were identified as frequently used in `JOIN`, `WHERE`, and `ORDER BY` clauses:

| Table      | Column           | Reason for Indexing                        |
|------------|------------------|--------------------------------------------|
| `bookings` | `user_id`        | Used in JOIN and COUNT queries             |
| `bookings` | `property_id`    | Used in JOIN and aggregation               |
| `reviews`  | `property_id`    | Used in subqueries and JOINs               |
| `bookings` | `start_date`     | Often used in filtering or sorting         |

---

## ⚙️ Step 2: Index Implementation

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
