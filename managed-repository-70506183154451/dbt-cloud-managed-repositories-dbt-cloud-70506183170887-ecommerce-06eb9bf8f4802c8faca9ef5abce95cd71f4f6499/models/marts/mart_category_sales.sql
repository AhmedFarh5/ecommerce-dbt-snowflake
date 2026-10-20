with orders as (
    select * from {{ ref('fct_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

category_sales as (
    select
        p.category,
        count(o.order_id) as total_orders_count,
        sum(case when o.order_status = 'completed' then o.calculated_total_amount else 0 end) as total_revenue
    from products p
    left join orders o on p.product_id = o.product_id
    group by 1
)

select * from category_sales