delimiter /
drop procedure if exists ex/
create procedure ex(in employee_name varchar(30),in job_id int,in cha enum("i","c","a"))
begin
declare emp_name varchar(30);
declare ch enum("i","c","a");
declare ait enum("energi","olokliromeni","akyromeni");
declare j_id int;
declare ait_id int;
declare ait_id2 int;
set ch=cha;
select username into emp_name from employee where username = employee_name;
select aitisi into ait from applies where cand_username= employee_name;
select id into j_id from job where id = job_id;
select id into ait_id from applies inner join employee on applies.cand_username=employee.username where job_id=j_id and username=employee_name;
if ch="i" then
insert into applies (id,aitisi,cand_username,job_id) values (null, "energi", emp_name, j_id);
select id into ait_id2 from applies inner join employee on applies.cand_username=employee.username where job_id=j_id and username = employee_name;
insert into examination(evaluator1_username, evaluator2_username, applicant_username, ait_id) VALUES (CONCAT('user', FLOOR(19 + RAND() * 18)), CONCAT('user', FLOOR(19 + RAND() * 18)), emp_name, ait_id2);
end if;
if ch="c" then
if ait="energi" then
update applies set aitisi="akyromeni" where id=ait_id;
SELECT 'APPLICATION SUCCESFULY CANCELLED';
else SELECT 'PLEASE SELECT AN ACTIVE APPLICATION';
end if;
END IF;
if ch="a" then
if ait="akyromeni" then
update applies set aitisi="energi" where id=ait_id;
SELECT 'APPLICATION SUCCESFULY RE-ACTIVATED';
else SELECT 'PLEASE SELECT A CANCELED APPLICATION';
end if;
end if;
end/
delimiter ;
call ex("user10",3,"i");
SELECT * FROM APPLIES;
SELECT * FROM EXAMINATION; 