SELECT DISTINCT date_dim_id, location_dim_id, agency_dim_id, complaint_dim_id, count(complaint_dim_id) as complaint_count
 
FROM {{ref('Unsanitary_data')}} as unsanitary_data
INNER JOIN {{ref('date_dim')}} as date_dim ON date_dim.full_date = DATE(unsanitary_data.created_date)
INNER JOIN {{ref('location_dim')}} as location_dim ON location_dim.incident_zip = unsanitary_data.incident_zip AND 
location_dim.latitude= unsanitary_data.latitude AND location_dim.longitude = unsanitary_data.longitude
INNER JOIN {{ref('unsanitary_agency_dim')}} as agency_dim ON agency_dim.agency_name = unsanitary_data.agency_name
INNER JOIN {{ref('unsanitary_complaint_dim')}} as complaint_dim ON complaint_dim.descriptor= unsanitary_data.descriptor

GROUP BY date_dim_id, location_dim_id, agency_dim_id, complaint_dim_id


