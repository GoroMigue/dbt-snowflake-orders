select 
    event_id,
    event_name,
    nation_id,
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
    count(case when delivery_time_id = 0 then 1 end) as delay_mt30days,
    count(distinct customer_id) as customers
    
from {{ ref('fct_sales') }}
join {{ ref('dim_events') }} using (event_id)
group by event_id, event_name, nation_id, nation_name, order_month, order_year