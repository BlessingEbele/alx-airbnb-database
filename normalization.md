# 🔄 Airbnb Database Normalization Report

## 🎯 Objective

Ensure that the Airbnb relational database design adheres to the **Third Normal Form (3NF)** to minimize redundancy, ensure data integrity, and improve scalability and performance.

---

## ✅ Summary of Normalization Forms

| Normal Form | Description | Achieved? |
|-------------|-------------|-----------|
| **1NF**     | All tables have atomic (indivisible) values. No repeating groups or arrays. | ✅ Yes |
| **2NF**     | All non-key attributes are fully dependent on the whole primary key. | ✅ Yes |
| **3NF**     | No transitive dependencies; all attributes depend *only* on the primary key. | ✅ Yes |

---

## 🔍 Table-by-Table Normalization Review

---

### 🧍 `users`

- All fields are atomic.
- `email` is unique.
- `role` is clearly defined (ENUM).
- No repeating or derived fields.

✅ **In 3NF**

---

### 🏠 `properties`

- Fully dependent on `property_id` (PK).
- `host_id` is a foreign key to `users`, no transitive dependency.
- `location` is a single string (no city/state split — which is acceptable at this stage).
- `pricepernight`, `description` are atomic.

✅ **In 3NF**

---

### 📅 `bookings`

- `booking_id` is the PK.
- Fully depends on both `user_id` and `property_id`, but these are FK references — not a composite key.
- `total_price` is derived (start_date to end_date * price), but acceptable in production for historical record.

✅ **In 3NF**

---

### 💳 `payments`

- Each payment is tied to exactly one booking (`booking_id`).
- `amount`, `payment_method`, `payment_date` are atomic.
- No transitive dependencies.

✅ **In 3NF**

---

### ⭐ `reviews`

- Tied directly to both `user_id` and `property_id` via FK.
- `rating` is a scalar value with constraints (1–5).
- No derived or redundant data.

✅ **In 3NF**

---

### 💬 `messages`

- `sender_id` and `recipient_id` are FKs.
- `message_body` is atomic text.
- No multi-value or repeating groups.

✅ **In 3NF**

---

## 📌 Conclusion

The Airbnb database schema meets all criteria for **Third Normal Form (3NF)**:

- Each table has a **single purpose** and **single primary key**.
- All fields are **atomic and fully dependent** on the primary key.
- There are **no transitive dependencies** across the schema.
- Foreign keys are used correctly to maintain referential integrity.

---

## 🔁 Notes

- Derived data (like `total_price`) is stored for performance but calculated once at booking creation.
- ENUMs like `role`, `status`, and `payment_method` are used for data validation and consistency.

---

## 📂 File Info

- **File**: `normalization.md`
- **Project Repo**: [alx-airbnb-database](https://github.com/BlessingEbele/alx-airbnb-database)
