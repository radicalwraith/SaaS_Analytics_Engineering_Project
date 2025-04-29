{{ config(
    materialized='view',
    description='Tracks monthly customer retention by identifying returning customers based on initial purchase month.'
) }}


WITH customer_first_purchase AS (
    SELECT
        customer_no,
        MIN(transaction_date) AS first_purchase_date
    FROM
        {{ ref('stg_sales_transactions') }}
    WHERE
        transaction_date IS NOT NULL
    GROUP BY
        customer_no
),

monthly_active_customers AS (
    SELECT
        customer_no,
        FORMAT_DATE('%Y-%m', transaction_date) AS month_year
    FROM
        {{ ref('stg_sales_transactions') }}
    WHERE
        transaction_date IS NOT NULL
)

SELECT
    mac.month_year,
    COUNT(mac.customer_no) AS active_customers,
    COUNT(CASE WHEN DATE_DIFF(PARSE_DATE('%Y-%m', mac.month_year), cf.first_purchase_date, MONTH) > 0 THEN mac.customer_no END) AS retained_customers
FROM
    monthly_active_customers mac
LEFT JOIN
    customer_first_purchase cf
ON
    mac.customer_no = cf.customer_no
GROUP BY
    mac.month_year
ORDER BY
    mac.month_year
