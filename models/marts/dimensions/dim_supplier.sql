with supplier as (
    select * from {{ ref('stg_delivery__supplier') }}
),
nation as (
    select * from {{ ref('dim_nation') }}
),
supplier_nation as (
    select
        *
    from
        supplier
    join nation using(nation_id)
),
final as (
    select 
        supplier_id,
        supplier_name,
        nation_id,
        phone,
        balance,
        address,
        nation_name,
        region_name
    from
        supplier_nation
)
select * from final