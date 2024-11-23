{{
    config(materialized='view',schema='dbt_access',alias='vw_all_retailers')
}}

with integ_data as
(
    select * from {{ ref('fact_combined_data') }}
),

final as
(
    select YearMonthNum,
        month_name,
        Calendar_Quarter,
        total_customers,
        person,   ---added by ram 
        region,
		country,
		category,
		total_orders,
        total_returned_orders,
        total_sales,
        total_Quantity,
        total_discount,
        total_Profit,
		returned_sales,
        returned_Quantity,
        returned_Discount,
        returned_Profit
    
     from integ_data
)

select * from final