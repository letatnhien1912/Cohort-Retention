-- COHORT ANALYSIS
/* 'Telco Card' is the most product in the Telco group (accounting for more than 99% of the total).
You want to evaluate the quality of user acquisition in 2019 by the retention metric.*/

-- Retrieve the data of "Telco Card"
WITH telco_db AS (SELECT fact19.*
    FROM fact_transaction_2019 AS fact19
        LEFT JOIN dim_scenario AS scen 
        ON fact19.scenario_id = scen.scenario_id)

-- Create a table of the first transaction time of each customer
, first_trans AS (SELECT customer_id, MIN(transaction_time) AS first_transaction_time
    FROM telco_db
    GROUP BY customer_id)

-- Calculate retained_users for each subsequence month of each acquisition month
, retained AS (SELECT MONTH(first_transaction_time) AS acquisition_month,
        DATEDIFF(month,first_transaction_time,transaction_time) AS subsequence_month,
        COUNT(DISTINCT telco.customer_id) AS retained_users
    FROM telco_db AS telco
        LEFT JOIN first_trans AS first 
        ON telco.customer_id = first.customer_id
    GROUP BY MONTH(first_transaction_time), DATEDIFF(month,first_transaction_time,transaction_time))

-- Calculate the retention rate for each subsequence month of each acquisition month
, retention_rate AS (SELECT *, FIRST_VALUE(retained_users) OVER (PARTITION BY acquisition_month ORDER BY subsequence_month) AS original_users,
        FORMAT(retained_users*1.0 / FIRST_VALUE(retained_users) OVER (PARTITION BY acquisition_month ORDER BY subsequence_month),'p') AS retention_rate 
    FROM retained)

-- Pivot the table
SELECT acquisition_month, original_users, [0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11]
FROM (SELECT acquisition_month, subsequence_month, original_users, retention_rate FROM retention_rate) AS unpivot_table
PIVOT (
    MAX(retention_rate) FOR subsequence_month IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11])
) as pivot_table
ORDER BY acquisition_month

