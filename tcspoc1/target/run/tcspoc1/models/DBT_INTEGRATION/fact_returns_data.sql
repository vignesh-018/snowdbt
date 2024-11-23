
  
    

        create or replace transient table COMMEXEC_DEV.dbt_integration.tbl_fact_returns
         as
        (

with return as (
    
    select * from COMMEXEC_DEV.dbt_dev.fact_returns 
),

final as (
    select
     "RETURNED"::varchar as returned,
     "ORDER_ID" ::varchar as order_id
    from 
    return
)

select * from final
        );
      
  