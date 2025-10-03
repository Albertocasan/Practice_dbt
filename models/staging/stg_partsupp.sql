select
    ps_partkey::int          as part_id,       
    ps_suppkey::int          as supplier_id,   
    ps_availqty::int         as available_qty,
    ps_supplycost::numeric(12,2) as supply_cost,
    ps_comment::string       as comment
from {{ source('tpch_sf1', 'partsupp') }}