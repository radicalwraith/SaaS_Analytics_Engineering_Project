{{ config(
    materialized='view',
    description='Aggregates monthly revenue by summing the total transaction amounts for each month.'
) }}


SELECT
    FORMAT_DATE('%Y-%m', transaction_date) AS month_year,
    SUM(SAFE_CAST(price AS FLOAT64) * SAFE_CAST(quantity AS INT64)) AS monthly_revenue
FROM
    {{ ref('stg_sales_transactions') }}
WHERE
    transaction_date IS NOT NULL
GROUP BY
    FORMAT_DATE('%Y-%m', transaction_date)
ORDER BY
    month_year
