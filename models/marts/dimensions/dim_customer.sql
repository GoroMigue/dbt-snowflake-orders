with customers as (
    select * from {{ ref('stg_delivery__customer') }}
),
nation as (
    select * from {{ ref('dim_nation') }}
),
customer_nation as (
    select
        *
    from
        customer
    join nation using(nation_id)
),
final as (
    select 
        customer_id
        customer_name,
        phone,
        balance,
        market,
        address,
        nation_name,
        region_name
    from
        customer_nation
)
select * from final