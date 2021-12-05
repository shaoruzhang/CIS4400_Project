select * 
FROM `bigquery-public-data.new_york.311_service_requests`
WHERE complaint_type  IN ('UNSANITARY CONDITION','Dirty Conditions', 'Dirty Condition')
ORDER BY created_date DESC