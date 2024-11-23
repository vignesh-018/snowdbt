
  
    

        create or replace transient table COMMEXEC_DEV.dbt_integration.orders_data
         as
        (

with raw_source as
(
    select * from COMMEXEC_DEV.dbt_dev.raw_L0_orders
),

final as (
    select

            "ROW_ID"::number as row_id,
			"ORDER_ID"::varchar as order_id,
			"ORDER_DATE"::varchar as order_date,
			"SHIPDATE"::varchar as shipdate,
			"SHIPMODE"::varchar as shipmode,
            "SALES"::varchar as sales,
            "QUANTITY"::varchar as Quantity,
            "DISCOUNT"::varchar as discount,
            "PROFIT"::varchar as Profit,
            "PRODUCT_ID"::varchar as product_id
            from 
            raw_source

)

select * from final
        );
      
  