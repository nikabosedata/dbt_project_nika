{{
    config(
        alias = 'orders_performance'
        , schema = 'dbt-course-learning'
        , materialized = 'table'
        , cluster_by = ['order_id,user_id']
    )
}}

with order_items as (

    select * from {{ ref('stg_order_items') }}

)

, order_gender_statistics as (

    select * from {{ ref('stg_orders') }}

)

-- joining both order tables together to get all metrics together. 

, orders_overview_joined as (

    select 
        *
     from order items 
    full join order_gender_statistics
        on order_items.date = order_gender_statistics.date
        and order_items.order_id = order_gender_statistics.order_id

) 


select * from orders_overview_joined 

