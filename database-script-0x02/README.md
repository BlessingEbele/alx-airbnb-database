# 🌱 Airbnb Sample Data Seeder

This directory contains SQL `INSERT` statements to populate the Airbnb database with sample data for testing and development.

---

## 📁 File: `seed.sql`

### Contents:
- ✅ Sample users (guest, host, admin)
- ✅ Properties listed by hosts
- ✅ Bookings made by guests
- ✅ Payments tied to bookings
- ✅ Reviews written by guests
- ✅ Messages exchanged between users

---

## 🌍 Sample Data Overview

### 👤 Users
| Name     | Role  | Email             |
|----------|-------|-------------------|
| Ada Eze  | guest | ada@example.com   |
| Tunde B. | host  | tunde@example.com |
| Chidi O. | admin | chidi@example.com |

---

### 🏠 Properties
- **Lekki Seaside Apartment**: ₦35,000/night
- **Abuja City Villa**: ₦50,000/night

---

### 📅 Bookings
- Ada books Lekki for 4 nights (Confirmed)
- Ada books Abuja for 2 nights (Pending)

---

### 💳 Payments
- Only one confirmed payment for the Lekki stay via credit card.

---

### ⭐ Reviews
- Ada leaves a 5-star review on the Lekki apartment.

---

### 💬 Messages
- Ada messages Tunde about availability.

---

## 🔁 How to Use

To seed your PostgreSQL database:

```bash
psql -d your_database_name -f seed.sql
