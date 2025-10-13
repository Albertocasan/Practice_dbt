select
    nation_id,
    nation_name,
    n_comment,
    region_id,
    region_name,
    r_comment
from {{ ref('trans_dim_nation') }}
