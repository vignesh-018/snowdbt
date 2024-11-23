
  create or replace   view COMMEXEC_DEV.DBT_DEV.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from COMMEXEC_DEV.DBT_DEV.my_first_dbt_model
where id = 1
  );

