DROP PROCEDURE IF EXISTS check_evaluation;
DELIMITER //
CREATE PROCEDURE check_evaluation(
    IN evaluator_username VARCHAR(30), 
    IN employee_username VARCHAR(30), 
    IN job_id_check INT

)
BEGIN
    DECLARE eval_count INT;
    DECLARE ev INT;
    DECLARE evaluation_grade1 int;

    SELECT COUNT(*)
    INTO eval_count
    FROM istoriko
    WHERE (evaluator1 = evaluator_username OR evaluator2 = evaluator_username)
      AND employee = employee_username
      AND job_id = job_id_check;

    IF eval_count = 0 THEN
        SET evaluation_grade1 = 0;
    ELSE
        SELECT evaluation_grade
        INTO evaluation_grade1
        FROM istoriko
        WHERE (evaluator1 = evaluator_username OR evaluator2 = evaluator_username)
          AND employee = employee_username
          AND job_id = job_id_check;
    END IF;

 select evaluation_grade1;
END;
//
DELIMITER ;

INSERT INTO istoriko (evaluator1, evaluator2, employee, job_id, evaluation_grade, ait_katastasi) VALUES (NULL , NULL , "user15" , 10 , 4 ,"olokliromeni");
INSERT INTO istoriko (evaluator1, evaluator2, employee, job_id, evaluation_grade, ait_katastasi) VALUES ("user27" ,"user28" , "user16" , 11 , 15 ,"olokliromeni");
call check_evaluation ("user20","user15", 10);
call check_evaluation ("user28","user16",11);
