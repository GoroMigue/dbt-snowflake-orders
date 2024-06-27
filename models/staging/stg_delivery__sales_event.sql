select
    event_id,
    event_name,
    start_date,
    end_date,
    nation_id

from {{ source('delivery', 'sales_event') }}

