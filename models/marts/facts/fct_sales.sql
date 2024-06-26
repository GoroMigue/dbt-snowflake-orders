with orders as (
    select * from {{ ref("dim_order") }} 
),
part as (
    select * from {{ ref("dim_part") }}
),
supplier as (
    select * from {{ ref('dim_supplier') }}
),
customer as (
    select * from {{ ref('dim_customer') }}
),
shop as (
    select * from {{ ref('dim_shop') }}
),
events as (
    select * from {{ ref('dim_events') }}
),
sales as (
    select 
        {{ order_type ('l.returnflag') }} as order_type,
        o.order_id,
        CONVERT_TIMEZONE('UTC', c.time_zone, o.order_date) as customer_date,
        CONVERT_TIMEZONE('UTC', shop.time_zone, o.order_date) as shop_date,
        e.event_name as sale_event,
        l.linenumber,
        l.quantity,
        l.discount,
        l.tax,
        l.linestatus,
        l.shipdate,
        l.commitdate,
        l.receiptdate,
        {{ delivery_time('l.commitdate','l.receiptdate') }} as delivery_time_id,
        l.shipinstruct,
        l.shipmode,
        s.supplier_id,
        p.part_id,
        c.customer_id,
        {{ money_converter('l.extendedprice', 'c.customer_exchange_rate') }} as customer_item_price,
        {{ money_converter('o.total_price', 'c.customer_exchange_rate') }} as customer_total_price,
        c.customer_currency,
        {{ money_converter('l.extendedprice', 'shop.shop_exchange_rate') }} as shop_item_price,
        {{ money_converter('o.total_price', 'shop.shop_exchange_rate') }} as shop_total_price,
        shop.shop_currency

    from
        {{ ref('stg_delivery__lineitem') }} l
    join orders o on o.order_id = l.order_id
    join part p on p.part_id = l.part_id
    join supplier s on s.supplier_id = l.supplier_id
    join customer c on c.customer_id = o.customer_id
    join shop on shop.shop_id = o.shop_id
    left join events e ON e.country_id = shop.shop_nation_id
        AND e.start_month <= MONTH(o.order_date)
        AND e.end_month >= MONTH(o.order_date)
        AND e.start_day <= DAY(o.order_date)
        AND e.end_day >= DAY(o.order_date)
    where l.returnflag not like 'A'
),
final as (
    select
        *
    from
        sales
    )
select * from final