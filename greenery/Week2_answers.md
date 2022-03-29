What is our user repeat rate?\
Repeat Rate = Users who purchased 2 or more times / users who purchased\
ANSWER: 79.84%\
with user_total_orders as\
(\
select\
  user_id,\
  count (distinct order_id) as orders\
from dbt_jasmin_h.fct_orders\
group by user_id\
)\
,

repeat_over_total_orders as\
(\
select\
  sum\
  (case when orders > 1 then 1 end) as repeat_purchase,\
  sum\
  (case when orders > 0 then 1 end) as all_orders\
from user_total_orders\
)

select ROUND ((repeat_purchase/all_orders::numeric)*100,2) as repeat_rate\
from repeat_over_total_orders

What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

After some visualization of the data it becomes apparent that folks with discount on first order, and under 3.3 days of delivery window are likely to order agai.\
Opposite appears to be true for folks who will not order again.\
If I had more data, I would want to look at customer's interactions with service agents, representatives etc. I would also want to look at sales channels.

DAG: see picture in slack

PART 2

What assumptions are you making about each model? (i.e. why are you adding each test?) I have only described one type of test once, they are repeated many times in the models.\
TEST: UNIQUE stage_addresses: I addded unique tests on the address_id field in the stage addresses table to ensure primary key integrity\
TEST: NOT_NULL : stage_events: ensure every event gets an event_id\
TEST: RELATIONSHIP: stage_events: ensure user_id integrity between events and users table

No bad tests were found
