drop database if exists db;
create database  db;
use db;

CREATE TABLE USER(
username VARCHAR(30) NOT NULL,
password VARCHAR(20),
name VARCHAR(25),
lastname VARCHAR(35),
reg_data DATETIME,
email VARCHAR(30),
PRIMARY KEY(username)
);

CREATE TABLE employee (
username VARCHAR(30) NOT NULL,
bio TEXT,
sistatikes VARCHAR(35),
certificates VARCHAR(70),
CONSTRAINT e_u FOREIGN KEY(username) REFERENCES user (username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE languages(
candid VARCHAR(30) NOT NULL,
lang SET('EN','FR','SP','GE','CH','GR') NOT NULL,
PRIMARY KEY(lang,candid),
CONSTRAINT e_l FOREIGN KEY(candid) REFERENCES user (username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE project(
candid VARCHAR(30) NOT NULL,
num TINYINT NOT NULL,
descr TEXT,
url TEXT(60),
PRIMARY KEY(num,candid),
CONSTRAINT e_p FOREIGN KEY(candid) REFERENCES user (username) ON DELETE CASCADE ON UPDATE CASCADE
);

create table degree(
titlos varchar(150) not null,
bathmida enum('BSc','MSc','PhD'),
idryma varchar(150) not null,
primary key(titlos,idryma),
index idx_idryma (idryma)
);

create table has_degree(
degr_title varchar(150)not null,
degr_idryma varchar(150)not null,
cand_usrname varchar(30) not null,
etos year,
grade float,
constraint dh1 foreign key(degr_title, degr_idryma) references degree (titlos, idryma) on delete cascade on update cascade,
constraint eh foreign key(cand_usrname) references user(username) on delete cascade on update cascade  
);

create table etaireia(
afm char(9) not null,
doy varchar(30) not null,
name varchar(35) not null,
tel varchar(10) not null,
street varchar(15) not null,
num int not null,
city varchar(45) not null,
country varchar(15) not null,
primary key(afm)
);

create table evaluator(
username varchar(30) not null,
exp_years tinyint,
firm char(9) not null,
constraint evu foreign key(username) references user(username) on delete cascade on update cascade,
constraint eve foreign key(firm) references etaireia(afm) on delete cascade on update cascade
);

create table job(
id int not null auto_increment,
start_date date not null,
salary float not null,
position varchar(60) not null,
edra varchar(60),
evaluator varchar(30),
announce_date datetime,
submission_date date,
primary key(id),
constraint je foreign key(evaluator) references user(username) on delete cascade on update cascade
);
DROP TABLE IF EXISTS applies;
create table applies(
id int auto_increment not null,
aitisi enum("energi","olokliromeni","akyromeni"),
cand_username varchar(30) not null,
job_id int not null,
primary key(id),
constraint a1 foreign key(cand_username) references user(username) on delete cascade on update cascade,
constraint a2 foreign key(job_id) references job(id) on delete cascade on update cascade
);

create table subject(
title varchar(36) not null,
descr text ,
belongs_to varchar(36),
primary key(title),
constraint sub1 foreign key(belongs_to) references subject(title) on delete cascade on update cascade
);

create table requires(
job_id int not null,
subject_title varchar(36) not null,
constraint r1 foreign key(job_id) references job(id) on delete cascade on update cascade,
constraint r2 foreign key(subject_title) references subject(title) on delete cascade on update cascade
);

create table examination(
evaluator1_username varchar(30),
evaluator2_username varchar(30),
applicant_username varchar(30) ,
ait_id int,
grade int,
constraint ex1 foreign key(evaluator1_username) references user(username) on delete cascade on update cascade,
constraint ex2 foreign key(evaluator2_username) references user(username) on delete cascade on update cascade,
constraint ex3 foreign key(applicant_username) references user(username) on delete cascade on update cascade,
constraint ex4 foreign key(ait_id) references applies(id) on delete cascade on update cascade
);

create table automatic_examination(
evaluator1_username varchar(30),
evaluator2_username varchar(30),
applicant_username varchar(30),
ait_id int,
grade int,
constraint ex5 foreign key(evaluator1_username) references user(username) on delete cascade on update cascade,
constraint ex6 foreign key(evaluator2_username) references user(username) on delete cascade on update cascade,
constraint ex7 foreign key(applicant_username) references user(username) on delete cascade on update cascade,
constraint ex8 foreign key(ait_id) references applies(id) on delete cascade on update cascade
);

create table istoriko(
evaluator1 varchar(30),
evaluator2 varchar(30),
employee varchar(30),
job_id int not null,
evaluation_grade float not null,
ait_katastasi enum("energi","olokliromeni","akyromeni"),
constraint ist foreign key(evaluator1) references user(username) on delete cascade on update cascade ,
constraint ist1 foreign key(evaluator2) references user(username) on delete cascade on update cascade ,
constraint ist2 foreign key(employee) references user(username) on delete cascade on update cascade ,
constraint ist3 foreign key(job_id) references job(id) on delete cascade on update cascade,
INDEX idx_evaluation_grade (evaluation_grade)
);

create table workers(
job_id int,
candid varchar(30),
constraint w1 foreign key(job_id) references job(id) on delete cascade on update cascade,
constraint w2 foreign key(candid) references user(username) on delete cascade on update cascade
);

create table DBA(
username varchar(30) not null,
start_date date not null,
end_date date,
constraint ad foreign key(username) references user(username) on delete cascade on update cascade
);

create table log(
act enum ("INSERT", "UPDATE", "DELETE"),
tab enum ("USER", "JOB", "DEGREE"),
act_date datetime,
administrator VARCHAR(30),
constraint ad1 foreign key(administrator) references user (username) on delete cascade on update cascade
);

