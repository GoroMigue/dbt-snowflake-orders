with shop as (
    select * from {{ ref('stg_delivery__shop') }}
),
nation as (
    select * from {{ ref('dim_nation') }}
),
shop_nation as (
    select
        *
    from
        shop
    join nation on nation_id = shop_nation_id
),
final as (
    select
        shop_id,
        shop_name,
        shop_nation_id,
        nation_name as shop_nation_name,
        region_name as shop_region_name,
        currency,
        currency_rate,
        time_zone
)
select * from final