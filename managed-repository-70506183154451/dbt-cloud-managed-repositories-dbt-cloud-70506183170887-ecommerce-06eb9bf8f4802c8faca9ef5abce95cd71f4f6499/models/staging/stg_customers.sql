with source as (
    select * from {{ source('ecommerce_raw', 'CUSTOMERS') }}
),

renamed as (
    select
        CUSTOMER_ID as customer_id,
        CUSTOMER_NAME as customer_name,
        EMAIL as email,
        CITY as city,
        SIGNUP_DATE as signup_date
    from source
)

select * from renamed