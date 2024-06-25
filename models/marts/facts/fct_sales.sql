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
sales as (
    select 
        o.order_id,
        CONVERT_TIMEZONE('UTC', c.time_zone, o.order_date) as customer_date,
        CONVERT_TIMEZONE('UTC', s.time_zone, o.order_date) as supplier_date,
        CONVERT_TIMEZONE('UTC', shop.time_zone, o.order_date) as shop_date,
        l.linenumber,
        l.quantity,
        l.discount,
        l.tax,
        l.returnflag,
        l.linestatus,
        l.shipdate,
        l.commitdate,
        l.receiptdate,
        l.shipinstruct,
        l.shipmode,
        p.part_id,
        c.customer_id,
        {{ money_converter('l.extendedprice', 'c.currency_rate') }} as customer_item_price,
        {{ money_converter('o.total_price', 'c.currency_rate') }} as customer_total_price,
        c.currency as customer_currency,
        s.supplier_id,
        {{ money_converter('l.extendedprice', 's.currency_rate') }} as supplier_item_price,
        {{ money_converter('o.total_price', 's.currency_rate') }} as supplier_total_price,
        s.currency as supplier_currency.
        {{ money_converter('l.extendedprice', 'shop.currency_rate') }} as shop_item_price,
        {{ money_converter('o.total_price', 'shop.currency_rate') }} as shop_total_price,
        shop.currency as shop_currency
       
    from
        {{ ref('stg_delivery__lineitem') }} l
    join orders o on o.order_id = l.order_id
    join part p on p.part_id = l.part_id
    join supplier s on s.supplier_id = l.supplier_id
    join customer c on c.customer_id = o.customer_id
    join shop on shop.shop_id = o.shop_id
),
final as (
    select
        *
    from
        sales
    )
select * from final