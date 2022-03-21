{{config (materialized='table')}}

SELECT
e.event_id
, e.session_id
, e.user_id
, e.event_type
, e.page_url
, e.created_at
, e.order_id
, o.order_total
, o.delivered_at
, p.product_id
, p.name
, o.promo_id
from {{ ref ('stage_events')}} as e
left JOIN {{ref('stage_orders')}} as o
on e.order_id=o.order_id
left join {{ref('stage_products')}} as p
on e.product_id=p.product_id
