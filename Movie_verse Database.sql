create database Movie_verse;
use Movie_verse ;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    country VARCHAR(50),
    subscription_type ENUM('Free', 'Standard', 'Premium')
);

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    genre VARCHAR(50),
    release_year YEAR,
    rating DECIMAL(3,1),
    duration INT
);

CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    plan_name VARCHAR(50),
    price DECIMAL(8,2),
    start_date DATE,
    end_date DATE
);

CREATE TABLE WatchHistory (
    watch_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    watch_date DATE,
    watch_time_minutes INT
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(8,2),
    payment_date DATE,
    method VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    review_text TEXT,
    stars INT,
    review_date DATE
);

-- part 2 insert values 

-- USERS
INSERT INTO Users (name, email, country, subscription_type)
VALUES
('Aarav Mehta', 'aarav@gmail.com', 'India', 'Premium'),
('Sophia Brown', 'sophia@gmail.com', 'UK', 'Standard'),
('Liam Smith', 'liam@gmail.com', 'Canada', 'Premium'),
('Emma Johnson', 'emma@yahoo.com', 'USA', 'Free'),
('Raj Patel', 'raj@gmail.com', 'India', 'Standard'),
('Olivia Davis', 'olivia@hotmail.com', 'Australia', 'Premium'),
('Noah Wilson', 'noah@gmail.com', 'USA', 'Standard'),
('Isabella Garcia', 'isabella@yahoo.com', 'Spain', 'Premium'),
('Ethan Martinez', 'ethan@gmail.com', 'Mexico', 'Free'),
('Mia Taylor', 'mia@outlook.com', 'UK', 'Standard'),
('Lucas Anderson', 'lucas@gmail.com', 'Canada', 'Premium'),
('Amelia Thomas', 'amelia@gmail.com', 'India', 'Standard'),
('Benjamin Lee', 'benjamin@gmail.com', 'USA', 'Premium'),
('Harper White', 'harper@gmail.com', 'Australia', 'Free'),
('Elijah Hall', 'elijah@yahoo.com', 'UK', 'Standard');

Select * from Users ;

-- MOVIES
INSERT INTO Movies (title, genre, release_year, rating, duration)
VALUES
('Inception', 'Action', 2010, 8.8, 148),
('Interstellar', 'Sci-Fi', 2014, 8.6, 169),
('The Dark Knight', 'Action', 2008, 9.0, 152),
('Parasite', 'Drama', 2019, 8.6, 132),
('Dune', 'Sci-Fi', 2021, 8.3, 155),
('Avengers: Endgame', 'Action', 2019, 8.5, 181),
('La La Land', 'Romance', 2016, 8.0, 128),
('Joker', 'Drama', 2019, 8.5, 122),
('Spider-Man: No Way Home', 'Action', 2021, 8.7, 148),
('Frozen II', 'Animation', 2019, 7.1, 103),
('The Batman', 'Action', 2022, 8.2, 176),
('Soul', 'Animation', 2020, 8.1, 100),
('Tenet', 'Sci-Fi', 2020, 7.8, 150),
('Oppenheimer', 'Drama', 2023, 8.9, 180),
('Inside Out', 'Animation', 2015, 8.1, 102);

select * from Movies ;

-- SUBSCRIPTIONS
INSERT INTO Subscriptions (user_id, plan_name, price, start_date, end_date)
VALUES
(1, 'Premium Plan', 999.00, '2025-01-01', '2026-01-01'),
(2, 'Standard Plan', 499.00, '2025-03-15', '2026-03-15'),
(3, 'Premium Plan', 999.00, '2025-02-10', '2026-02-10'),
(4, 'Free Plan', 0.00, '2025-04-01', '2026-04-01'),
(5, 'Standard Plan', 499.00, '2025-01-20', '2026-01-20'),
(6, 'Premium Plan', 999.00, '2025-02-05', '2026-02-05'),
(7, 'Standard Plan', 499.00, '2025-03-01', '2026-03-01'),
(8, 'Premium Plan', 999.00, '2025-01-10', '2026-01-10'),
(9, 'Free Plan', 0.00, '2025-05-01', '2026-05-01'),
(10, 'Standard Plan', 499.00, '2025-02-15', '2026-02-15'),
(11, 'Premium Plan', 999.00, '2025-03-20', '2026-03-20'),
(12, 'Standard Plan', 499.00, '2025-01-25', '2026-01-25'),
(13, 'Premium Plan', 999.00, '2025-04-05', '2026-04-05'),
(14, 'Free Plan', 0.00, '2025-05-10', '2026-05-10'),
(15, 'Standard Plan', 499.00, '2025-03-30', '2026-03-30');

