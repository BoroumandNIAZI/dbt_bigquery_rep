{# {{
    config(
        materialized = 'view',
    )
}} #}

with source as (
    select * from {{ source('thelook_ecommerce', 'orders') }}

)
select 
    -- IDs
    order_id,
    user_id,
    -- Timestamps
    created_at,
    returned_at,
    shipped_at,
    delivered_at,
    -- Other columns
    status,
    num_of_item as num_items_ordered
from source

