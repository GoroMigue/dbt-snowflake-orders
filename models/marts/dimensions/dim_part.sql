with part as (
    select * from {{ ref('stg_delivery__part') }}
    {% if is_incremental() %}
    where part_id not in (select part_id from {{ this }})
    {% endif %}
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