with nation as (
    select * from {{ ref('stg_delivery__nation') }}
),
region as (
    select * from {{ ref('dim_region') }}
),
nation_region as (
    select 
        * 
    from 
        nation 
    join region using (region_id)
),
final as (
    select
        nation_id,
        nation_name,
        region_id,
        region_name,
        time_zone

    from 
        nation_region
)
select * from final