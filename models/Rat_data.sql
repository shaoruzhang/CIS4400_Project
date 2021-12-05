select * 
FROM `bigquery-public-data.new_york.311_service_requests`
WHERE complaint_type = 'Rodent'
ORDER BY created_date DESC