with payments as (

    select id
    , orderid
    , paymentmethod
    , status
    , amount
    , created
    , _batched_at 
    from {{source("stripe", "payment")}}
)
select id
    , orderid as order_id
    , paymentmethod
    , status
    , amount/100 as amount
    , created as created_at
    , _batched_at as batched_at
from payments