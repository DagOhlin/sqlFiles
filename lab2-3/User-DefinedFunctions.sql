USE carRental;

-- Create a function that checks if a car is available for renting between two dates. The input to the function should be the starting and ending dates of the rental, the cars number, and it should return 0 if it is not available and 1 if it is available between the two dates.
DELIMITER %%
CREATE FUNCTION CheckCarAvailability(car_id INT, end_d DATE ,start_d DATE)
RETURNS INT
DETERMiNISTIC
BEGIN
DECLARE booking_count INT;
SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE CarNumber = car_id
      AND StartDate <= end_d    
      AND EndDate >= start_d;

IF booking_count = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END; %%
DELIMITER ;

SELECT CheckCarAvailability(1, '2026-05-05', '2026-05-01') AS IsAvailable;
SELECT * FROM Cars;

DROP FUNCTION IF EXISTS SumOfDaysBooked;
-- Create a function that sums the total amount of days cars have been booked and returns the sum.
DELIMITER %%
CREATE FUNCTION SumOfDaysBooked()
RETURNS INT
DETERMINISTIC
BEGIN

DECLARE Total_Days INT;

SELECT SUM(DATEDIFF(EndDate, StartDate)) INTO Total_Days FROM Bookings;

RETURN Total_Days;

END %%

DELIMITER ;

SELECT SumOfDaysBooked() AS allDaysCounted;

-- Extend the previous function so that if there is an input parameter that matches a cars unique number, then it should only return the sum of that car. If the number doesn't match or it is -1, it returns the total sum as before.