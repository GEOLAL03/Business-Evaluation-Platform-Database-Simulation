DELIMITER $$
DROP PROCEDURE IF EXISTS GetEvaluationsByEvaluator$$

CREATE PROCEDURE GetEvaluationsByEvaluator(
    IN eval_username VARCHAR(30)
)
BEGIN
    SELECT
		employee AS employee_username,
        job_id
    FROM
        istoriko
    WHERE
       evaluator1 = eval_username
        OR evaluator2 = eval_username;
END$$

DELIMITER ;
EXPLAIN
SELECT
    i.employee AS employee_username,
    i.job_id
FROM
    istoriko i
WHERE
    i.evaluator1 = 'user19'
    OR i.evaluator2 = 'user20';

