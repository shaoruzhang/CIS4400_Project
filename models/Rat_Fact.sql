SELECT DISTINCT date_dim_id, location_dim_id, agency_dim_id, complaint_dim_id, count(complaint_dim_id) as complaint_count
 
FROM {{ref('Rat_data')}} as rat_data
INNER JOIN {{ref('date_dim')}} as date_dim ON date_dim.full_date = DATE(rat_data.created_date)
INNER JOIN {{ref('location_dim')}} as location_dim ON location_dim.incident_zip = rat_data.incident_zip AND 
location_dim.latitude= rat_data.latitude AND location_dim.longitude = rat_data.longitude
INNER JOIN {{ref('rat_agency_dim')}} as agency_dim ON agency_dim.agency_name = rat_data.agency_name
INNER JOIN {{ref('rat_complaint_dim')}} as complaint_dim ON complaint_dim.descriptor= rat_data.descriptor

GROUP BY date_dim_id, location_dim_id, agency_dim_id, complaint_dim_id





