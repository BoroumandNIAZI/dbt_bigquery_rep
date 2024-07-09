with products as
(
    select
        product_id,
        department as product_department,
        cost as product_cost,
        retail_price as product_retail_price
    from {{ref("stg_ecommerce__products")}}
)

select
    order_items.order_item_id,
    order_items.order_id,
    order_items.user_id,
    order_items.product_id,

    order_items.item_sale_price,

    products.product_department,
    products.product_cost,
    products.product_retail_price,

    order_items.item_sale_price - products.product_cost as item_profit,
    products.product_retail_price - order_items.item_sale_price as item_discount
from {{ref("stg_ecommerce__order_items")}} as order_items
left join products
    on order_items.product_id = order_items.product_id
where order_items.user_id <= 1000