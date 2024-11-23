

with
    customers as (select * from COMMEXEC_DEV.DBT_DEV.raw_L0_orders),

    
    final as (

        select distinct
            customers.customer_id as customer_id,
            customers.customer_name as customer_name,
            customers.segment as segment,
            customers.country as country,
            customers.city as city,
            customers.state as o_state,
            customers.postalcode as postalcode,
            customers.region as region

        from customers
    )

select *
from final