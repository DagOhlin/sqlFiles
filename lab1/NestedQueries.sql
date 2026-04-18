USE carRental;

-- Show all the cars that cost more than the average.
SELECT * FROM Cars WHERE PricePerDay > (SELECT AVG(PricePerDay) FROM Cars);

-- Show the car with the lowest cost with black color.
SELECT * FROM Cars WHERE Color = 'Black' AND PricePerDay = (SELECT MIN(PricePerDay) FROM Cars WHERE Color = 'Black');

-- Show the car which has the lowest cost.
SELECT * FROM Cars WHERE PricePerDay = (SELECT MIN(PricePerDay) FROM Cars);


-- Show all the black cars that has been booked at least once by using a sub query.
SELECT * FROM Cars WHERE Color = 'Black' AND Cars.CarNumber IN (SELECT CarNumber FROM Bookings);