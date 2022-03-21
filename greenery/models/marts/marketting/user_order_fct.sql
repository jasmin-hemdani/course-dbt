{{config (materialized='table')}}

SELECT

u.user_id
, u.first_name
, u.last_name
, u.email
, u.phone_number
, u.created_at 
, sum(o.order_cost) as total_base_order_cost
, sum(o.shipping_cost) as total_shipping_cost
, sum (o.order_total) as total_order_cost

FROM
{{ref ('stage_users') }} as u
 join {{ref('stage_orders')}} as o
on u.user_id=o.user_id

GROUP BY
u.user_id
, u.first_name
, u.last_name
, u.email
, u.phone_number
, u.created_at 

