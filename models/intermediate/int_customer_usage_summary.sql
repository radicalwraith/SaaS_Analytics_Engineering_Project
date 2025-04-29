{{ config(
    materialized='view',
    description='Summarizes customer behavior including total transactions, quantity purchased, and total revenue contributed.'
) }}


WITH customer_summary AS (
    SELECT
        customer_no,
        COUNT(transaction_no) AS total_transactions,
        SUM(SAFE_CAST(quantity AS INT64)) AS total_quantity,
        SUM(SAFE_CAST(price AS FLOAT64) * SAFE_CAST(quantity AS INT64)) AS total_revenue
    FROM
        {{ ref('stg_sales_transactions') }}
    WHERE
        transaction_date IS NOT NULL
    GROUP BY
        customer_no
)

SELECT
    customer_no,
    total_transactions,
    total_quantity,
    total_revenue
FROM
    customer_summary
ORDER BY
    total_revenue DESC
