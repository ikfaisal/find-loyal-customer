USE [Olist]
GO

/****** Object:  View [dbo].[OlistDataFrame]    Script Date: 2/27/2019 8:16:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[OlistDataFrame]
AS
SELECT        dbo.CustomerLocationView.customer_id, dbo.CustomerLocationView.customer_unique_id, dbo.CustomerLocationView.customer_zip_code_prefix, dbo.CustomerLocationView.customer_city, 
                         dbo.CustomerLocationView.customer_state, dbo.SellersLocationView.geolocation_lng AS customer_geolocation_lng, dbo.SellersLocationView.geolocation_lat AS customer_geolocation_lat, dbo.olist_orders_dataset.order_id, 
                         dbo.olist_orders_dataset.order_status, CAST(dbo.olist_orders_dataset.order_purchase_timestamp AS DATETIME) AS order_purchase_timestamp, CAST(dbo.olist_orders_dataset.order_approved_at AS DATETIME) 
                         AS order_approved_at, CAST(dbo.olist_orders_dataset.order_delivered_carrier_date AS DATETIME) AS order_delivered_carrier_date, CAST(dbo.olist_orders_dataset.order_delivered_customer_date AS DATETIME) 
                         AS order_delivered_customer_date, CAST(dbo.olist_orders_dataset.order_estimated_delivery_date AS DATETIME) AS order_estimated_delivery_date, CAST(dbo.olist_order_items_dataset.order_item_id AS INT) 
                         AS order_item_id, CAST(dbo.olist_order_items_dataset.shipping_limit_date AS DATETIME) AS shipping_limit_date, CAST(dbo.olist_order_items_dataset.price AS FLOAT) AS price, 
                         CAST(dbo.olist_order_items_dataset.freight_value AS FLOAT) AS freight_value, dbo.SellersLocationView.seller_id, dbo.SellersLocationView.seller_zip_code_prefix, dbo.SellersLocationView.seller_city, 
                         dbo.SellersLocationView.seller_state, dbo.SellersLocationView.geolocation_lng AS seller_geolocation_lng, dbo.SellersLocationView.geolocation_lat AS seller_geolocation_lat, dbo.olist_products_dataset.product_id, 
                         dbo.product_category_name_translation.product_category_name_english, CAST(dbo.olist_products_dataset.product_name_lenght AS FLOAT) AS product_name_lenght, 
                         CAST(dbo.olist_products_dataset.product_description_lenght AS FLOAT) AS product_description_lenght, CAST(dbo.olist_products_dataset.product_photos_qty AS FLOAT) AS product_photos_qty, 
                         CAST(dbo.olist_products_dataset.product_weight_g AS FLOAT) AS product_weight_g, CAST(dbo.olist_products_dataset.product_length_cm AS FLOAT) AS product_length_cm, 
                         CAST(dbo.olist_products_dataset.product_height_cm AS FLOAT) AS product_height_cm, CAST(dbo.olist_products_dataset.product_width_cm AS FLOAT) AS product_width_cm, 
                         CAST(dbo.olist_order_payments_dataset.payment_sequential AS FLOAT) AS payment_sequential, dbo.olist_order_payments_dataset.payment_type, CAST(dbo.olist_order_payments_dataset.payment_installments AS FLOAT) 
                         AS payment_installments, CAST(dbo.olist_order_payments_dataset.payment_value AS FLOAT) AS payment_value, dbo.olist_order_reviews_dataset.review_id, dbo.olist_order_reviews_dataset.review_score, 
                         dbo.olist_order_reviews_dataset.review_comment_title, dbo.olist_order_reviews_dataset.review_comment_message, dbo.olist_order_reviews_dataset.review_creation_date, 
                         dbo.olist_order_reviews_dataset.review_answer_timestamp
FROM            dbo.CustomerLocationView INNER JOIN
                         dbo.olist_orders_dataset ON dbo.olist_orders_dataset.customer_id = dbo.CustomerLocationView.customer_id INNER JOIN
                         dbo.olist_order_items_dataset ON dbo.olist_order_items_dataset.order_id = dbo.olist_orders_dataset.order_id INNER JOIN
                         dbo.SellersLocationView ON dbo.SellersLocationView.seller_id = dbo.olist_order_items_dataset.seller_id INNER JOIN
                         dbo.olist_products_dataset ON dbo.olist_products_dataset.product_id = dbo.olist_order_items_dataset.product_id INNER JOIN
                         dbo.product_category_name_translation ON dbo.product_category_name_translation.product_category_name = dbo.olist_products_dataset.product_category_name INNER JOIN
                         dbo.olist_order_payments_dataset ON dbo.olist_order_payments_dataset.order_id = dbo.olist_orders_dataset.order_id LEFT OUTER JOIN
                         dbo.olist_order_reviews_dataset ON dbo.olist_order_reviews_dataset.order_id = dbo.olist_orders_dataset.order_id

GO


