select
    ps_partkey as order_id,
    ps_suppkey as customer_id,
    ps_availqty as order_status,
    ps_supplycost as total_price,
    ps_comment as order_date

from {{ source('delivery', 'partsupp') }}