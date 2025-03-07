DELIMITER $$
DROP PROCEDURE IF EXISTS AssignJobPosition $$
CREATE PROCEDURE AssignJobPosition (IN target_job_id INT)
BEGIN
    DECLARE selected_username VARCHAR(30);

SELECT cand_username INTO selected_username FROM applies JOIN examination  ON applies.id = examination.ait_id WHERE applies.job_id = target_job_id 
GROUP BY applies.cand_username, applies.id ORDER BY AVG (examination.grade) DESC, applies.id ASC LIMIT 1;
INSERT INTO workers (job_id, candid) VALUES (target_job_id, selected_username);

END $$
DELIMITER ;
INSERT INTO applies(cand_username, job_id, aitisi) VALUES
('user16', 23, 'olokliromeni'),
('user17', 23, 'olokliromeni');
INSERT INTO examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
('user25', 'user26', 'user16', 25,  18),
('user27', 'user28', 'user17', 26, 13);
CALL AssignJobPosition(23);  -- o user16 tha parei ti thesi ergasias giati exei to megalytero bathmo
SELECT*FROM workers;