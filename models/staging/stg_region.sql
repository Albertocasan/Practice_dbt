select
    r_regionkey::int      as region_id,   
    r_name::string        as region_name,
    r_comment::string     as comment
from {{ source('tpch_sf1', 'region') }}