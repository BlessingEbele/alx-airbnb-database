# Entity-Relationship Diagram Requirements

This document describes the entities, attributes, and relationships used in the `alx-airbnb-database` project ER diagram.

---

## 📌 Entities and Attributes

### 1. **User**
- `id`: Unique identifier
- `email`: Email address
- `password`: Hashed password
- `first_name`: First name of the user
- `last_name`: Last name of the user
- `phone_number`: Contact number

---

### 2. **Property (Place)**
- `id`: Unique identifier
- `name`: Name of the place
- `description`: Description of the place
- `price_per_night`: Cost per night
- `max_guests`: Maximum number of guests
- `number_rooms`: Number of rooms
- `number_bathrooms`: Number of bathrooms
- `city_id`: Foreign key to City
- `user_id`: Foreign key to User (Host)

---

### 3. **Booking**
- `id`: Unique identifier
- `user_id`: Foreign key to User (Guest)
- `place_id`: Foreign key to Property
- `start_date`: Booking start date
- `end_date`: Booking end date

---

### 4. **Review**
- `id`: Unique identifier
- `user_id`: Foreign key to User
- `place_id`: Foreign key to Property
- `text`: Review content
- `created_at`: Timestamp of review

---

### 5. **Amenity**
- `id`: Unique identifier
- `name`: Name of the amenity (e.g., Wi-Fi, Pool)

---

### 6. **PlaceAmenity**
- `place_id`: Foreign key to Property
- `amenity_id`: Foreign key to Amenity

---

### 7. **City**
- `id`: Unique identifier
- `name`: Name of the city
- `state_id`: Foreign key to State

---

### 8. **State**
- `id`: Unique identifier
- `name`: Name of the state

---

## 🔗 Relationships

- A **User** can:
  - Host many **Properties**
  - Make many **Bookings**
  - Write many **Reviews**

- A **Property**:
  - Belongs to one **User**
  - Belongs to one **City**
  - Can have many **Bookings**
  - Can have many **Reviews**
  - Can have many **Amenities** (via `PlaceAmenity`)

- A **City** belongs to a **State**, and can have many **Properties**.

- A **Booking** belongs to a **User** and a **Property**.

- A **Review** belongs to a **User** and a **Property**.

- **PlaceAmenity** is a **join table** (Many-to-Many) between **Place** and **Amenity**.

---

## 📌 Notes

- All primary keys (`id`) are unique identifiers.
- All foreign key constraints must be enforced.
- Relationships should reflect real-world constraints and business logic.
- This ER model serves as the foundation for further normalization and SQL table creation.

