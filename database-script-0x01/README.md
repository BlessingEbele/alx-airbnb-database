# 📂 Airbnb Database Schema (DDL)

This directory contains the SQL schema for the Airbnb-like relational database system.

---

## 📘 File: `schema.sql`

This script defines the database structure using `CREATE TABLE` statements. It includes:

- ✅ Primary keys with UUIDs
- ✅ Foreign key constraints
- ✅ ENUM constraints using `CHECK`
- ✅ Indexes for performance optimization
- ✅ Timestamps for record tracking

---

## ✅ Tables

1. **users**: Stores user details including role (guest, host, admin)
2. **properties**: Listings posted by hosts
3. **bookings**: Reservations made by guests
4. **payments**: Payment records linked to bookings
5. **reviews**: User-submitted property reviews
6. **messages**: Communication between users

---

## 💡 Notable Features

- Uses **UUIDs** as primary keys with `uuid_generate_v4()`
- Enforces business rules through `CHECK` constraints (e.g., rating between 1 and 5)
- **Indexes** on frequently queried fields (`email`, `property_id`, `booking_id`)
- Designed to follow **3NF normalization**

---

## 🧪 Usage

To execute this script in PostgreSQL:

```bash
psql -d your_database_name -f schema.sql
