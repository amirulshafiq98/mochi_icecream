
  create view "mochi_data"."dbt_mochi"."my_second_dbt_model__dbt_tmp"
    
    
  as (
    -- Use the `ref` function to select from other models

select *
from "mochi_data"."dbt_mochi"."my_first_dbt_model"
where id = 1
  );