{# this comment won't appear #}
-- that comment will apear
{%- set my_list = ['user_id','created_at'] %}
{{ my_list }}
select
{% for item in my_list %}
    {{item}}{% if not loop.last %},{% endif %}
{%- endfor %}
