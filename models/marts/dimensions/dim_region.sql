with region as (
    select * from {{ ref('stg_delivery__region') }}
),
final as (
    select 
        region_id,
        region_name,
        comment
    from
        region
)
select * from final