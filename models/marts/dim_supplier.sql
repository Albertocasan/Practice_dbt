select distinct
    supplier_id,
    supplier_name,
    address,
    nation_id,
    phone,
    account_balance,
    comment
from {{ ref('stg_dim_supplier') }}
