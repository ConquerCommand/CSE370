CREATE DATABASE Company_23201003;
use Company_23201003;
create table employee
(
	employee_id char(10),
	first_name varchar(20),
	last_name varchar(20),
	email varchar(60),
	phone_number char(14),
	hire_date date,
	job_id char(10),
	salary int,
	commission_pct decimal(5,3),
	manager_id char(10),
	department_id char(10)
);
INSERT INTO employee values
('EMP001','FN001','LN001','EMA001','PHN001','2000-01-01','JOB001',001,0.001,'MNG001','DPT001'),
('EMP002','FN002','LN002','EMA002','PHN002','2000-01-02','JOB002',002,0.002,'MNG002','DPT002'),
('EMP003','FN003','LN003','EMA003','PHN003','2000-01-03','JOB003',003,0.003,'MNG003','DPT003'),
('EMP004','FN004','LN004','EMA004','PHN004','2000-01-04','JOB004',004,0.004,'MNG004','DPT004'),
('EMP005','FN005','LN005','EMA005','PHN005','2000-01-05','JOB005',005,0.005,'MNG005','DPT005'),
('EMP006','FN006','LN006','EMA006','PHN006','2000-01-06','JOB006',006,0.006,'MNG006','DPT006'),
('EMP007','FN007','LN007','EMA007','PHN007','2000-01-07','JOB007',007,0.007,'MNG007','DPT007'),
('EMP008','FN008','LN008','EMA008','PHN008','2000-01-08','JOB008',008,0.008,'MNG008','DPT008'),
('EMP009','FN009','LN009','EMA009','PHN009','2000-01-09','JOB009',009,0.009,'MNG009','DPT009'),
('EMP010','FN010','LN010','EMA010','PHN010','2000-01-10','JOB010',010,0.010,'MNG010','DPT010'); 
select first_name,last_name,email,phone_number,hire_date,department_id from employee 
where hire_date=(select max(hire_date)from employee);
select first_name,last_name,employee_id,phone_number,salary,department_id from employee e1 
where salary=(select min(salary)from employee e2 where e2.department_id = e1.department_id); 
select first_name,last_name,employee_id,commission_pct,department_id from employee
where department_id='DPT007' and commission_pct<all(select commission_pct from employee where department_id='DPT005');
select department_id, count(*) as total_employees from employee
group by department_id having max(salary)<=30000;
select department_id,job_id,commission_pct from employee e1 where commission_pct<any
(select commission_pct from employee e2 where e2.department_id=e1.department_id and e2.job_id!=e1.job_id);
select manager_id from employee group by manager_id having min(salary)>=3500;
select first_name,last_name,employee_id,email,salary,department_id,commission_pct from employee e1
where commission_pct=(select min(commission_pct) from employee e2 where e2.manager_id=e1.manager_id);
