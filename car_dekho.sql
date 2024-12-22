-- Second_Hand_car_Dealer
SELECT 
    *
FROM
    cars.car_dekho;

use cars;

-- 1] Read cars Data.
SELECT 
    *
FROM
    car_dekho;

-- 2] Total cars : To get a count of total records.
SELECT 
    COUNT(*) AS Total_Cars
FROM
    car_dekho;

-- 3] The manager asked the employee How many cars will be available in 2023 ?
SELECT 
    COUNT(*) AS cars_in_2023
FROM
    car_dekho
WHERE
    year = 2023;

-- 4]  The manager asked the employee How many cars is available in 2020,2021,2022
SELECT 
    year, COUNT(*) AS cars_available
FROM
    car_dekho
WHERE
    year IN (2020 , 2021, 2022)
GROUP BY year
ORDER BY year;


-- 5] Client asked me to print the total of all cars by year,I don't see all the details.
SELECT 
    year, COUNT(*) AS Total_cars
FROM
    car_dekho
GROUP BY year
ORDER BY year;


-- 6]  Clint asked to car dealer,How many diesel cars will there be in 2020 ?
SELECT 
    year, COUNT(*) AS Diesel_cars_in_2020
FROM
    car_dekho
WHERE
    year = 2020 AND fuel = 'Diesel';


-- 7] Client requested a car dealer,How many Petrol cars will there be in 2020 ?
SELECT 
    year, COUNT(*) AS Petrol_cars_in_2020
FROM
    car_dekho
WHERE
    year = 2020 AND fuel = 'Petrol';

-- 8] The manager  told the employee to give a print all the fuel cars(Petrol,diesel and CNG) come by all year.
SELECT 
    year,
    COUNT(CASE
        WHEN fuel = 'Petrol' THEN 1
    END) AS pertrol,
    COUNT(CASE
        WHEN fuel = 'Diesel' THEN 1
    END) AS Diesel,
    COUNT(CASE
        WHEN fuel = 'CNG' THEN 1
    END) AS CNG
FROM
    car_dekho
WHERE
    fuel IN ('Petrol' , 'Diesel', 'CNG')
GROUP BY year;

-- 9] Manager said there were more then 100 cars in a given year,which year had more the 100 cars ?
SELECT 
    year, COUNT(*) AS more_then_100_cars
FROM
    car_dekho
GROUP BY year
HAVING COUNT(*) > 100
ORDER BY year;

-- 10] The Manager said to the employee All cars count details between 2015 TO 2023 with Complete list.
SELECT 
    *
FROM
    car_dekho
WHERE
    year BETWEEN 2015 AND 2023
ORDER BY year;

-- 11] What is the average selling price of cars for each fuel type?
SELECT 
    fuel, ROUND(AVG(selling_price), 2) AS avg_fuel_type
FROM
    car_dekho
GROUP BY fuel
ORDER BY avg_fuel_type DESC;

-- 12]  How many cars are sold by individual sellers vs dealers each year?
SELECT 
    year, seller_type, COUNT(*) AS car_count
FROM
    car_dekho
GROUP BY year , seller_type
ORDER BY year DESC , seller_type;
        
-- 13]  List all cars where the mileage is greater than 15 km/l and the selling price is less than 5,00,000.
SELECT 
    name, mileage, selling_price
FROM
    car_dekho
WHERE
    mileage > '15 kmpl'
        AND selling_price < 500000;
 
 -- 14]  Find the highest selling price car in each transmission type.
SELECT 
    transmission, MAX(selling_price) AS highest_selling_price
FROM
    car_dekho
GROUP BY transmission
ORDER BY highest_selling_price DESC;
 
 -- 15. Get the number of cars sold by each seller type.
SELECT 
    seller_type, COUNT(*) AS Total_car
FROM
    car_dekho
GROUP BY seller_type
ORDER BY Total_car DESC;

--  16 ] Find the car with the highest engine capacity and their respective selling prices.
SELECT 
    name, engine, selling_price
FROM
    car_dekho
WHERE
    engine = (SELECT 
            MAX(engine)
        FROM
            car_dekho);


-- 17] What is the total number of cars for each owner type (e.g., first owner, second owner)?
SELECT 
    owner, COUNT(*) AS total_cars
FROM
    car_dekho
GROUP BY owner
ORDER BY total_cars DESC;

-- 18]  Find the car with the highest torque value and display its details.
SELECT 
    *
FROM
    car_dekho
WHERE
    torque = (SELECT 
            MAX(torque)
        FROM
            car_dekho);


-- 19] List cars that have been driven more than 50,000 km and have a selling price 
-- of more than 10,00,000.
SELECT 
    name, km_drivencars
FROM
    car_dekho
WHERE
    km_driven > 500000
        AND selling_price > 10000;


-- 20] 9. Find the average mileage and engine capacity for each owner type.
SELECT 
    owner, AVG(mileage) AS mileage, AVG(engine) AS engine
FROM
    car_dekho
GROUP BY owner;

