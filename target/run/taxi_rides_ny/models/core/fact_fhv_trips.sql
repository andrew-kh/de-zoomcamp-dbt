
  
    

    create or replace table `de-zoomcamp-2023-376110`.`dbt_de_zoomcamp`.`fact_fhv_trips`
    
    
    OPTIONS()
    as (
      

with fhv_data as (
    select *, 
        'fhv' as service_type 
    from `de-zoomcamp-2023-376110`.`dbt_de_zoomcamp`.`stg_fhv_tripdata`
), 

dim_zones as (
    select * from `de-zoomcamp-2023-376110`.`dbt_de_zoomcamp`.`dim_zones`
    where borough != 'Unknown'
)
select 
    fhv_data.tripid, 
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone,  
    fhv_data.dispatching_base_num,
    fhv_data.pickup_datetime,
    fhv_data.dropoff_datetime,
    fhv_data.sr_flag,
    fhv_data.affiliated_base_number
from fhv_data
inner join dim_zones as pickup_zone
on fhv_data.pulocationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on fhv_data.dolocationid = dropoff_zone.locationid
    );
  