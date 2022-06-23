with source as (

    select * from {{ source('thelookecommerce', 'order_items') }}

)

, order_items as (

    select
         created_at as date
        , order_id 
        , user_id 
        , product_id
        , inventory_item_id
        , shipped_at as shipping_date
        , delivered_at as delivery_date
        , returned_at as return_date 
        , status
        , sale_price as order_price
    from source
)

select * from order_items
