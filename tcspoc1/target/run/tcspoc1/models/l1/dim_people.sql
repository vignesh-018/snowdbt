
  
    

        create or replace transient table COMMEXEC_DEV.DBT_DEV.dim_people
         as
        (

with people_data as (
    
    select * from COMMEXEC_DEV.DBT_DEV.raw_L0_orders 
),
final as (

    select 
           people_data.person as person,
           people_data.people_region as people_region
    from 
     people_data
)

select * from final
        );
      
  