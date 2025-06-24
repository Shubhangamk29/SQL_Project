use cars_info;
--- To read Data ---
SELECT * FROM car_info;

--- 1. Calculate the average selling price for cars with a manual transmission and owned by the first owner, for each fuel type. ---
SELECT fuel, AVG(selling_price) AS avg_selling_price
FROM car_info
WHERE transmission = 'Manual' AND owner = 'First Owner'
GROUP BY fuel;

--- 2. Find the top 3 car models with the highest average mileage, considering only cars with more than 5 seats.---
SELECT Name, AVG(mileage) AS avg_mileage
FROM car_info
WHERE seats > 5
GROUP BY Name
ORDER BY avg_mileage DESC
LIMIT 3;

--- 3. Identify the car models where the difference between the maximum and minimum selling prices is greater than $10,000. ---
SELECT Name
FROM car_info
GROUP BY Name
HAVING MAX(selling_price) - MIN(selling_price) > 10000;


--- 4. Retrieve the names of cars with a selling price above the overall average selling price and a mileage below the overall average mileage. ---
SELECT Name
FROM car_info
WHERE selling_price > (SELECT AVG(selling_price) FROM car_info)
    AND mileage < (SELECT AVG(mileage) FROM car_info);

--- 5. Calculate the cumulative sum of the selling prices over the years for each car model. ---
SELECT Name, year, selling_price, 
       SUM(selling_price) OVER (PARTITION BY Name ORDER BY year) AS cumulative_sum
FROM car_info;

--- 6. Identify the car models that have a selling price within 10% of the average selling price. ---
SELECT Name, selling_price
FROM car_info
WHERE selling_price BETWEEN (SELECT AVG(selling_price) * 0.9 FROM car_info) AND (SELECT AVG(selling_price) * 1.1 FROM car_info);

--- 7. Calculate the exponential moving average (EMA) of the selling prices for each car model, considering a smoothing factor of 0.2. ---
SELECT Name, year, selling_price,
       AVG(selling_price) OVER (PARTITION BY Name ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ema_selling_price
FROM car_info;



