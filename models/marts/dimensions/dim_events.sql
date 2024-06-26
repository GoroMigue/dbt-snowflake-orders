with events as (
    select * from {{ ref('stg_delivery__sales_event') }}
    {% if is_incremental() %}
    where id_event not in (select id_event from {{ this }})
    {% endif %}
),
final as (
    select
        id_event,
        event_name,
        start_month,
        start_day,
        end_month,
        end_day,
        country_id

    from 
        events
)
select * from final