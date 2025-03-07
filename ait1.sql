DROP TRIGGER IF EXISTS ait1;
delimiter /
CREATE TRIGGER ait1 BEFORE INSERT ON applies FOR EACH ROW
BEGIN
DECLARE max_num_of_ait INT;
SELECT count(*) INTO max_num_of_ait FROM applies WHERE cand_username=NEW.cand_username AND aitisi = 'energi';
IF max_num_of_ait>=3 THEN
SET NEW.aitisi='akyromeni';
END IF;
END/
delimiter /
CREATE TRIGGER ait1up BEFORE UPDATE ON applies FOR EACH ROW
BEGIN
DECLARE max_num_of_ait INT;
SELECT count(*) INTO max_num_of_ait FROM applies WHERE cand_username=NEW.cand_username AND aitisi = 'energi';
IF max_num_of_ait>=3 AND OLD.aitisi='akyromeni'THEN
SET NEW.aitisi='akyromeni';
END IF;
END/
delimiter ;
INSERT INTO applies(cand_username,job_id,aitisi) VALUES("user5",2,'energi');
INSERT INTO applies(cand_username,job_id,aitisi) VALUES("user5",3,'energi');
INSERT INTO applies(cand_username,job_id,aitisi) VALUES("user5",4,'energi');
INSERT INTO applies(cand_username,job_id,aitisi) VALUES("user5",5,'energi');
UPDATE applies SET aitisi='energi' where cand_username='user5' and job_id=5;
select * from applies
