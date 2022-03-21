
{{
  config(
    materialized = 'table'
  )
}}

select 
o.order_id
, oi.product_id
, oi.quantity
, o.promo_id
, p.discount
, p.status as discount_status
, o.user_id
, o.address_id
, o.created_at
, o.order_cost
, o.shipping_cost as shiping_cost_usd
, o.order_total as order_total_usd
, o.tracking_id
, o.shipping_service
, o.estimated_delivery_at
, o.delivered_at
, o.status
from {{ref ('stage_orders')}} as o
left join {{ref ('stage_order_items')}} as oi
on o.order_id=oi.order_id
left join {{ref ('stage_promos')}} as p
on o.promo_id=p.promo_id