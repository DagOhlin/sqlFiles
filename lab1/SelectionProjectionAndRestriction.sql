USE carRental;

-- Show all customers with all their information.
SELECT * FROM Customer;

-- Show all customers, but only with their name and birthdate.
SELECT Name, BirthDate FROM Customer;

-- Show all cars that cost more than 1000:- per day.
SELECT * FROM Cars WHERE PricePerDay > 1000;

-- Show all Volvo cars, only with their brand name and their model.
SELECT * FROM Cars WHERE Brand = 'Volvo';

-- Show all customers, only with their names, in a sorted fashion based on their name. Both in ascending and descending order.
SELECT Name FROM Customer ORDER BY Name ASC;
SELECT Name FROM Customer ORDER BY Name DESC;

-- Show all customers, only with their names, that were born in 1990 or later in a sorted fashion based on their birthdate.

SELECT Name
FROM Customer
WHERE YEAR(BirthDate) >= 1990
ORDER BY BirthDate ASC;

-- Show all cars that are red and cost less than 1500.
SELECT * FROM Cars WHERE Color = 'Red' AND PricePerDay < 1500;

-- Show all customers, only with their names, that were born between 1970-1990.
SELECT Name FROM Customer WHERE BirthDate BETWEEN '1970-01-01' AND '1990-01-01';


-- Show all bookings that are longer than 6 days.
SELECT * FROM Bookings 
WHERE DATEDIFF(EndDate, StartDate) > 6;

-- Show all bookings that overlap with the interval 2018-02-01 - 2018-02-25.
SELECT * FROM Bookings 
WHERE StartDate <= '2018-02-25' 
  AND EndDate >= '2018-02-01';

-- Show all customers whose first name starts with an O.
SELECT * FROM Customer 
WHERE Name LIKE 'O%'; -- % represents any charachers after