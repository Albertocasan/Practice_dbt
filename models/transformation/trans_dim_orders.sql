select
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.market_segment,
    o.order_status,
    o.total_price,
    o.order_date,
    o.order_priority,
    o.clerk,
    o.ship_priority,
    o.comment as order_comment
from {{ ref('stg_dim_orders') }} o
join {{ ref('stg_dim_customer') }} c 
  on o.customer_id = c.customer_id