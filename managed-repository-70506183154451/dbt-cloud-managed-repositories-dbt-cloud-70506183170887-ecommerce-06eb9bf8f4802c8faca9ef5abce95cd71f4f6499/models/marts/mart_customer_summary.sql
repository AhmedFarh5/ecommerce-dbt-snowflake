with orders as (
    select * from {{ ref('fct_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

customer_summary as (
    select
        c.customer_id,
        c.customer_name,
        c.city,
        count(o.order_id) as total_orders,
        -- حساب إجمالي المبالغ المدفوعة للطلبات المكتملة فقط (Completed orders)
        sum(case when o.order_status = 'completed' then o.calculated_total_amount else 0 end) as total_spent
    from customers c
    left join orders o on c.customer_id = o.customer_id
    group by 1, 2, 3
)

select * from customer_summary