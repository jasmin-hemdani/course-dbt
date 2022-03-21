{{config (materialized='table')}}

select 
product_id
, name
, price
, inventory
from {{ ref ('stage_products')}}