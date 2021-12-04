{{
  config(
    materialized = 'table',
    sort = 'complaint_type',
  )
}}

SELECT DISTINCT
{{ dbt_utils.surrogate_key(['incident_zip', 'borough', 'location_type', 'latitude', 'longitude']) }} AS location_dim_id, 
incident_zip, 
borough, 
location_type,
latitude, 
longitude, 
FROM (
    SELECT DISTINCT Incident_zip, Borough, Location_type, Latitude, Longitude 
    FROM `bigquery-public-data.new_york_311.311_service_requests` 
    WHERE complaint_type IN ('UNSANITARY CONDITION','Dirty Conditions', 'Dirty Condition', 'Rodent')
) 

