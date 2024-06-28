with events as (
    select * from {{ ref('stg_delivery__sales_event') }}
    {% if is_incremental() %}
    where event_id not in (select event_id from {{ this }})
    {% endif %}
),
nation as (
    select * from {{ ref('dim_nation') }}
),
final as (
    select
        event_id,
        event_name,
        start_date,
        end_date,
        nation_id,
        nation_name

    from 
        events
    join nation using(nation_id)
)
select * from final