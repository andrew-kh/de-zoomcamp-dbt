{{ config(materialized="view") }}

with
    tripdata as (
        -- row_number() over(partition by vendorid, lpep_pickup_datetime) as rn
        select * from {{ source("staging", "fhv_tripdata") }}
    )
select
    -- identifiers
    {{ dbt_utils.surrogate_key(["dispatching_base_num", "pickup_datetime"]) }}
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
-- {% if var('is_test_run', default=false) %}
-- limit 100
-- {% endif %}
from tripdata
