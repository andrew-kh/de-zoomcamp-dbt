


select 
    locationid, 
    borough, 
    zone, 
    replace(service_zone,'Boro','Green') as service_zone
from `de-zoomcamp-2023-376110`.`dbt_de_zoomcamp`.`taxi_zone_lookup`