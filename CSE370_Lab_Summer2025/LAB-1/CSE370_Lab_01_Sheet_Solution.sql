show databases;
CREATE DATABASE CSE370Lab01;
USE CSE370Lab01;
CREATE TABLE Lab_Grades
(
     std_id char(4),
     name varchar(30),
     major char(3),
     section char(1),
     days_present int,
     project_marks double,
     cgpa decimal(3,2),
     submission_date date
);
INSERT INTO Lab_Grades values
('s001', 'Abir', 'CS', '1', 10, 18.5, 3.91, '2018-09-15'),
('s002', 'Nafis', 'CSE', '1', 12, 20, 3.86, '2018-08-15'),
('s003', 'Tasneem', 'CS', '1', 8, 18, 3.57, '2018-09-18'),
('s004', 'Nahid', 'ECE', '2', 7, 16.5, 3.25, '2018-08-20'),
('s005', 'Arafat', 'CS', '2', 11, 20, 4, '2018-09-13'),
('s006', 'Tasneem', 'CSE', '1', 12, 17.5, 3.7, '2018-08-15'),
('s007', 'Muhtadi', 'ECE', '1', 10, 19, 3.67, '2018-09-16'),
('S008', 'Farhana', 'CSE', '2', 6, 15, 2.67, '2018-08-16'),
('s009', 'Naima', 'CSE', '2', 12, 20, 3.7, '2018-08-14');
show tables;
describe lab_grades;
select * from lab_grades;
alter table lab_grades add project_title char(10);
alter table lab_grades modify column project_title varchar(50);
alter table lab_grades drop column project_titel;
set sql_safe_updates=0;
update Lab_Grades set major = 'CSE' where name = 'Arafat';
update lab_grades set name='Naheed',project_marks=16 where std_id='s004';
delete from lab_grades where name='Naima';
delete from lab_grades where days_present<8;
drop table lab_grades;
drop database CSE370Lab01;
select std_id,name,project_marks from lab_grades; 
select name,project_marks+days_present*5/12 as total_marks from lab_grades;
select upper(name),lower(name) from lab_grades;
select major from lab_grades;
select distinct major from lab_grades;
select * from lab_grades order by name;
select * from lab_grades order by name desc, submission_date asc;
select name,project_marks from lab_grades where major='CSE';
select name,project_marks from lab_grades where project_marks between 17 and 18;
select * from lab_grades where major in ('CSE','CS');
select * from lab_grades where project_marks>18 and submission_date between '2018-08-01' and '2018-08-31';
select * from lab_grades where name like '%a';
select * from lab_grades where name like '%a%a';






