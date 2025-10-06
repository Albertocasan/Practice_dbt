select
customer_id,        
customer_name,
address,
nation_id,         
phone,
account_balance,
market_segment,
comment
from {{ ref('stg_dim_customer') }}