select * from Subscriptions; 

-- PAYMENTS
INSERT INTOWatchHistory  (user_id, amount, payment_date, method, status)
VALUES
(1, 999.00, '2025-01-01', 'Credit Card', 'Success'),
(2, 499.00, '2025-03-15', 'PayPal', 'Success'),
(3, 999.00, '2025-02-10', 'Credit Card', 'Success'),
(5, 499.00, '2025-01-20', 'Debit Card', 'Success'),
(6, 999.00, '2025-02-05', 'Credit Card', 'Success'),
(7, 499.00, '2025-03-01', 'UPI', 'Pending'),
(8, 999.00, '2025-01-10', 'Credit Card', 'Success'),
(10, 499.00, '2025-02-15', 'Debit Card', 'Success'),
(11, 999.00, '2025-03-20', 'Credit Card', 'Success'),
(12, 499.00, '2025-01-25', 'PayPal', 'Success'),
(13, 999.00, '2025-04-05', 'UPI', 'Success'),
(14, 0.00, '2025-05-10', 'Free', 'Active'),
(15, 499.00, '2025-03-30', 'Credit Card', 'Pending');


select * from WatchHistory ;


-- WATCH HISTORY
INSERT INTO WatchHistory (user_id, movie_id, watch_date, watch_time_minutes)
VALUES
(1, 1, '2025-02-01', 120),
(1, 2, '2025-02-05', 169),
(2, 3, '2025-03-16', 140),
(3, 5, '2025-04-10', 150),
(4, 4, '2025-05-02', 90),
(5, 6, '2025-01-25', 160),
(6, 7, '2025-02-10', 128),
(7, 8, '2025-03-05', 100),
(8, 9, '2025-04-01', 145),
(9, 10, '2025-05-03', 80),
(10, 11, '2025-02-20', 170),
(11, 12, '2025-03-15', 95),
(12, 13, '2025-04-18', 140),
(13, 14, '2025-05-05', 175),
(15, 15, '2025-03-30', 90);

Select * from WatchHistory ;

-- REVIEWS
INSERT INTO Reviews (user_id, movie_id, review_text, stars, review_date)
VALUES
(1, 1, 'Mind-bending masterpiece!', 9, '2025-02-02'),
(1, 2, 'Visually stunning and emotional.', 8, '2025-02-06'),
(2, 3, 'Best superhero movie ever.', 10, '2025-03-17'),
(3, 5, 'Epic visuals but slow pacing.', 7, '2025-04-11'),
(4, 4, 'Incredible storytelling.', 9, '2025-05-03'),
(5, 6, 'Perfect end to an era.', 8, '2025-01-26'),
(6, 7, 'Loved the music and emotion.', 9, '2025-02-11'),
(7, 8, 'Disturbing yet powerful.', 9, '2025-03-06'),
(8, 9, 'Best Spider-Man ever!', 10, '2025-04-02'),
(9, 10, 'Good for kids.', 7, '2025-05-04'),
(10, 11, 'Dark and gritty.', 8, '2025-02-21'),
(11, 12, 'Heartwarming and thoughtful.', 9, '2025-03-16'),
(12, 13, 'Confusing but brilliant.', 8, '2025-04-19'),
(13, 14, 'Cinematic masterpiece.', 10, '2025-05-06'),
(15, 15, 'Emotional and creative.', 9, '2025-03-31');

select * from Reviews;

-- PART 2: BASIC CRUD OPERATIONS

-- (a) Retrieve all users
SELECT * FROM Users;

-- (b) Retrieve all movies

SELECT * FROM Movies;

-- (c) Update the rating of a movie

update movies set rating = 9.6 
where movie_id = 1;


select * from movies;

-- (d) Delete a user who canceled their subscription (example: Free user)

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Users
WHERE subscription_type = 'Free';

-- (e) Retrieve all details of movies released after 2020

SELECT *
FROM Movies
WHERE release_year >=2020;

-- PART 3: FILTERING AND SEARCHING

-- (a) List all users with “Premium” subscriptions

SELECT *
FROM Users
WHERE subscription_type = 'Premium';


-- (b) Show all movies in the “Action” or “Drama” genre

SELECT *
FROM Movies
WHERE genre IN ('Action', 'Drama');


-- (c) Display movies with a rating above 8.0

SELECT *
FROM Movies
WHERE rating > 8.0;

-- (d) Find users who watched more than 2 movies

select * from WatchHistory;
SELECT user_id, COUNT(movie_id) AS total_movies_watched
FROM WatchHistory
GROUP BY user_id
HAVING COUNT(movie_id) >=2;

-- (e) Retrieve payments made through the “Credit Card” method

