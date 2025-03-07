DELIMITER //
DROP PROCEDURE IF EXISTS insert_on_istoriko_60k //

CREATE PROCEDURE insert_on_istoriko_60k()
BEGIN
DECLARE ev1 VARCHAR(30);
DECLARE ev2 VARCHAR(30);
DECLARE emp VARCHAR(30);
DECLARE res FLOAT;
DECLARE stat VARCHAR(30); 
DECLARE j_id int;
DECLARE i INT DEFAULT 0;
WHILE i<10000 DO
SET ev1 = CONCAT('user', FLOOR(19 + RAND() * 18));
SET ev2 = CONCAT('user', FLOOR(19 + RAND() * 18));
SET emp = CONCAT('user', FLOOR(1 + RAND() * 18));
SET res =  1+ FLOOR(RAND() * 20);
SET stat = 'olokliromeni';
SET j_id = 1 + FLOOR(RAND() * 23);
INSERT INTO istoriko (evaluator1, evaluator2, employee, job_id, evaluation_grade, ait_katastasi) VALUES (ev1 ,ev2 ,emp ,j_id ,res ,stat);
SET i=i+1;
 END WHILE;
END //
delimiter ;
CALL insert_on_istoriko_60k();
CALL insert_on_istoriko_60k();
CALL insert_on_istoriko_60k();
CALL insert_on_istoriko_60k();
CALL insert_on_istoriko_60k();
CALL insert_on_istoriko_60k();

select* from istoriko;
SELECT COUNT(*) FROM istoriko;


