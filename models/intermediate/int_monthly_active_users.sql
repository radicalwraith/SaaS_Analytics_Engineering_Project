{{ config(
    materialized='view',
    description='Calculates the number of unique active customers each month based on transaction activity.'
) }}


WITH customer_months AS (
    SELECT
        customer_no,
        FORMAT_DATE('%Y-%m', transaction_date) AS month_year
    FROM
        {{ ref('stg_sales_transactions') }}
    WHERE
        transaction_date IS NOT NULL
)

SELECT
    month_year,
    COUNT(DISTINCT customer_no) AS monthly_active_users
FROM
    customer_months
GROUP BY
    month_year
ORDER BY
    month_year
