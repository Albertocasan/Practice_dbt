select
    p_partkey::int          as part_id,        
    p_name::string          as part_name,
    p_mfgr::string          as manufacturer,
    p_brand::string         as brand,
    p_type::string          as type,
    p_size::int             as size,
    p_container::string     as container,
    p_retailprice::numeric(12,2) as retail_price,
    p_comment::string       as comment
from {{ source('tpch_sf1', 'part') }}