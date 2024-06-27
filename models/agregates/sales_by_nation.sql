select 
    shop_nation_id as nation_id,
    nation_name,
    month(shop_date) as order_month, 
    year(shop_date) as order_year,
    count(*) as lines,
    count(case when returnflag = 'A' then 1 end) as acepted,
    count(case when returnflag = 'R' then 1 end) as returned,
    count(distinct order_id) as orders,
    sum(case when returnflag = 'A' then extendedprice else 0 end) as amount,
    count(case when delivery_time_id = 1 then 1 end) as ontime,
    count(case when delivery_time_id = 2 then 1 end) as delay_lt10days,
    count(case when delivery_time_id = 3 then 1 end) as delay_mt10days,
    count(case when delivery_time_id = 0 then 1 end) as delay_mt30days
    
from {{ ref('fct_sales') }}
join {{ ref('dim_nation') }} on shop_nation_id = nation_id
group by order_year, order_month, shop_nation_id, nation_name