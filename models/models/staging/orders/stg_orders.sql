with source as (

    select * from {{ source('thelookecommerce', 'orders') }}

)
--adding comment to ensure 
, orders as (

    select
         created_at as date 
        , order_id 
        , user_id 
        , status
        , gender
        , shipped_at as shipping_date
        , delivered_at as delivery_date
        , returned_at as return_date 
        ,  num_of_item as number_of_items
    from source

)
-- creating a CTE that filters out certain fields since they exist in another table. 

, orders_filtered as (

    select
        date
        , order_id 
        , gender 
        , number_of_items
    from orders
)

select * from orders_filtered
