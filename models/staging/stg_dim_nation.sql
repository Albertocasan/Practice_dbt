select
    n_nationkey::int       as nation_id,      
    n_name::string         as nation_name,
    n_regionkey::int       as region_id,    
    n_comment::string      as comment
from {{ source('tpch_sf1', 'nation') }}