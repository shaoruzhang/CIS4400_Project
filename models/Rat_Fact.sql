with date as (
 
    select date_dim_id from {{ ref('date_dim') }}
 
),
 
location as (
 
    select location_dim_id from {{ ref('location_dim') }}
 
),
 
rat_agency as (
 
    select agency_dim_id from {{ ref('rat_agency_dim') }}
 
),
rat_complaint as (
 
    select complaint_dim_id from {{ ref('rat_complaint_dim') }}
 
)
 
select * from date, location, rat_agency, rat_complaint