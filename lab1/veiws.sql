USE carRental;

-- 1. Create a view, that shows all the information about black cars.
CREATE OR REPLACE VIEW BlackCars AS 
SELECT * FROM Cars 
WHERE Color = 'Black';

-- 2. Create a view that shows all information about black cars and the addition of the weekly price as a column.
CREATE OR REPLACE VIEW BlackCarsWeekly AS 
SELECT Cars.*, (PricePerDay * 7) AS WeeklyPrice 
FROM Cars 
WHERE Color = 'Black';

-- 3. Try and insert a car into both views created. What happens? Why? What's the difference between the views?
-- THIS WILL SUCCEED: The view is a direct 1-to-1 mirror of the underlying table.
INSERT INTO BlackCars (CarNumber, Brand, Model, Color, PricePerDay) 
VALUES (999, 'Ford', 'Focus', 'Black', 300);

-- THIS WILL FAIL: You will get an error because the view contains a calculated/math column (WeeklyPrice).
-- The database doesn't know how to reverse-engineer that math into the base table, making it a "Read-Only" view.
INSERT INTO BlackCarsWeekly (CarNumber, Brand, Model, Color, PricePerDay, WeeklyPrice) 
VALUES (888, 'Honda', 'Civic', 'Black', 200, 1400);

-- 4. Create a view that shows all the cars available for booking at this current time.
CREATE OR REPLACE VIEW AvailableCars AS 
SELECT * FROM Cars 
WHERE CarNumber NOT IN (
    SELECT CarNumber FROM Bookings 
    WHERE StartDate <= CURDATE() AND EndDate >= CURDATE()
);

-- 5. Alter the previous view, with the condition that the cars have to be available for at least 3 days of renting.
ALTER VIEW AvailableCars AS 
SELECT * FROM Cars 
WHERE CarNumber NOT IN (
    SELECT CarNumber FROM Bookings 
    -- Checks if any booking overlaps with a window from today until 3 days from now.
    WHERE StartDate <= DATE_ADD(CURDATE(), INTERVAL 3 DAY) 
      AND EndDate >= CURDATE()
);