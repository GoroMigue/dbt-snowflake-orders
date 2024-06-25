select
    l_orderkey as order_id,
    l_partkey as part_id,
    l_suppkey as supp_id,
    l_linenumber as linenumber,
    l_quantity as quantity,
    l_extendedprice as l_extendedprice,
    l_discount as discount,
    l_tax as tax,
    l_returnflag as returnflag,
    l_linestatus as linestatus,
    l_shipdate as shipdate,
    l_commitdate as commitdate,
    l_receiptdate as receiptdate,
    l_shipinstruct as shipinstruct,
    l_shipmode as shipmode,
    l_comment as comment

from {{ source('delivery', 'lineitem') }}