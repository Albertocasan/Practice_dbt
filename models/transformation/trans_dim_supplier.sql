select
    s.supplier_id,
    s.supplier_name,
    s.account_balance,
    n.nation_id,
    n.nation_name,
    r.region_id,
    r.region_name
from {{ ref('stg_dim_supplier') }} s
join {{ ref('stg_dim_nation') }} n on s.nation_id = n.nation_id
join {{ ref('stg_dim_region') }} r on n.region_id = r.region_id