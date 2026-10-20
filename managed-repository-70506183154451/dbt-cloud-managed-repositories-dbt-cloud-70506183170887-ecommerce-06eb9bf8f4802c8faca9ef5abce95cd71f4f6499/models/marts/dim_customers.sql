with source as (
    select * from {{ source('ecommerce_raw', 'CUSTOMERS') }}
),

renamed as (
    select
        customer_id,
        customer_name,
        email,
        city,
        signup_date
    from source
    where customer_id is not null -- استبعاد السجلات الفارغة كجزء من تنظيف البيانات
)

select * from renamed