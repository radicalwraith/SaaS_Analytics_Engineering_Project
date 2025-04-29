{{ config(materialized='view') }}

SELECT
    TransactionNo AS transaction_no,
    -- If the Date field is already DATE type, no need to parse
    SAFE_CAST(Date AS DATE) AS transaction_date,
    ProductNo AS product_no,
    ProductName AS product_name,
    Price AS price,
    Quantity AS quantity,
    CustomerNo AS customer_no,
    Country AS country
FROM
    {{ source('raw_data', 'sales_transactions') }}
