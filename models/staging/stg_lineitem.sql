{{ config(
    materialized = 'incremental',
    unique_key = 'lineitem_sk'
) }}

select
    md5(concat(l_orderkey, '-', l_linenumber, '-', l_partkey, '-', l_suppkey)) as lineitem_sk, 
    l_orderkey::int                as order_id,
    l_linenumber::int              as line_number,
    l_partkey::int                 as part_id,
    l_suppkey::int                 as supplier_id,
    l_quantity::int                as quantity,
    l_extendedprice::numeric(12,2) as extended_price,
    l_discount::numeric(12,2)      as discount,
    l_tax::numeric(12,2)           as tax,
    l_returnflag::string           as return_flag,
    l_linestatus::string           as line_status,
    l_shipdate::date               as ship_date,
    l_commitdate::date             as commit_date,
    l_receiptdate::date            as receipt_date,
    l_shipinstruct::string         as ship_instruct,
    l_shipmode::string             as ship_mode,
    l_comment::string              as comment
from {{ source('tpch_sf1', 'lineitem') }}

{% if is_incremental() %}
  -- Solo cargar filas nuevas basadas en ship_date
  where l_shipdate > (select max(ship_date) from {{ this }})
{% endif %}
