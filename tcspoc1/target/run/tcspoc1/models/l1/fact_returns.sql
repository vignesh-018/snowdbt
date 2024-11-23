
  
    

        create or replace transient table COMMEXEC_DEV.DBT_DEV.fact_returns
         as
        (

with returns as (
    
    select * from COMMEXEC_DEV.DBT_DEV.returns_seed 
),
final as (
    select
     returns.RETURNED as returned,
     returns.ORDERID as order_id
    from 
    returns
)

select * from final
        );
      
  