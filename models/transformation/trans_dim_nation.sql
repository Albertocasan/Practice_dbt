select
    n.nation_id,
    n.nation_name,
    n.comment as n_comment,
    n.region_id,
    r.region_name,
    r.comment as r_comment
from {{ ref('stg_dim_nation') }} n
join {{ ref('stg_dim_region') }} r
    on n.region_id = r.region_id
