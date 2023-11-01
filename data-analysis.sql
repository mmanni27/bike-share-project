-- number of rides each group has

SELECT member_casual,
COUNT(*) AS member_casual_count
FROM `bike-share-case-study-mm.bike_data.combined_ride_data` 
GROUP BY member_casual;

-- type of bike used by each group

SELECT member_casual,
rideable_type,
COUNT(*) AS bike_type
FROM `bike-share-case-study-mm.bike_data.combined_ride_data` 
GROUP BY rideable_type, member_casual
ORDER BY member_casual;

-- average ride time, min and max ride times for each group

SELECT
DISTINCT member_casual,
AVG(ride_length) AS ride_length_avg,
MAX(ride_length) AS max_ride,
MIN(ride_length) AS min_ride,
FROM `bike-share-case-study-mm.bike_data.combined_ride_data` 
GROUP BY member_casual
ORDER BY member_casual;

-- average ride time by day of week and member type 

SELECT
DISTINCT member_casual,
day_of_week,
AVG(ride_length) AS ride_length_avg,
FROM `bike-share-case-study-mm.bike_data.combined_ride_data` 
GROUP BY member_casual, day_of_week
ORDER BY member_casual, (CASE WHEN day_of_week = 'Sunday' Then 1
WHEN day_of_week = 'Monday' Then 2
WHEN day_of_week = 'Tuesday' Then 3
WHEN day_of_week = 'Wednesday' Then 4
WHEN day_of_week = 'Thursday' Then 5
WHEN day_of_week = 'Friday' Then 6
ELSE 7
END);

-- time of day when people use bikes most grouped by member type, day of week and start time hour

SELECT COUNT(ride_id) AS ride_count,
day_of_week,
member_casual,
EXTRACT (hour FROM started_at) AS start_time
FROM `bike-share-case-study-mm.bike_data.combined_ride_data` 
GROUP BY day_of_week, member_casual, start_time
ORDER BY member_casual, (CASE WHEN day_of_week = 'Sunday' Then 1
WHEN day_of_week = 'Monday' Then 2
WHEN day_of_week = 'Tuesday' Then 3
WHEN day_of_week = 'Wednesday' Then 4
WHEN day_of_week = 'Thursday' Then 5
WHEN day_of_week = 'Friday' Then 6
ELSE 7
END), start_time;

-- number of rides by day of week by member type

SELECT DISTINCT day_of_week,
member_casual,
COUNT(ride_id) OVER (PARTITION BY day_of_week, member_casual) AS total_rides
FROM `bike-share-case-study-mm.bike_data.combined_ride_data` 
ORDER BY member_casual, (CASE WHEN day_of_week = 'Sunday' Then 1
WHEN day_of_week = 'Monday' Then 2
WHEN day_of_week = 'Tuesday' Then 3
WHEN day_of_week = 'Wednesday' Then 4
WHEN day_of_week = 'Thursday' Then 5
WHEN day_of_week = 'Friday' Then 6
ELSE 7
END);

-- rides per month, grouped by member type and month

SELECT 
COUNT(started_at) AS num_of_trips,
member_casual,
EXTRACT (MONTH FROM started_at) AS month_of_ride,
FROM `bike-share-case-study-mm.bike_data.combined_ride_data`
GROUP BY month_of_ride, member_casual
ORDER BY month_of_ride;


-- find most popular stations by each group
-- start station for casual riders

SELECT
start_station_name,
COUNT(start_station_id) AS start_location,
member_casual
FROM `bike-share-case-study-mm.bike_data.combined_ride_data`
WHERE member_casual = 'casual'
GROUP BY start_station_name, member_casual
ORDER BY start_location DESC
LIMIT 10;

-- start station for members

SELECT
start_station_name,
COUNT(start_station_id) AS start_location,
member_casual
FROM `bike-share-case-study-mm.bike_data.combined_ride_data`
WHERE member_casual = 'member'
GROUP BY start_station_name, member_casual
ORDER BY start_location DESC
LIMIT 10;

-- end station for casual riders

SELECT
end_station_name,
COUNT(end_station_id) AS end_location,
member_casual
FROM `bike-share-case-study-mm.bike_data.combined_ride_data`
WHERE member_casual = 'casual'
GROUP BY end_station_name, member_casual
ORDER BY end_location DESC
LIMIT 10;

-- end station for members

SELECT
end_station_name,
COUNT(end_station_id) AS end_location,
member_casual
FROM `bike-share-case-study-mm.bike_data.combined_ride_data`
WHERE member_casual = 'member'
GROUP BY end_station_name, member_casual
ORDER BY end_location DESC
LIMIT 10;
