select
    id_event,
    event_name,
    start_month,
    start_day,
    end_month,
    end_day,
    country_id

from {{ source('delivery', 'sales_event') }}

