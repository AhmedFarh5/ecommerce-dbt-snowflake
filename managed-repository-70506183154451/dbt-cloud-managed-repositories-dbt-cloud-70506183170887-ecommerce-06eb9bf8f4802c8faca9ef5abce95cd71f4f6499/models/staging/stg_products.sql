with source as (
    select * from {{ source('ecommerce_raw', 'PRODUCTS') }}
),

renamed as (
    select
        product_id,
        product_name,
        category,
        price
    from source
    where product_id is not null
      and price >= 0 -- التأكد من أن السعر غير سالب
)

select * from renamed