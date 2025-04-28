--stg_stripe__payments

select 
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at

from {{ source('stripe', 'payment') }}



--stg_jaffle_shop__customers

select
    id as customer_id, 
    first_name, 
    last_name
    
from {{ source('jaffle_shop', 'customers') }}



--stg_jaffle_shop__orders

select
    id as order_id, 
    user_id as customer_id, 
    order_date, 
    status

from {{ source('jaffle_shop', 'orders') }}