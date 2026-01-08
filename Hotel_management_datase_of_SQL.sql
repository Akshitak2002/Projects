
-- Hotel Management System Database
CREATE DATABASE IF NOT EXISTS hotel_management;
USE hotel_management;


-- Part 1: Table Creation


CREATE TABLE Guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number INT,
    type VARCHAR(50),
    price DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    checkin_date DATE,
    checkout_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


-- Part 2: Insert Sample Data


INSERT INTO Guests (name, phone, email) VALUES
('Amit Sharma', '9876543210', 'amit@gmail.com'),
('Riya Singh', '9876543211', 'riya@gmail.com'),
('Rahul Verma', '9876543212', 'rahul@gmail.com');

INSERT INTO Rooms (room_number, type, price, status) VALUES
(101, 'Standard', 1500, 'Available'),
(102, 'Deluxe', 2500, 'Occupied'),
(103, 'Suite', 4000, 'Available');

INSERT INTO Bookings (guest_id, room_id, checkin_date, checkout_date, total_amount) VALUES
(1, 2, '2024-01-05', '2024-01-10', 12500),
(2, 1, '2024-02-01', '2024-02-03', 3000);

INSERT INTO Payments (booking_id, amount_paid, payment_date, method) VALUES
(1, 12500, '2024-01-10', 'Card');


-- Update Room Status


UPDATE Rooms
SET status = 'Occupied'
WHERE room_id = 2;


-- Delete a Guest


DELETE FROM Guests
WHERE guest_id = 3;


-- Part 3: Filtering & Searching


SELECT * FROM Guests
WHERE guest_id IN (
    SELECT guest_id FROM Bookings WHERE checkin_date > '2024-01-01'
);

SELECT * FROM Rooms
WHERE status = 'Available';

SELECT * FROM Rooms
WHERE type = 'Deluxe' AND price < 3000;

SELECT g.name
FROM Guests g
JOIN Bookings b ON g.guest_id = b.guest_id
LEFT JOIN Payments p ON b.booking_id = p.booking_id
WHERE p.payment_id IS NULL;


-- Part 4: Aggregations

SELECT COUNT(*) AS occupied_rooms
FROM Rooms
WHERE status = 'Occupied';

SELECT SUM(amount_paid) AS total_revenue
FROM Payments;

SELECT AVG(DATEDIFF(checkout_date, checkin_date)) AS avg_stay_duration
FROM Bookings;

SELECT type, COUNT(*) AS total_rooms
FROM Rooms
GROUP BY type;


-- Part 5: Joins

SELECT g.name, r.room_number
FROM Guests g
JOIN Bookings b ON g.guest_id = b.guest_id
JOIN Rooms r ON b.room_id = r.room_id;

SELECT g.name, r.type, b.total_amount
FROM Bookings b
JOIN Guests g ON b.guest_id = g.guest_id
JOIN Rooms r ON b.room_id = r.room_id;

SELECT g.name, p.amount_paid, p.method
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
JOIN Guests g ON b.guest_id = g.guest_id;


-- Part 6: Subqueries


SELECT name FROM Guests
WHERE guest_id IN (
    SELECT guest_id FROM Bookings
    WHERE DATEDIFF(checkout_date, checkin_date) > 5
);

SELECT * FROM Rooms
WHERE room_id NOT IN (
    SELECT room_id FROM Bookings
);

SELECT name FROM Guests
WHERE guest_id = (
    SELECT b.guest_id
    FROM Payments p
    JOIN Bookings b ON p.booking_id = b.booking_id
    ORDER BY p.amount_paid DESC
    LIMIT 1
);




