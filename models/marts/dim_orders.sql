select distinct
    order_id,
    customer_id,
    order_status,
    total_price,
    order_date,
    order_priority,
    clerk,
    ship_priority,
    order_comment
from {{ ref('trans_dim_orders') }}