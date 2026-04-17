-- 1. Cartesian product (Cars and Bookings)
SELECT * FROM Cars, Bookings;

-- 2. Cartesian product (Customer and Bookings)
SELECT * FROM Customer, Bookings;

-- 3. Converting to Inner Joins
SELECT * FROM Cars 
INNER JOIN Bookings ON Cars.CarNumber = Bookings.CarNumber;

SELECT * FROM Customer 
INNER JOIN Bookings ON Customer.CustomerNumber = Bookings.CustomerNumber;

-- 4. Names of customers who made a booking
SELECT Customer.Name 
FROM Customer 
INNER JOIN Bookings ON Customer.CustomerNumber = Bookings.CustomerNumber;

-- 5. Same as above, without duplicates
SELECT DISTINCT Customer.Name 
FROM Customer 
INNER JOIN Bookings ON Customer.CustomerNumber = Bookings.CustomerNumber;

-- 6. All Volkswagen cars booked at least once
SELECT DISTINCT Cars.* FROM Cars 
INNER JOIN Bookings ON Cars.CarNumber = Bookings.CarNumber 
WHERE Cars.Brand = 'Volkswagen';

-- 7. All customers that have rented a Volkswagen
-- (This requires joining all three tables!)
SELECT DISTINCT Customer.Name 
FROM Customer
JOIN Bookings ON Customer.CustomerNumber = Bookings.CustomerNumber
JOIN Cars ON Bookings.CarNumber = Cars.CarNumber
WHERE Cars.Brand = 'Volkswagen';

-- 8. All cars that have been booked at least once
SELECT DISTINCT Cars.* FROM Cars 
INNER JOIN Bookings ON Cars.CarNumber = Bookings.CarNumber;

-- 9. All cars that have NEVER been booked
-- (We use LEFT JOIN and look for NULLs where the booking should be)
SELECT Cars.* FROM Cars 
LEFT JOIN Bookings ON Cars.CarNumber = Bookings.CarNumber 
WHERE Bookings.CarNumber IS NULL;

-- 10. All black cars booked at least once
SELECT DISTINCT Cars.* FROM Cars 
INNER JOIN Bookings ON Cars.CarNumber = Bookings.CarNumber 
WHERE Cars.Color = 'Black';