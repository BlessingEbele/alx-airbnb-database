# Query Optimization Report

## 🎯 Objective

Optimize a complex SQL query that retrieves data from multiple tables in the Airbnb database.

---

## 🧠 Step 1: Initial Query

The original query joins four large tables:

- `bookings`
- `users`
- `properties`
- `payments`

```sql
SELECT 
  b.id, u.first_name, u.last_name, u.email,
  p.name, p.location,
  pay.amount, pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;


SELECT 
  b.id, u.first_name, u.last_name,
  p.name, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
