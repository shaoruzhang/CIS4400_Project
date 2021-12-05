SELECT DISTINCT
    {{ dbt_utils.surrogate_key(['complaint_type', 'descriptor']) }} as complaint_dim_id,
    complaint_type,
    descriptor
    FROM
    (SELECT DISTINCT complaint_type, descriptor 
     FROM `bigquery-public-data.new_york.311_service_requests`
     WHERE complaint_type IN ('UNSANITARY CONDITION','Dirty Conditions', 'Dirty Condition')
    )
