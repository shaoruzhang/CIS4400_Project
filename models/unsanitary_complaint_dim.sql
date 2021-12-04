select distinct
    {{ dbt_utils.surrogate_key(['complaint_type', 'descriptor']) }} as complaint_dim_id,
    complaint_type,
    descriptor
    from 
    ( select distinct complaint_type, descriptor 
     from `bigquery-public-data.new_york.311_service_requests`
     Where complaint_type = 'UNSANITARY CONDITION'
     OR complaint_type = 'Dirty Conditions'
     OR complaint_type = 'Dirty Condition'
    )
