select
order_id
, product_id
, quantity
from {{ source ('public','order_items')}}