SELECT DISTINCT agency, agency_name
FROM `bigquery-public-data.new_york_311.311_service_requests` WHERE complaint_type = 'Rodent'