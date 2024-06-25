select
    s_suppkey as supplier_id,
    s_name as supplier_name,
    s_address as address,
    s_nationkey as nation_id,
    s_phone as phone,
    s_acctbal as balance,
    s_comment as comment

from {{ source('delivery', 'supplier') }}