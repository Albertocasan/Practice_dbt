select
    c_custkey::int        as customer_id,        
    c_name::string        as customer_name,
    c_address::string     as address,
    c_nationkey::int      as nation_id,         
    c_phone::string       as phone,
    c_acctbal::numeric(12,2) as account_balance,
    c_mktsegment::string  as market_segment,
    c_comment::string     as comment
from {{ source('tpch_sf1', 'customer') }}