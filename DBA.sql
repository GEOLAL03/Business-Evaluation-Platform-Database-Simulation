DELIMITER //
DROP TRIGGER if exists DBA_d_i//
CREATE trigger DBA_d_i AFTER INSERT ON degree FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("INSERT", "DEGREE", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_j_i//
CREATE trigger DBA_j_i AFTER INSERT ON job FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("INSERT", "JOB", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_u_i//
CREATE trigger DBA_u_i AFTER INSERT ON user FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("INSERT", "USER", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_d_u//
CREATE trigger DBA_d_u AFTER UPDATE ON degree FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("UPDATE", "DEGREE", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_j_u//
CREATE trigger DBA_j_u AFTER UPDATE ON job FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("UPDATE", "JOB", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_u_u//
CREATE trigger DBA_u_u AFTER UPDATE ON user FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("UPDATE", "USER", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_d_d//
CREATE trigger DBA_d_d AFTER DELETE ON degree FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("DELETE", "DEGREE", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_j_d//
CREATE trigger DBA_j_d AFTER DELETE ON job FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("DELETE", "JOB", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DROP TRIGGER if exists DBA_u_d//
CREATE trigger DBA_u_d AFTER DELETE ON user FOR EACH ROW
BEGIN 
INSERT INTO log (act, tab, act_date, administrator) VALUES ("DELETE", "USER", current_timestamp, CONCAT('user', FLOOR(38 + RAND() * 3)));
END// 
DELIMITER ;
UPDATE USER SET email = 'stefanosch87@gmail.com'WHERE username= "user12";
INSERT INTO user (username) values ("user42");
Delete From user where username= "user42";
UPDATE job Set position = "Marketing Tactician" where id=4;
INSERT INTO job (start_date, salary, position) Values ("2024-08-12","500","Janitor");
Delete from job where id=25;
UPDATE Degree Set titlos ="Παιδαγωγικό" where titlos= "Εκπαίδευση";
INSERT INTO Degree (titlos, bathmida, idryma) values ("Ζαμπονοκοπτική", "BSc", "Πανεπιστήμιο Σάμου");
DELETE FROM Degree where titlos= "Ζαμπονοκοπτική";
SELECT * FROM log;
