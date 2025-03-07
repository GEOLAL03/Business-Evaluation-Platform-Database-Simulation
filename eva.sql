delimiter /
drop procedure if exists evaluation/
create procedure evaluation(in eval1_name varchar(30), in eval2_name varchar(30), in employee_name varchar(30),in job_id int)
begin
declare result float;
declare ev1_name varchar(30);
declare ev2_name varchar(30);
declare emp_name varchar(30);
declare aitisi_id int;
declare aitisi2_id int;
declare j_id int;
declare v1 int;
declare v2 int;
declare ait enum("energi","olokliromeni","akyromeni");
select username into ev1_name from  evaluator  where evaluator.username = eval1_name;
select username into ev2_name from evaluator where evaluator.username=eval2_name and eval2_name<>eval1_name;
select username into emp_name from employee  where username=employee_name;
select ait_id into aitisi_id from examination inner join applies on examination.ait_id=applies.id where applies.cand_username=emp_name and examination.evaluator1_username=eval1_name and examination.evaluator2_username=eval2_name;
select job_id into j_id from applies where id=aitisi_id;
select aitisi into ait from applies where id=aitisi_id;
select id into aitisi2_id from applies where job_id=id;

if  ait= "akyromeni" then set result = 0;
SET ait= "olokliromeni";
end if;

if ev1_name IS NULL AND ev2_name IS NULL THEN SET result=0;
SET ait= "olokliromeni";
INSERT INTO automatic_examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
(ev1_name, ev2_name, emp_name, aitisi2_id, result);
INSERT INTO examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
(ev1_name, ev2_name, emp_name, aitisi2_id, result);
end if;

IF ev1_name IS NULL AND ev2_name IS NOT NULL THEN 
set result = FLOOR(RAND() * 21);
set ait= "olokliromeni";
INSERT INTO  automatic_examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
(ev1_name, ev2_name, emp_name, aitisi2_id, result);
INSERT INTO examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
(ev1_name, ev2_name, emp_name, aitisi2_id, result);
end if;

if ev2_name IS NULL AND ev1_name IS NOT NULL THEN 
set result = FLOOR(RAND() * 21);
set ait="olokliromeni";
INSERT INTO   automatic_examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
(ev1_name, ev2_name, emp_name, aitisi2_id, result);
INSERT INTO examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
(ev1_name, ev2_name, emp_name, aitisi2_id, result);
end if;

IF ev1_name IS NOT NULL and ev2_name IS NOT NULL THEN
 set v1 = FLOOR(RAND() * 21);
 set v2 = FLOOR(RAND() * 21);
 SET result = (v1 + v2);
 SET result = (result >> 1);
 SET ait= "olokliromeni";
 INSERT INTO examination (evaluator1_username, evaluator2_username, applicant_username, ait_id, grade) VALUES
(ev1_name, ev2_name, emp_name, aitisi2_id, result);
 END IF;
 
end/
delimiter ;
CALL evaluation("user29", NULL, "user14", 23);
CALL evaluation(NULL, NULL, "user13", 22);
CALL evaluation("user27", "user30","user18",17);
SELECT * from examination ;
SELECT * from  automatic_examination;