{{ 
    config(materialized='table' ,schema='dbt_integration',alias='tbl_fact_returns')
    }}

with return as (
    
    select * from {{ source('dbt_dev','fact_returns') }} 
),

final as (
    select
     "RETURNED"::varchar as returned,
     "ORDER_ID" ::varchar as order_id
    from 
    return
)

select * from final