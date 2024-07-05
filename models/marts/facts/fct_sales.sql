with orders as (
    select * from {{ ref("stg_delivery__orders") }} 
),
lineitem as (
    select * from {{ ref("stg_delivery__lineitem") }} 
),
customer as (
    select * from {{ ref('stg_delivery__customer') }} c
    join {{ ref('stg_delivery__nation') }} n on c.customer_nation_id = n.nation_id
    join {{ ref('stg_exchange__exchange_rates') }} e on e.nation_id = n.nation_id
),
shop as (
    select * from {{ ref('stg_delivery__shop') }} s
    join {{ ref('stg_delivery__nation') }} n on s.shop_nation_id = n.nation_id
    join {{ ref('stg_exchange__exchange_rates') }} e on e.nation_id = n.nation_id
),
events as (
    select * from {{ ref('stg_delivery__sales_event') }}
),
sales as (
    select 
        {{ order_type ('l.returnflag') }} as order_type,
        o.order_id,
        c.customer_nation_id,
        CONVERT_TIMEZONE('UTC', c.time_zone, o.order_date) as customer_date,
        shop.shop_nation_id,
        CONVERT_TIMEZONE('UTC', shop.time_zone, o.order_date) as shop_date,
        e.event_id,
        l.returnflag,
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
        l.supplier_id,
        l.part_id,
        c.customer_id,
        {{ money_converter('l.extendedprice', 'c.rate') }} as customer_item_price,
        {{ money_converter('o.total_price', 'c.rate') }} as customer_total_price,
        c.currency_to,
        shop.shop_id,
        {{ money_converter('l.extendedprice', 'shop.rate') }} as shop_item_price,
        {{ money_converter('o.total_price', 'shop.rate') }} as shop_total_price,
        shop.currency_to,
        l.extendedprice,
        o.total_price as total_price_default,
        'USD' as currency,
        o.updated_at


    from
        lineitem l
    join orders o on o.order_id = l.order_id
    join customer c on c.customer_id = o.customer_id
    join shop on shop.shop_id = o.shop_id
    left join events e ON e.nation_id = shop.shop_nation_id
        AND o.order_date between e.start_date and e.end_date

),
final as (
    select
        *
    from
        sales
    )
select * from final