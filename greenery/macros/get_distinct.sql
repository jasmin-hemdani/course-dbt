
{% macro get_distinct (table) (column) %}
{ % set sql %}
select distinct 
{{column}}
from
{{table}}
{% end set %}
{% set results = run_query(sql) %}
  {% set results_list = [] %}
{{ return(results_list) }}
{% endmacro %}