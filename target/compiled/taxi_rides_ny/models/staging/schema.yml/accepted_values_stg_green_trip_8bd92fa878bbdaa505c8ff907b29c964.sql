
    
    

with all_values as (

    select
        Payment_type as value_field,
        count(*) as n_records

    from `de-zoomcamp-2023-376110`.`dbt_de_zoomcamp`.`stg_green_tripdata`
    group by Payment_type

)

select *
from all_values
where value_field not in (
    1,2,3,4,5,6
)


