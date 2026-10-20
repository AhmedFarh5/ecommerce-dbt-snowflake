with source as (
    select * from {{ source('ecommerce_raw', 'ORDERS') }}
),

cleaned as (
    select
        order_id,
        customer_id,
        product_id,
        quantity,
        order_date,
        -- توحيد حالة الطلب وتحويلها لحروف صغيرة (Standardize order statuses)
        lower(trim(status)) as order_status
    from source
    where order_id is not null
      and quantity > 0 -- التأكد من أن الكمية موجبة
)

select * from cleaned