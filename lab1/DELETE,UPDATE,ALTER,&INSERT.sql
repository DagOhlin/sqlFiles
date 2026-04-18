USE carRental;

-- There is a customer born in 1800 according to the records, this is obviously not possible so delete that customer.
DELETE FROM Customer 
WHERE YEAR(BirthDate) = 1800;

-- The Tesla X car that is available for renting needs to have its price increased by 200:-.
UPDATE Cars 
SET PricePerDay = PricePerDay + 200 
WHERE Brand = 'Tesla' AND Model = 'X';

-- All the Peugeot cars also needs to be increased in price, in this case by 20%.
UPDATE Cars 
SET PricePerDay = PricePerDay * 1.2
WHERE Brand = 'Peugeot';


-- Now we fast forward into the future and Sweden has changed its currency to Euros (€). Fix both the data itself (assume the conversion rate is 10SEK == 1 EUR) and the table so it can handle the new prices.
-- 4a. Fix the table to handle Euros (Decimals)
ALTER TABLE Cars 
MODIFY COLUMN PricePerDay DECIMAL(10, 2);

-- 4b. Convert the data (10 SEK = 1 EUR)
UPDATE Cars 
SET PricePerDay = PricePerDay / 10;

-- Can we construct a PK in the Bookings table without adding a new column? If yes, do that. If not, add another column that allows you to uniquely identify each booking.
-- 5a. Drop the flawed original Primary Key
ALTER TABLE Bookings DROP PRIMARY KEY;

-- 5b. Construct a new Primary Key without adding a column
ALTER TABLE Bookings ADD PRIMARY KEY (CarNumber, StartDate);