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



# Advanced SQL: Subqueries

## 📁 File: `subqueries.sql`

This file contains solutions for **Task 1: Practice Subqueries** as part of the **ALX Airbnb Database Advanced Module**.

---

## 🧠 Objective

To practice and master writing both **correlated** and **non-correlated subqueries** in SQL.

---

## 📌 Task Overview

### 🔹 1. Non-Correlated Subquery – Properties with High Average Ratings

**Goal:** Retrieve all properties where the **average review rating is greater than 4.0**

**SQL Logic:**

WHERE (
  SELECT AVG(r.rating)
  FROM reviews r
  WHERE r.property_id = p.id
) > 4.0;
This subquery does not depend on the outer query row-by-row.

It calculates the average rating for each property and filters accordingly.

🔹 2. Correlated Subquery – Users with More Than 3 Bookings
Goal: Retrieve users who have made more than 3 bookings

SQL Logic:
WHERE (
  SELECT COUNT(*)
  FROM bookings b
  WHERE b.user_id = u.id
) > 3;
This subquery is correlated, meaning it depends on each row in the outer users query.

For every user, it counts their bookings and includes them if the count exceeds 3.

✅ How to Run
You can run the SQL file using a MySQL-compatible client or CLI:

mysql -u your_username -p your_database < subqueries.sql
Ensure the Airbnb database and related tables are already created and populated.

# Advanced SQL: Aggregations and Window Functions

## 📁 File: `aggregations_and_window_functions.sql`

This file contains solutions for **Task 2: Apply Aggregations and Window Functions** as part of the **ALX Airbnb Database Advanced Module**.

---

## 🧠 Objective

To use SQL aggregation functions and window functions to perform in-depth data analysis and ranking.

---

## 📌 Task Overview

### 🔹 1. Aggregation – Total Bookings Per User

**Goal:** Find the total number of bookings each user has made.

**SQL Logic:**

```sql
SELECT 
  user_id,
  COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;
In our query, we join with the users table to retrieve full user details and group the result by user ID.

Why this matters:
This helps identify highly active users or target frequent travelers for promotions.

🔹 2. Window Function – Rank Properties by Booking Count

**Goal:** Rank all properties by the number of bookings they have received using the `ROW_NUMBER()` window function.

**SQL Logic:**

```sql
ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS property_rank

Why this matters:
This allows hosts or platform admins to spot top-performing listings.
ROW_NUMBER() assigns a unique ranking to each property based on its booking count.

We use a LEFT JOIN to ensure properties with no bookings are still included.

✅ How to Run
Run the SQL file using a MySQL-compatible client:

mysql -u your_username -p your_database < aggregations_and_window_functions.sql
Ensure your Airbnb database and sample data are available.




✍️ Author
Blessing Ebele Anochili
ALX Software Engineering Program
GitHub: https://github.com/BlessingEbele


