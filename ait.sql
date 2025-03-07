SET SQL_SAFE_UPDATES = 0;

DROP PROCEDURE IF EXISTS complete;
DELIMITER /
CREATE PROCEDURE complete() 
BEGIN
	DECLARE sd DATE;
    DECLARE cd DATE;
	SET cd = CURDATE();
UPDATE applies
JOIN job ON applies.job_id = job.id
    SET aitisi = 'olokliromeni'
    WHERE aitisi = 'energi' 
		AND DATEDIFF(job.start_date, cd) <= 0
        AND applies.job_id = job.id;
END /
DELIMITER ;




DROP TRIGGER IF EXISTS ait;
DELIMITER /

CREATE TRIGGER ait BEFORE INSERT ON applies FOR EACH ROW
BEGIN
    DECLARE sd DATE;
    DECLARE cd DATE;
    SET cd = CURDATE();
    SELECT start_date INTO sd FROM job WHERE id = NEW.job_id;
    IF DATEDIFF(sd, cd) >= 15 THEN 
        SET NEW.aitisi = 'energi';
    END IF;
    IF DATEDIFF(sd, cd) <15 AND DATEDIFF(sd, cd) > 0 THEN
		SET NEW.aitisi = 'akyromeni';
	END IF;
END /
DELIMITER ;
INSERT INTO applies(cand_username, job_id, aitisi) 
VALUES('user1', 11, 'energi');
INSERT INTO applies(cand_username, job_id, aitisi)
VALUES('user2', 7, 'energi');
INSERT INTO applies(cand_username, job_id, aitisi)
VALUES('user3', 3, 'energi');
CALL complete();
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM applies;