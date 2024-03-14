with orders as (
    select
        *
    from {{ ref('stg_orders') }}
),

payments as (

    select order_id,
        sum(case when status = 'success' then amount end) as amount
    from {{ ref('stg_payments') }}
    group by 1
)
select order_id
, customer_id
,order_date
, coalesce(amount,0) as amount
from orders
left join payments using(order_id)