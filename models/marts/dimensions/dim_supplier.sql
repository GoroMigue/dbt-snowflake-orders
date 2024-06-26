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
    join nation on nation_id = supplier_nation_id
),
final as (
    select 
        supplier_id,
        supplier_name,
        supplier_nation_id,
        supplier_phone,
        supplier_balance,
        supplier_address,
        nation_name as supplier_nation_name,
        region_name as supplier_region_name,
        time_zone
    from
        supplier_nation
)
select * from final