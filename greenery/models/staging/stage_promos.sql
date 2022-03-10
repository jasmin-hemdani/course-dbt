SELECT
promo_id
, discount
, status
from {{source ('public','promos')}}