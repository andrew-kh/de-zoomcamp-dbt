
  
    

    create or replace table `de-zoomcamp-2023-376110`.`dbt_andrewkh`.`dim_zones`
    
    
    OPTIONS()
    as (
      


select 
    locationid, 
    borough, 
    zone, 
    replace(service_zone,'Boro','Green') as service_zone
from `de-zoomcamp-2023-376110`.`dbt_andrewkh`.`taxi_zone_lookup`
    );
  