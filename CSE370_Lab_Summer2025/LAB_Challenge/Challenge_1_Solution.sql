create database The_Office;
use The_Office;
create table Employee(
Emp_ID char(4),
Name varchar(50),
Age int, 
Role varchar(30), 
Salary int, 
Joining_Date date);
insert into Employee values 
("E001", "Michael Scott", 40, "Manager", 100000, "1999-09-20"),
("E002", "Jim Harper", 30, "Sales Executive", 60000, "2004-09-30"), 
("E003", "Pam Beesly", 28, "Receptionist", 25000, "2003-09-30" ),
("E004", "Angela Martin", 33, "Accountant", 65000, "2005-09-28" ),
("E005", "Dwight Shrute", 32, "Assistant Manager", 60000, "2003-09-30" ),
("E006", "Kelly Kapoor", 29, "Marketing Executive", 45000, "2003-09-30" ),
("E007", "Andrew Bernard", 30, "Sales Executive", 50000, "2007-05-10" ),
("E008", "Kevin Malone", 28, "Accountant", 60000, "2004-10-30" ),
("E009", "Toby Flender", 35, "HR Manager", 70000, "2004-09-30" ),
("E010", "Phyllis Vance", 40, "Sales Executive", 61000, "1999-09-20" ),
("E011", "Creed Bratton", 50, "Sales Executive", 80000, "1980-06-01" );

#a
select name,role from employee where name like 'a%' or name like '%e';
#b
select * from employee where salary between 40000 and 60000;
#c
select * from employee where Joining_Date< "2000-01-01";
#d
set SQL_SAFE_UPDATES = 0;
update employee set salary=salary*1.05 where role='Sales Executive';
select * from employee where role='Sales Executive';
#e
select salary*0.2 Michael_Bonus from employee where name='Michael Scott';
#f
select * from employee order by salary desc;
#g
select * from employee order by age;
#h
select * from employee where age>35 and Joining_Date <="2003-01-01";
#i
delete from employee where name="Creed Bratton";
#j
select * from employee where role like '%Executive%';
#k
alter table employee change Name Employee_Name varchar(50);
#l
alter table employee add Bonus int;
#m
alter table employee drop Bonus;
#n
select distinct role from employee;




