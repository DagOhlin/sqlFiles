USE carRental;

-- 1. Try to drop the table Cars (This will fail!)
DROP TABLE Cars;

-- 2. The Fix: We must drop the table that depends on it first
DROP TABLE Bookings;
DROP TABLE Cars;

-- 3. Delete all the rows of table Customers
-- (Remember, your table is named Customer, singular)
DELETE FROM Customer;