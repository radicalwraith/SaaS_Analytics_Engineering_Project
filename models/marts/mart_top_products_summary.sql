{{ config(
    materialized='view',
    description='Summarizes top products sold each month ranked by total quantity sold.'
) }}


SELECT
    month_year,
    product_name,
    total_quantity_sold
FROM
    {{ ref('int_top_products') }}
WHERE
    total_quantity_sold IS NOT NULL
ORDER BY
    month_year,
    total_quantity_sold DESC
