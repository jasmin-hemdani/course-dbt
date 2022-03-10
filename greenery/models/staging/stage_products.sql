select
product_id
, name
, price
, inventory
from {{ source ('public','products')}}