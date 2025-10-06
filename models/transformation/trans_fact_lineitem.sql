{{ config(
    materialized = 'table'
) }}

select
    {{ surrogate_key(['l.order_id','l.line_number','l.part_id','l.supplier_id']) }} as lineitem_sk,
    l.order_id,
    l.line_number,
    l.part_id,
    l.supplier_id,
    o.customer_id,
    c.nation_id,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    (l.extended_price * (1 - l.discount)) as net_price,
    (l.extended_price * (1 - l.discount) * (1 + l.tax)) as gross_price,
    l.ship_date,
    l.commit_date,
    l.receipt_date,
    l.return_flag,
    l.line_status,
    l.ship_instruct,
    l.ship_mode,
    l.comment
from {{ ref('stg_fact_lineitem') }} l
join {{ ref('stg_dim_orders') }} o
    on l.order_id = o.order_id
join {{ ref('stg_dim_customer') }} c
    on o.customer_id = c.customer_id
join {{ ref('stg_dim_nation') }} n
    on c.nation_id = n.nation_id
