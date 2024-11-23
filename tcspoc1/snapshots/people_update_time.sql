{% snapshot people_update_time %}

{{
config(
      strategy= 'check',
      unique_key= 'id',
      target_schema= 'dbt_snapshots',
      check_cols=['person', 'region']
)

}}
select 
id,
person,
region
from {{ ref('people') }}

{% endsnapshot %}