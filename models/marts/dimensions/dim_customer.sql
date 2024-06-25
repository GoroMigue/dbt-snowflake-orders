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
        customers
    join nation on nation_id = customer_nation_id
),
final as (
    select 
        customer_id,
        customer_name,
        customer_phone,
        customer_balance,
        customer_market,
        customer_address,
        nation_name as customer_nation_name,
        region_name as customer_region_name,
        currency,
        currency_rate,
        time_zone
    from
        customer_nation
)
select * from final