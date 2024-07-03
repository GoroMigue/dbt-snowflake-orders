select 
    shop_id,
    shop_name,
    shop_nation_id,
    shop_nation_name,
    part_id,
    part_name,
    brand,
    sum(case when returnflag = 'A' then quantity else 0 end) as quantity,
    month(shop_date) as order_month, 
    year(shop_date) as order_year
    
from {{ ref('fct_sales') }}
join {{ ref('dim_shop') }} using (shop_id)
join {{ ref('dim_part') }} using (part_id)
group by order_year, order_month, shop_id, shop_name, shop_nation_id, shop_nation_name, part_id, part_name, brand