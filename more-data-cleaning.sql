-- another quality check for invalid lat or long
-- 11 rows with end_lat = 0

SELECT *
FROM
  `bike-share-case-study-mm.bike_data.combined_ride_data`
WHERE
  start_station_id = '0'
  OR end_station_id = '0'
  OR start_lat = 0
  OR start_lng = 0
  OR end_lat = 0
  OR end_lng = 0;

  -- delete rows with end_lat = 0 or any of above

DELETE
FROM
  `bike-share-case-study-mm.bike_data.combined_ride_data`
WHERE
  start_station_id = '0'
  OR end_station_id = '0'
  OR start_lat = 0
  OR start_lng = 0
  OR end_lat = 0
  OR end_lng = 0;

  -- determine if there are outliers such as ride lengths of under 30 seconds or over 48 hours
  -- 55554 total rides under that condition

  SELECT *
  FROM `bike-share-case-study-mm.bike_data.combined_ride_data`
  WHERE ride_length < 30
  OR ride_length > 172800
  ORDER BY ride_length DESC;

  -- remove said outliers from combined data

  DELETE 
  FROM `bike-share-case-study-mm.bike_data.combined_ride_data`
  WHERE ride_length < 30
  OR ride_length > 172800
