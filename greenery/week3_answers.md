What is our overall conversion rate?\
NOTE: conversion rate is defined as the # of unique sessions with a\
purchase event / total number of unique sessions.

selecConversion rate by product is defined as the # of unique sessions with a\
purchase event of that product / total number of\
unique sessions that viewed that product

with\
purchase_session as\
(select count (distinct session_id) as checkout_session\
from dbt_jasmin_h.fact_page_views\
where event_type = 'checkout'\
)\
,

total as\
(\
select count (distinct session_id) as total_sessions\
from dbt_jasmin_h.fact_page_views\
)

select ROUND ((purchase_session.checkout_session/total.total_sessions::numeric*100),2)\
as conversion_rate\
from purchase_session, total

ANSWER: 62.46

2.What is our conversion rate by product?

Somethings is wrong with my table as\
select\
name as product_name\
from\
dbt_jasmin_h.fact_page_views\
where event_type='checkout'\
group by product_name

returns NULL

PART 2: Create a macro to simplify part of a model(s).

{% macro get_distinct (table) (column) %}\
{ % set sql %}\
select distinct\
{{column}}\
from\
{{table}}\
{% end set %}\
{% set results = run_query(sql) %}\
  {% set results_list = [] %}\
{{ return(results_list) }}\
{% endmacro %}

PART 3\
Added:\
on-run-end:\
  - "GRANT USAGE ON {{ target.schema }} TO reporting"

PART 4: Install a package (i.e. dbt-utils, dbt-expectations)\
and apply one or more of the macros to your project\
- I added dbt utils. I have not used it in my code here, but I\
have used codegen in my work project.