SELECT *
FROM Payments
WHERE method = 'Credit Card';

-- PART 4: AGGREGATIONS

-- (a) Count how many users are subscribed to each plan

select * from subscriptions;
SELECT subscription_type, COUNT(*) AS total_users
FROM Users
GROUP BY subscription_type;

-- (b) Find the average movie rating per genre

SELECT genre, AVG(rating) AS avg_rating
FROM Movies
GROUP BY genre;


-- (c) Find the total revenue earned from subscriptions

SELECT SUM(price) AS total_revenue
FROM Subscriptions;


-- (d) Find the total watch time per user

SELECT user_id, SUM(watch_time_minutes) AS total_watch_time
FROM WatchHistory
GROUP BY user_id;


-- PART 5: JOINS

-- (a) List all users and the movies they have watched

select * from Users;
select * from movies;
select * from watchhistory;


SELECT u.user_id, u.name, m.title, w.watch_date, w.watch_time_minutes
FROM Users u
JOIN WatchHistory w
	ON u.user_id = w.user_id
JOIN Movies m
	ON w.movie_id = m.movie_id
ORDER BY u.user_id
;


-- (b) Show payment details along with user names and plan names

select * from users;

SELECT u.name, p.amount, p.method, p.status, s.plan_name
FROM Users u
JOIN Payments p ON u.user_id = p.user_id
JOIN Subscriptions s ON u.user_id = s.user_id
ORDER BY u.name;
 

-- (c) Display all movies along with their reviews and reviewer names

select * from movies;

select * from reviews;

SELECT m.title, r.stars, r.review_text, u.name AS reviewer_name, r.review_date
FROM Movies m
JOIN Reviews r ON m.movie_id = r.movie_id
JOIN Users u ON r.user_id = u.user_id
ORDER BY m.title;


-- (d) List users and their total time spent watching movies

SELECT u.name, SUM(w.watch_time_minutes) AS total_watch_time
FROM Users u
JOIN WatchHistory w
	ON u.user_id = w.user_id
GROUP BY u.name
ORDER BY total_watch_time ;


-- PART 6: SUBQUERIES

-- (a) Find movies with a rating higher than the average rating

SELECT *
FROM Movies
WHERE rating >
(SELECT AVG (rating)
 FROM Movies);


-- (b) Find users who have spent more than ₹800 on subscriptions

select * from subscriptions;

 


-- (c) Find movies that no one has reviewed

UPDATE Movies
SET rating = 0.0
WHERE movie_id = 15;
select * from movies;

SELECT *
FROM Movies
WHERE IN 
(SELECT rating=0.0 
FROM reviews);


-- (d) Find the most-watched movie by total watch time

SELECT m.movie_id, m.title, SUM(w.watch_time_minutes) AS total_time
FROM Movies m
JOIN WatchHistory w
	ON m.movie_id = w.movie_id
GROUP BY m.movie_id, m.title
ORDER BY total_time DESC
LIMIT 1
;


-- PART 7: UNION

-- (a) Combine movie titles and genre  names into a single column called MovieData

SELECT title AS MovieData FROM Movies
UNION
SELECT genre FROM Movies;


-- (b) Combine all user_id values from Subscriptions and Payments tables

SELECT user_id FROM Subscriptions
UNION
SELECT user_id FROM Payments;


-- PART 8: CASE EXPRESSIONS

-- (a) Categorize movies by rating
select * from movies;

SELECT title, rating,
CASE
    WHEN rating <= 5 THEN 'Below Average'
    WHEN rating BETWEEN 5.1 AND 8 THEN 'Good'
    WHEN rating > 8 THEN 'Excellent'
    
END AS RatingCategory
FROM Movies
ORDER BY rating DESC;


-- (b) Categorize users by subscription type
SELECT name, subscription_type,
CASE
    WHEN subscription_type = 'Free' THEN 'Limited Access'
    WHEN subscription_type = 'Standard' THEN 'Full Access'
    WHEN subscription_type = 'Premium' THEN 'All Access + HD'
END AS AccessLevel
FROM Users
ORDER BY name;


-- (c) Classify users based on total watch time
SELECT w.user_id, SUM(w.watch_time_minutes) AS total_time,
CASE
    WHEN SUM(w.watch_time_minutes) < 100 THEN 'Light Viewer'
    WHEN SUM(w.watch_time_minutes) BETWEEN 100 AND 500 THEN 'Regular Viewer'
    ELSE 'Binge Watcher'
END AS ViewerCategory
FROM WatchHistory w
GROUP BY w.user_id
ORDER BY total_time DESC;


-- PART 9: STRING FUNCTIONS


-- (a) Display all movie titles in uppercase

