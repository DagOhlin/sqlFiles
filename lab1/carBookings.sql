CREATE DATABASE IF NOT EXISTS carRental;


USE carRental;

CREATE TABLE IF NOT EXISTS Cars (
  CarNumber int PRIMARY KEY NOT NULL,
  Brand varchar(255) NOT NULL,
  Model varchar(255),
  Color varchar(255),
  PricePerDay varchar(255)
);



CREATE TABLE IF NOT EXISTS Customer (
  CustomerNumber int PRIMARY KEY NOT NULL,
  Name varchar(255),
  BirthDate varchar(255)
);

CREATE TABLE IF NOT EXISTS Bookings (
  CarNumber int NOT NULL,
  CustomerNumber int NOT NULL,
  StartDate DATE,
  EndDate DATE,
  PRIMARY KEY (CarNumber, CustomerNumber),
FOREIGN KEY(CustomerNumber) REFERENCES Customer(CustomerNumber),
FOREIGN KEY(CarNumber) REFERENCES Cars(CarNumber)
);


SHOW DATABASES;
