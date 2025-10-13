select
    s_suppkey::int        as supplier_id,      
    s_name::string        as supplier_name,
    s_address::string     as address,
    s_nationkey::int      as nation_id,       
    s_phone::string       as phone,
    s_acctbal::numeric(12,2) as account_balance,
    s_comment::string     as comment
from {{ source('tpch_sf1', 'supplier') }}