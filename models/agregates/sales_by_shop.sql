select 
    shop_id,
    shop_name,
    shop_nation_id,
    shop_nation_name,
    month(shop_date) as order_month, 
    year(shop_date) as order_year,
    count(*) as lines,
    count(distinct order_id) as orders,
    sum(total_price_default) as amount,
    count(case when delivery_time_id = 1 then 1 end) as ontime,
    count(case when delivery_time_id = 2 then 1 end) as delay_lt10days,
    count(case when delivery_time_id = 3 then 1 end) as delay_mt10days,
    count(case when delivery_time_id = 0 then 1 end) as delay_mt30days,
    count(distinct customer_id) as customers
    
from {{ ref('fct_sales') }}
join {{ ref('dim_shop') }} using (shop_id)
group by order_year, order_month, shop_id, shop_name, shop_nation_id, shop_nation_name