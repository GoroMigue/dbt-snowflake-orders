with events as (
    select * from {{ ref('stg_delivery__sales_event') }}
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