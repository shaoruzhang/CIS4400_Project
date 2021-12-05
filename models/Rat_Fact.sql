SELECT date_dim_id, location_dim_id
FROM {{ref('Rat_data')}} as rat_data
INNER JOIN {{ref('date_dim')}} as date_dim ON date_dim.full_date = DATE(rat_data.created_date)
INNER JOIN {{ref('location_dim')}} as location_dim ON location_dim.incident_zip = rat_data.incident_zip AND 
location_dim.borough = rat_data.borough  AND  location_dim.location_type = rat_data.location_type 
AND location_dim.latitude = rat_data.latitude AND location_dim.longitude = rat_data.longitude



