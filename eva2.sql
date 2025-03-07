DROP TRIGGER IF EXISTS automatic_evaluation;
DELIMITER //

CREATE TRIGGER automatic_evaluation BEFORE INSERT ON automatic_examination FOR EACH ROW
BEGIN 
DECLARE num_of_lang INT DEFAULT 0;
DECLARE num_of_BSc INT DEFAULT 0;
DECLARE num_of_MSc INT DEFAULT 0;
DECLARE num_of_PhD INT DEFAULT 0;
DECLARE num_of_project INT DEFAULT 0;
DECLARE auto_grade INT DEFAULT 0;
DECLARE v INT DEFAULT 0;
SELECT examination.grade into v from examination INNER JOIN automatic_examination ON automatic_examination.applicant_username = examination.applicant_username WHERE automatic_examination.applicant_username = examination.applicant_username ;
SELECT COUNT(*) INTO num_of_lang FROM languages INNER JOIN automatic_examination ON automatic_examination.applicant_username = candid WHERE candid = automatic_examination.applicant_username;
SELECT COUNT(*) INTO num_of_MSc FROM has_degree INNER JOIN degree ON degr_title = titlos INNER JOIN automatic_examination ON automatic_examination.applicant_username = cand_usrname WHERE cand_usrname = automatic_examination.applicant_username AND degree.bathmida = 'MSc';
SELECT COUNT(*) INTO num_of_BSc FROM has_degree INNER JOIN degree ON degr_title = titlos INNER JOIN automatic_examination ON automatic_examination.applicant_username = cand_usrname WHERE cand_usrname = automatic_examination.applicant_username AND degree.bathmida = 'BSc';
SELECT COUNT(*) INTO num_of_PhD FROM has_degree INNER JOIN degree ON degr_title = titlos INNER JOIN automatic_examination ON automatic_examination.applicant_username = cand_usrname WHERE cand_usrname = automatic_examination.applicant_username AND degree.bathmida = 'PhD';
SELECT COUNT(*) INTO num_of_project FROM project INNER JOIN automatic_examination ON automatic_examination.applicant_username = candid WHERE candid = automatic_examination.applicant_username;
IF num_of_lang >=1 THEN
SET num_of_lang=1;
ELSE SET num_of_lang=0;
END IF;
IF V=0 THEN
SET auto_grade = num_of_BSc + num_of_MSc * 2 + num_of_PhD * 3 + num_of_lang + num_of_project;
ELSE  
SET auto_grade = v + num_of_BSc + num_of_MSc * 2 + num_of_PhD * 3 + num_of_lang + num_of_project;
SET auto_grade =  CEIL(auto_grade/2);
end if;

UPDATE examination INNER JOIN automatic_examination ON automatic_examination.applicant_username = examination.applicant_username
SET  examination.grade = auto_grade 
WHERE examination.applicant_username = automatic_examination.applicant_username;
END//

DELIMITER ;