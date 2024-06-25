with part as (
    select * from {{ ref('stg_delivery__part') }}
),
final as (
    select 
        part_id,
        part_name,
        manufacturer,
        brand,
        type,
        size,
        container,
        retail_price
    from
        part
)
select * from final