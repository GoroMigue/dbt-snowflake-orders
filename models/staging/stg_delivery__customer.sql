select
    c_custkey as customer_id,
    c_name as customer_name,
    c_address as adress,
    c_nationkey as nation_id,
    c_phone as phone,
    c_acctbal as balance,
    c_mktsegment as market,
    c_comment as comment

from {{ source('delivery', 'customer') }}