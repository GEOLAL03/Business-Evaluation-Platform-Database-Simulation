DELIMITER //

DROP PROCEDURE IF EXISTS insert_on_istoriko //

CREATE PROCEDURE insert_on_istoriko()
BEGIN
DECLARE ev1 VARCHAR(30);
DECLARE ev2 VARCHAR(30);
DECLARE emp VARCHAR(30);
DECLARE res FLOAT;
DECLARE stat VARCHAR(30); 
DECLARE id int;
DECLARE done INT DEFAULT 0;
DECLARE insert_cursor CURSOR FOR 
SELECT evaluator1_username, evaluator2_username, applicant_username, job_id, grade, aitisi FROM applies INNER JOIN examination ON cand_username = applicant_username WHERE aitisi = 'olokliromeni';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN insert_cursor;
FETCH insert_cursor INTO ev1, ev2, emp, id, res, stat;
WHILE done = 0 DO
INSERT INTO istoriko (evaluator1, evaluator2, employee, job_id, evaluation_grade, ait_katastasi) VALUES (ev1, ev2, emp, id, res, stat);
FETCH insert_cursor INTO ev1, ev2, emp, id, res, stat;
END WHILE;
CLOSE insert_cursor;
END //

DELIMITER ;

CALL insert_on_istoriko;
SELECT * FROM istoriko;