-- combine all cleaned datasets into one table with Union All 

CREATE TABLE `bike-share-case-study-mm.bike_data.combined_ride_data` 
AS
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2022_10`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2022_11`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2022_12`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_01`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_02`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_03`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_04`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_05`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_06`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_07`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_08`
UNION ALL
SELECT * FROM `bike-share-case-study-mm.bike_data.cleaned_2023_09`;
