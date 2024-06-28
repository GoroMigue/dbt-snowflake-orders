select
    c_custkey as customer_id,
    c_name as customer_name,
    c_address as customer_address,
    c_nationkey as customer_nation_id,
    c_phone as customer_phone,
    c_acctbal as customer_balance,
    c_mktsegment as customer_market,
    c_comment as customer_comment

from {{ source('delivery', 'customer') }}