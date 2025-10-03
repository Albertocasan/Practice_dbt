select distinct
    supplier_id,
    supplier_name,
    account_balance,
    nation_id,
    nation_name,
    region_id,
    region_name
from {{ ref('trans_dim_supplier') }}
