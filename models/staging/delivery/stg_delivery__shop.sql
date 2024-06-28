select
    shopkey as shop_id,
    name as shop_name,
    nationkey as shop_nation_id

from {{ source('delivery', 'shop') }}