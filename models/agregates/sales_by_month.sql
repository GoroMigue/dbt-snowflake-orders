select 
    month(shop_date) as order_month, 
    year(shop_date) as order_year,
    count(*) as lines,
    count(distinct order_id) as orders,
    sum(total_price_default) as amount,
    count(case when delivery_time_id = 1 then 1 end) as ontime,
    count(case when delivery_time_id = 2 then 1 end) as delay_lt10days,
    count(case when delivery_time_id = 3 then 1 end) as delay_mt10days,
    count(case when delivery_time_id = 0 then 1 end) as delay_mt30days
    
from {{ ref('fct_sales') }}
group by order_year, order_month