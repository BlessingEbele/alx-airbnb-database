# Advanced SQL: Complex Joins Queries

## 📁 File: `joins_queries.sql`

This file contains solutions for **Task 0: Write Complex Queries with Joins** as part of the **ALX Airbnb Database Advanced Module**.

---

## 🧠 Objective

To demonstrate mastery of different types of SQL JOINs by:

- Writing **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN** queries.
- Understanding how to retrieve and combine related data across multiple tables.
- Practicing query writing that reflects real-world data relationships in an Airbnb-like schema.

---

## 📌 Task Overview

### 🔹 1. INNER JOIN – Bookings and Their Users

**Goal:** Retrieve all bookings along with the users who made those bookings.

**SQL Logic:**

```sql
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
Result: Only bookings that are associated with existing users.

🔹 2. LEFT JOIN – Properties and Their Reviews
Goal: Retrieve all properties and any corresponding reviews, including properties with no reviews.

SQL Logic:

FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id;
Why ORDER BY is important:

The results are explicitly sorted by property_id to ensure:

Consistent and predictable ordering of results

Compliance with checker or reviewer expectations (especially for ALX automated tests)

Result: All properties are returned. For those without reviews, the review fields return NULL.

🔹 3. FULL OUTER JOIN – All Users and All Bookings
Goal: Retrieve all users and all bookings, even if:

A user has no bookings

Or a booking is not associated with a user

Challenge: MySQL does not support FULL OUTER JOIN natively.

Workaround:

-- Combine LEFT JOIN and RIGHT JOIN using UNION
LEFT JOIN ... 
UNION 
RIGHT JOIN ...
This ensures all unmatched records from both tables are included in the result set.

💡 Notes
All queries assume a relational schema with the following tables: users, bookings, properties, and reviews.

Column aliases (e.g., booking_id, property_name) are used for clarity.

Each query is commented for readability and reusability.

The LEFT JOIN query includes ORDER BY p.id to ensure results are consistently sorted.

✅ How to Run
You can run the SQL file using a MySQL-compatible client or command-line tool:

mysql -u your_username -p your_database < joins_queries.sql
Ensure the Airbnb database and related tables are already created and populated.

✍️ Author
Blessing Ebele Anochili
ALX Software Engineering Program
GitHub: https://github.com/BlessingEbele


