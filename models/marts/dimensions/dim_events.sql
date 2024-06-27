with events as (
    select * from {{ ref('stg_delivery__sales_event') }}
    {% if is_incremental() %}
    where event_id not in (select event_id from {{ this }})
    {% endif %}
),
final as (
    select
        event_id,
        event_name,
        start_date,
        end_date,
        nation_id

    from 
        events
)
select * from final