CREATE DATABASE CSE370Lab02;
USE CSE370Lab02;
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
('s007', 'Muhtadi', 'ECE', '1', 10, 19, 3.67, '2018-09-16');
select min(cgpa) from lab_grades;
select count(*) as total_students, avg(project_marks) as average_project_marks from lab_grades;
select sum(days_present) from lab_grades;
select major,min(cgpa) as mincgpa,max(cgpa) as maxcgpa from lab_grades group by major; 
select major,count(*) from lab_grades group by major;
select major,min(cgpa) as mincgpa,max(cgpa) as maxcgpa from lab_grades group by major having count(*)>=2;
select major,min(cgpa) as mincgpa,max(cgpa) as maxcgpa from lab_grades where submission_date<='2018-09-15' group by major;
select name from lab_grades where project_marks=(select max(project_marks) from lab_grades);
select * from lab_grades where major='CSE' and cgpa>any(select cgpa from lab_grades where major='CS');
select * from lab_grades where major='CSE' and cgpa>all(select cgpa from lab_grades where major='CS');
select distinct major from lab_grades l1 where exists(select * from lab_grades l2 where l2.major=l1.major and l2.cgpa<3.7);
select name from lab_grades l1 where not exists (select * from lab_grades l2 where l2.std_id!=l1.std_id and l2.project_marks>l1.project_marks);
select name from lab_grades l1 where not exists (select * from lab_grades l2 where l2.std_id!=l1.std_id and l2.project_marks>=l1.project_marks);
select major from lab_grades group by major having count(*)>=all(select count(*) from lab_grades group by major);

