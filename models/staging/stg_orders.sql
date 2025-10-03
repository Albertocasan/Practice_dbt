{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
) }}

select
    o_orderkey::int               as order_id,
    o_custkey::int                as customer_id,
    o_orderstatus::string         as order_status,
    o_totalprice::numeric(12,2)   as total_price,
    o_orderdate::date             as order_date,
    o_orderpriority::varchar(120) as order_priority,
    o_clerk::varchar(120)         as clerk,
    o_shippriority::int           as ship_priority,
    o_comment::string             as comment
    
from {{ source('tpch_sf1', 'orders') }}

{% if is_incremental() %}
  -- Solo nuevos pedidos (basado en la fecha más reciente cargada)
  where o_orderdate > (select max(order_date) from {{ this }})
{% endif %}


