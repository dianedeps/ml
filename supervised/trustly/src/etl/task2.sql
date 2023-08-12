WITH installment_status AS (
    SELECT
        id_user,
        payment_date,
        ROW_NUMBER() OVER (PARTITION BY id_user ORDER BY due_date) AS installment_number,
        CASE
            WHEN status = 'Paid in time' THEN 0
            ELSE 1
        END AS is_delayed
    FROM
        Test
),
consecutive_installments AS (
    SELECT
        id_user,
        installment_number,
        SUM(is_delayed) AS consecutive_delayed
    FROM
        installment_status
    GROUP BY
        id_user,
        installment_number
)
SELECT
    id_user,
    MAX(installment_number - consecutive_delayed) AS "Maximum Consecutive Installments Paid on Time"
FROM
    consecutive_installments
GROUP BY
    id_user;