SELECT UPPER(title) AS Movie_Title_Upper
FROM Movies;


-- (b) Extract the first 4 letters of each user’s name

SELECT name, LEFT(name, 4) AS ShortName
FROM Users;


-- (c) Concatenate user name and subscription type

SELECT CONCAT(name, ' - ', subscription_type) AS UserDetails
FROM Users;


-- (d) Find all users whose email IDs contain 'gmail'

SELECT *
FROM Users
WHERE email LIKE '%gmail%';



-- PART 10: WINDOW FUNCTIONS

-- (a) Rank movies based on their ratings

select * from movies;

SELECT title, genre, rating,
RANK()
OVER
(ORDER BY rating DESC) AS RankByRating
FROM Movies;


-- (b) Use ROW_NUMBER() to list each user’s watched movies in order

select * from movies;

SELECT user_id, movie_id, watch_date,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY watch_date) AS MovieOrder
FROM WatchHistory
ORDER BY user_id, MovieOrder;

 
-- (c) Use SUM() OVER (PARTITION BY user_id) to calculate total watch time

select * from movies;

SELECT user_id, movie_id, watch_time_minutes,
SUM(watch_time_minutes) OVER (PARTITION BY user_id) AS TotalUserWatchTime
FROM WatchHistory;


-- (d) Find top 3 most-watched movies using RANK

SELECT m.title, SUM(w.watch_time_minutes) AS total_watch_time,
RANK() OVER (ORDER BY SUM(w.watch_time_minutes) DESC) AS RankByWatch
FROM WatchHistory w
JOIN Movies m ON w.movie_id = m.movie_id
GROUP BY m.title
ORDER BY RankByWatch
LIMIT 3;


-- PART 11: TEMPORARY TABLES & CTEs

-- (a) Temporary table for movies watched in the last 30 days
select * from movies;

-- (a) Temporary table for movies watched in the last 30 days

CREATE TEMPORARY TABLE recent_movies AS
SELECT *
FROM movies
WHERE release_year>=2025 ;





-- (b) CTE: Average movie duration per genre, showing only above-average genres
select * from movies;

WITH GenreAverage AS (
    SELECT genre, AVG(duration) AS avg_duration
    FROM Movies
    GROUP BY genre
)
SELECT *
FROM GenreAverage
WHERE avg_duration > (SELECT AVG(avg_duration) FROM GenreAverage);


-- (c) CTE: Find top 5 users based on total payments made 
WITH UserPayments AS (
    SELECT user_id, SUM(amount) AS total_payment
    FROM Payments
    GROUP BY user_id
)
SELECT user_id, total_payment
FROM UserPayments
ORDER BY total_payment DESC
LIMIT 5;


-- (d) Temporary table combining Users and Subscriptions

select * from users;

select * from subscriptions;

CREATE TEMPORARY TABLE UserSubscriptions AS
SELECT u.user_id, u.name, u.subscription_type, s.plan_name, s.price, s.start_date, s.end_date
FROM Users u
JOIN Subscriptions s ON u.user_id = s.user_id;

SELECT * FROM UserSubscriptions;


-- (e) Multiple CTEs to identify highly active Premium users
WITH UserActivity AS (
    SELECT user_id, SUM(watch_time_minutes) AS total_watch
    FROM WatchHistory
    GROUP BY user_id
),
PremiumUsers AS (
    SELECT user_id, name FROM Users WHERE subscription_type = 'Premium'
)
SELECT p.user_id, p.name, ua.total_watch
FROM PremiumUsers p
JOIN UserActivity ua ON p.user_id = ua.user_id
WHERE ua.total_watch > 100
ORDER BY ua.total_watch DESC;



-- PART 12: ADVANCED CHALLENGES

CREATE TEMPORARY TABLE RecentMovies AS 
SELECT * FROM WatchHistory 
WHERE watch_date >= CURDATE() - INTERVAL 30 DAY; 

select * from RecentMovies;

select * from movies;
SELECT movie_id , COUNT(*) AS views 
FROM RecentMovies 
GROUP BY movie_id;


WITH AvgGenre AS
 ( 
SELECT genre, AVG(watch_time_minutes) AS avg_time 
FROM WatchHistory w 
JOIN Movies m ON w.movie_id = m.movie_id 
GROUP BY genre 
) 
SELECT * FROM AvgGenre WHERE avg_time > 120; 


CREATE VIEW MovieReviews AS 
SELECT u.name AS user, m.title AS movie, r.stars, r.review_text 
FROM Reviews r 
JOIN Users u 
	ON r.user_id = u.user_id 
JOIN Movies m
	ON r.movie_id = m.movie_id;

