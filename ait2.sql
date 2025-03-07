drop trigger if exists ait2;
delimiter /
create trigger ait2 before update on applies for each row
begin
declare sd date;
declare cd date;
set cd=curdate();
select start_date into sd from job where id=new.job_id;
if datediff(sd,cd)>10 and new.aitisi="akyromeni" and old.aitisi="energi" then 
set new.aitisi="akyromeni";
else set new.aitisi="energi";
end if;
end/
delimiter ;
INSERT INTO applies (cand_username, job_id, aitisi) VALUES ('user13', 11, 'energi');
INSERT INTO applies (cand_username, job_id, aitisi) VALUES ('user13', 7, 'energi');
UPDATE applies SET aitisi = 'akyromeni' WHERE cand_username = 'user13' AND job_id = 11; -- 23/9 start date ara den akyronetai
UPDATE applies SET aitisi = 'akyromeni' WHERE cand_username = 'user13' AND job_id = 7; -- 15/10 start date akyronetai
SELECT * FROM applies;