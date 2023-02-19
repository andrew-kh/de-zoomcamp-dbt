select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select tripid
from `de-zoomcamp-2023-376110`.`dbt_de_zoomcamp`.`stg_green_tripdata`
where tripid is null



      
    ) dbt_internal_test