-- check for duplicates in ride_id, started_at and ended_at
-- no duplicates found

SELECT
  ride_id,
  started_at,
  ended_at,
  COUNT(*)
FROM
  `bike-share-case-study-mm.bike_data.bike_data_2022_10`
GROUP BY
  ride_id,
  started_at,
  ended_at
HAVING
  COUNT(*) > 1;

-- select null values in data

SELECT
  *
FROM
  `bike-share-case-study-mm.bike_data.bike_data_2022_10`
WHERE
  rideable_type IS NULL
  OR ride_id IS NULL
  OR member_casual IS NULL
  OR start_station_id IS NULL
  OR start_station_name IS NULL
  OR end_station_id IS NULL
  OR end_station_name IS NULL
  OR started_at IS NULL
  OR ended_at IS NULL
  OR start_lat IS NULL
  OR start_lng IS NULL
  OR end_lat IS NULL
  OR end_lng IS NULL;

-- delete null values in data

delete
FROM
  `bike-share-case-study-mm.bike_data.bike_data_2022_10`
WHERE
  rideable_type IS NULL
  OR ride_id IS NULL
  OR member_casual IS NULL
  OR start_station_id IS NULL
  OR start_station_name IS NULL
  OR end_station_id IS NULL
  OR end_station_name IS NULL
  OR started_at IS NULL
  OR ended_at IS NULL
  OR start_lat IS NULL
  OR start_lng IS NULL
  OR end_lat IS NULL
  OR end_lng IS NULL;

-- quality checks
-- check for misspellings or discrepencies in rideable_type and member_casual
-- no issues found

  SELECT DISTINCT rideable_type
  FROM `bike-share-case-study-mm.bike_data.bike_data_2022_10`;

  SELECT DISTINCT member_casual
  FROM `bike-share-case-study-mm.bike_data.bike_data_2022_10`;

-- check for ride time issues such as negative or zero ride time

SELECT *
FROM `bike-share-case-study-mm.bike_data.bike_data_2022_10`
WHERE started_at >= ended_at;

-- delete rows with ride time issues

DELETE
FROM `bike-share-case-study-mm.bike_data.bike_data_2022_10`
WHERE started_at >= ended_at;

-- create new table for cleaned data
-- added in columns: ride_length and day_of_week
-- ride_length = timestamp_diff between ended_at and started_at in seconds
-- day_of_week = CASE statement extracting day of week from started_at and renaming to days of the week

CREATE VIEW `bike-share-case-study-mm.bike_data.cleaned_2022_10` AS
SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_casual,
TIMESTAMP_DIFF(ended_at, started_at, second) AS ride_length,
CASE EXTRACT(DAYOFWEEK FROM started_at)
WHEN 1 then 'Sunday'
WHEN 2 then 'Monday'
WHEN 3 then 'Tuesday'
WHEN 4 then 'Wednesday'
WHEN 5 then 'Thursday'
WHEN 6 then 'Friday'
WHEN 7 then 'Saturday'
END AS day_of_week,
FROM `bike-share-case-study-mm.bike_data.bike_data_2022_10`;

SELECT * 
FROM `bike-share-case-study-mm.bike_data.cleaned_2022_10`
