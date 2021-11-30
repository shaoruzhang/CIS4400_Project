SELECT
{{ dbt_utils.surrogate_key(['agency_name']) }} AS AgencyDimID,
agency,
agency_name
FROM (
    SELECT DISTINCT agency, agency_name
    FROM `bigquery-public-data.new_york_311.311_service_requests` 
    WHERE complaint_type = 'Rodent'
)
