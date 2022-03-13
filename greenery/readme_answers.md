How many users do we have?
130

On average, how many orders do we receive per hour?
with orders_per_hour as 
(
select date_trunc ('hour', created_at ) as created_hour,
        count (distinct (order_id)) as unique_orders
from dbt_jasmin_h.stage_orders
group by created_hour
)
select
round( avg(unique_orders)::numeric, 2) as orders_placed_per_hour
from orders_per_hour

answer: 7.52

select date_trunc('minutes',avg(delivered_at-created_at)) as average_delivery_time
from dbt_jasmin_h.stage_orders

answer: 3 days 21:24:00

How many users have only made one purchase? Two purchases? Three+ purchases?

with orders_per_user as 
(
select user_id as user_id, 
count( distinct order_id) as total_orders
from sbt_jasmin_n.stage_orders
group by user_id
)

select
case
when total_orders =1 then '1'
when total_orders = 2 then '2'
else '3+'
end as number_of_orders,
count(distinct user_id) as users
from orders_per_user
group by number_of_orders

answer:

 1  25
 2  28
 3+ 71

On average, how many unique sessions do we have per hour?

with sessions_started_per_hour as 
(
select date_trunc ('hour', created_at ) as created_hour,
        count (distinct (session_id)) as unique_sessions
from dbt_jasmin_h.stage_events
group by created_hour
)
select
round( avg(unique_sessions)::numeric, 2) as sessions_per_hour
from sessions_started_per_hour

answer: 16.33
 
