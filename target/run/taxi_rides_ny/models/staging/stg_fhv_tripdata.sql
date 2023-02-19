

  create or replace view `de-zoomcamp-2023-376110`.`dbt_de_zoomcamp`.`stg_fhv_tripdata`
  OPTIONS()
  as 

with
    tripdata as (
        -- row_number() over(partition by vendorid, lpep_pickup_datetime) as rn
        select * from `de-zoomcamp-2023-376110`.`trips_data_all`.`fhv_tripdata`
    )
select
    -- identifiers
    to_hex(md5(cast(coalesce(cast(dispatching_base_num as 
    string
), '') || '-' || coalesce(cast(pickup_datetime as 
    string
), '') as 
    string
)))
    as tripid,
    cast(dispatching_base_num as string) as dispatching_base_num,

    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,

    cast(pulocationid as integer) as pulocationid,
    cast(dolocationid as numeric) as dolocationid,
    sr_flag,
    affiliated_base_number

-- where rn = 1
-- -- dbt build --m <model.sql> --var 'is_test_run: false'
-- 
from tripdata;

