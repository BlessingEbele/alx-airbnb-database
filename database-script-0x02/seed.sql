-- Airbnb Sample Data Seeder
-- File: seed.sql

-- ----------------------------------
-- USERS
-- ----------------------------------
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (uuid_generate_v4(), 'Ada', 'Eze', 'ada@example.com', 'hashed_pw_1', '08031234567', 'guest'),
  (uuid_generate_v4(), 'Tunde', 'Balogun', 'tunde@example.com', 'hashed_pw_2', '08027894567', 'host'),
  (uuid_generate_v4(), 'Chidi', 'Okafor', 'chidi@example.com', 'hashed_pw_3', '08066543210', 'admin');

-- ----------------------------------
-- PROPERTIES
-- ----------------------------------
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
SELECT uuid_generate_v4(), user_id, 'Lekki Seaside Apartment', 'A cozy apartment near the beach', 'Lekki, Lagos', 35000.00
FROM users WHERE email = 'tunde@example.com'
UNION ALL
SELECT uuid_generate_v4(), user_id, 'Abuja City Villa', 'Spacious villa in central Abuja', 'Garki, Abuja', 50000.00
FROM users WHERE email = 'tunde@example.com';

-- ----------------------------------
-- BOOKINGS
-- ----------------------------------
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT uuid_generate_v4(), p.property_id, u.user_id, '2025-07-01', '2025-07-05', 140000.00, 'confirmed'
FROM users u, properties p
WHERE u.email = 'ada@example.com' AND p.name = 'Lekki Seaside Apartment'
UNION ALL
SELECT uuid_generate_v4(), p.property_id, u.user_id, '2025-07-10', '2025-07-12', 100000.00, 'pending'
FROM users u, properties p
WHERE u.email = 'ada@example.com' AND p.name = 'Abuja City Villa';

-- ----------------------------------
-- PAYMENTS
-- ----------------------------------
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
SELECT uuid_generate_v4(), b.booking_id, b.total_price, 'credit_card'
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE p.name = 'Lekki Seaside Apartment';

-- ----------------------------------
-- REVIEWS
-- ----------------------------------
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
SELECT uuid_generate_v4(), p.property_id, u.user_id, 5, 'Amazing stay! Very clean and close to the beach.'
FROM properties p, users u
WHERE p.name = 'Lekki Seaside Apartment' AND u.email = 'ada@example.com';

-- ----------------------------------
-- MESSAGES
-- ----------------------------------
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
SELECT uuid_generate_v4(), guest.user_id, host.user_id, 'Hi, is the Lekki apartment available for next weekend?'
FROM users guest, users host
WHERE guest.email = 'ada@example.com' AND host.email = 'tunde@example.com';
