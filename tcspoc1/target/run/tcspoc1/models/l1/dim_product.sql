
  
    

        create or replace transient table COMMEXEC_DEV.DBT_DEV.dim_product
         as
        (

with products as (
    
    select * from COMMEXEC_DEV.DBT_DEV.raw_L0_orders 
),
final as (

    select 
            products.PRODUCT_ID as product_id,
			products.CATEGORY as category,
			products.SUB_CATEGORY as sub_category,
			products.PRODUCT_NAME as product_name,
            products.CUSTOMER_ID as CUSTOMER_ID

            from 
            products

)

select * from final
        );
      
  