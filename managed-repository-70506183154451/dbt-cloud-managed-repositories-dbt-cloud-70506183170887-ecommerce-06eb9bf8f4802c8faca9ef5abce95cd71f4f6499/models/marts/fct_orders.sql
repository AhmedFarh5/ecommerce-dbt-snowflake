with orders as (
    select * from {{ ref('stg_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

deduped_orders as (
    select *,
           row_number() over (partition by order_id order by order_date desc) as rn
    from orders
    where order_id is not null
      and customer_id is not null
      and product_id is not null
),

final as (
    select
        o.order_id,
        o.customer_id,
        o.product_id,
        o.order_date,
        o.order_status,
        o.quantity,
        p.price,
        (o.quantity * p.price) as calculated_total_amount
    from deduped_orders o
    inner join products p on o.product_id = p.product_id
    where o.rn = 1
)

select * from final