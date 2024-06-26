with region as (
    select * from {{ ref('stg_delivery__region') }}
    {% if is_incremental() %}
    where region_id not in (select region_id from {{ this }})
    {% endif %}
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