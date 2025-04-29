{{ config(
    materialized='view',
    description='Identifies top-selling products each month by summing quantity sold.'
) }}


WITH product_sales AS (
    SELECT
        FORMAT_DATE('%Y-%m', transaction_date) AS month_year,
        product_name,
        SUM(SAFE_CAST(quantity AS INT64)) AS total_quantity_sold
    FROM
        {{ ref('stg_sales_transactions') }}
    WHERE
        transaction_date IS NOT NULL
    GROUP BY
        month_year, product_name
)

SELECT
    month_year,
    product_name,
    total_quantity_sold
FROM
    product_sales
ORDER BY
    month_year, total_quantity_sold DESC
