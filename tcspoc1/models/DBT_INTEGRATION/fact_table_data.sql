{{ 
    config(materialized='table' ,schema='dbt_integration',alias='tbl_fact_orders_returns')
    }}

with fact as (
    
    select * from {{ source('dbt_dev','orders') }} 
),
retunrs_data as (
    select * from {{ source('dbt_dev','fact_returns')}}

),
final as (
    select 
    fact.ORDERID as order_id,
    fact.CUSTOMERID as customer_id,
    fact.PRODUCTID as product_id,
    retunrs_data.RETURNED as RETURNED
    from 
    fact 
    inner join retunrs_data
    on fact.orderid=retunrs_data.order_id
)

select * from final