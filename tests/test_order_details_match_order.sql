
{# {{
  config(
    severity = 'warn',
    )
}} #}
with order_details as
(
    select
        order_id,
        count(*) as num_of_items_in_order
    from {{ref("stg_ecommerce__order_items")}}
    group by 1
)

select
    o.order_id,
    o.num_items_ordered,
    od.num_of_items_in_order,

from `dbt_sourena`.`stg_ecommerce__orders` o  {# old command: {{ref("stg_ecommerce__orders")}}  #}
full outer join order_details od using(order_id)
where
    o.order_id is null
    OR od.order_id is null
    OR o.num_items_ordered != od.num_of_items_in_order