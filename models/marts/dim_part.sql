select distinct
    part_id,
    part_name,
    manufacturer,
    brand,
    type,
    size,
    container,
    retail_price
from {{ ref('stg_dim_part') }}