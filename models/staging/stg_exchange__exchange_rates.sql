select
    nation_id,
    currency_from,
    currency_to,
    rate

from {{ source('exchange', 'exchange_rates') }}