DELIMITER $$

CREATE PROCEDURE GetEmployeesByGradeRange(IN MinGrade FLOAT, IN MaxGrade FLOAT)
BEGIN
SELECT employee AS username, job_id FROM istoriko WHERE evaluation_grade BETWEEN MinGrade AND MaxGrade;
END$$
DELIMITER ;
CALL GetEmployeesByGradeRange(7,12);