select
    id as payment_id,
    orderid AS order_id,
    paymentmethod as payment_method,
    {{ cents_to_dollars("amount",4) }} AS amount,
    status,
    created as created_at
from {{source('stripe', 'payment')}}

