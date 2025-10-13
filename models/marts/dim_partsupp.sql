select distinct
    part_id,
    supplier_id,
    available_qty,
    supply_cost
from {{ ref('stg_dim_partsupp') }}