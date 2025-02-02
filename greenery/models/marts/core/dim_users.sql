{{ config (materialized = 'table')}}

select 
u.user_id
, u.first_name
, u.last_name
, u.email
, u.phone_number
, u.created_at
, u.updated_at
, u.address_id
, a.address 
, a.zipcode
, a.state 
, a.country
from {{ref('stage_users')}}  as u
left join {{ ref ('stage_addresses')}} as a
on u.address_id=a.address_id