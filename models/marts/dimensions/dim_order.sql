with orders as (
    select * from {{ ref('stg_delivery__orders') }}
),
final as (
    select
        order_id,
        customer_id,
        order_status,
        total_price,
        order_date,
        order_priority,
        SUBSTRING(clerk, CHARINDEX('#', clerk) + 1 , len(clerk)) as clerk,
        ship_priority,
        shop_id,
        updated_at
    from
        orders
    
)
select * from final