with shop as (
    select * from {{ ref('stg_delivery__shop') }}
    {% if is_incremental() %}
    where shop_id not in (select shop_id from {{ this }})
    {% endif %}
),
nation as (
    select * from {{ ref('stg_delivery__nation') }}
    join {{ ref('stg_delivery__region') }} using(region_id)
),
exchange_rates as (
    select * from {{ ref('stg_exchange__exchange_rates') }}
),
shop_nation as (
    select
        *
    from
        shop
    join nation n on n.nation_id = shop_nation_id
),
final as (
    select
        shop_id,
        shop_name,
        shop_nation_id,
        nation_name as shop_nation_name,
        region_name as shop_region_name,
        currency_to as shop_currency,
        rate as shop_exchange_rate,
        time_zone
    from
        shop_nation
    join exchange_rates e on e.nation_id = shop_nation_id
)
select * from final