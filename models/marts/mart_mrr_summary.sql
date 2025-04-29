{{ config(
    materialized='view',
    description='Calculates monthly recurring revenue (MRR) and revenue per active customer for financial insights.'
) }}


WITH revenue_data AS (
    SELECT
        month_year,
        monthly_revenue
    FROM {{ ref('int_monthly_revenue') }}
),

user_data AS (
    SELECT
        month_year,
        monthly_active_users
    FROM {{ ref('int_monthly_active_users') }}
)

SELECT
    revenue_data.month_year,
    revenue_data.monthly_revenue,
    ROUND(SAFE_DIVIDE(revenue_data.monthly_revenue, user_data.monthly_active_users), 2) AS revenue_per_active_user
FROM
    revenue_data
LEFT JOIN
    user_data
ON
    revenue_data.month_year = user_data.month_year
ORDER BY
    revenue_data.month_year
