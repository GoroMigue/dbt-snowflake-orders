with customers as (
    select * from {{ ref('stg_delivery__customer') }}
    {% if is_incremental() %}
    where customer_id not in (select customer_id from {{ this }})
    {% endif %}
),
nation as (
    select * from {{ ref('stg_delivery__nation') }}
    join {{ ref('stg_delivery__region') }} using(region_id)
),
exchange_rates as (
    select * from {{ ref('stg_exchange__exchange_rates') }}
),
customer_nation as (
    select
        *
    from
        customers
    join nation n on n.nation_id = customer_nation_id
),
final as (
    select 
        customer_id,
        customer_name,
        customer_phone,
        customer_balance,
        customer_market,
        customer_address,
        customer_nation_id,
        nation_name as customer_nation_name,
        region_name as customer_region_name,
        currency_to as customer_currency,
        rate as customer_exchange_rate,
        time_zone
    from
        customer_nation
    join exchange_rates e on e.nation_id = customer_nation_id
)
select * from final