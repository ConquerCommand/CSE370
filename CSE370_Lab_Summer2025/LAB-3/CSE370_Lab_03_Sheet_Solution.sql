CREATE DATABASE Bank_23201003;
USE Bank_23201003;
create table customer (
customer_id varchar(10) not null, 
customer_name varchar(20) not null, 
customer_street varchar(30), 
customer_city varchar(30), 
primary key (customer_id));
create table branch (
branch_name varchar(15), 
branch_city varchar(30), 
assets int, 
primary key (branch_name), 
check (assets >= 0));
create table account (
branch_name varchar(15),
account_number varchar(10) not null,
balance int,
primary key (account_number),
check (balance >= 0));
create table loan (
loan_number varchar(10) not null,
branch_name varchar(15),
amount int,
primary key (loan_number));
create table depositor (
customer_id varchar(10) not null,
account_number varchar(10) not null,
primary key (customer_id,account_number),
foreign key (customer_id) references customer(customer_id),
foreign key (account_number) references account(account_number));
create table borrower (
customer_id varchar(10) not null,
loan_number varchar(10) not null,
primary key (customer_id, loan_number),
foreign key (customer_id) references customer(customer_id),
foreign key (loan_number) references loan(loan_number));
insert into customer values 
('C-101','Jones', 'Main', 'Harrison'), 
('C-201','Smith', 'North', 'Rye'),
('C-211','Hayes', 'Main', 'Harrison'), 
('C-212','Curry', 'North', 'Rye'),
('C-215','Lindsay', 'Park', 'Pittsfield'),
('C-220','Turner', 'Putnam', 'Stamford'),
('C-222','Williams', 'Nassau', 'Princeton'),
('C-225','Adams', 'Spring', 'Pittsfield'),
('C-226','Johnson', 'Alma', 'Palo Alto'),
('C-233','Glenn', 'Sand Hill', 'Woodside'),
('C-234','Brooks', 'Senator', 'Brooklyn'),
('C-255','Green', 'Walnut', 'Stamford');
insert into branch values 
('Downtown', 'Brooklyn',9000000), 
('Redwood', 'Palo Alto',2100000), 
('Perryridge', 'Horseneck',1700000), 
('Mianus', 'Horseneck',400000), 
('Round Hill', 'Horseneck',8000000), 
('Pownal', 'Bennington',300000), 
('North Town', 'Rye',3700000), 
('Brighton', 'Brooklyn',7100000);
insert into account values 
('Downtown','A-101',500), 
('Mianus','A-215',700) ,
('Perryridge','A-102',400), 
('Round Hill','A-305',350), 
('Brighton','A-201',900), 
('Redwood','A-222',700), 
('Brighton','A-217',750);
insert into loan values 
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000), 
('L-15', 'Perryridge', 1500), 
('L-14', 'Downtown', 1500), 
('L-93', 'Mianus', 500), 
('L-11', 'Round Hill', 900), 
('L-16', 'Perryridge', 1300);
insert into depositor values 
('C-226', 'A-101'), 
('C-201', 'A-215'), 
('C-211', 'A-102'), 
('C-220', 'A-305'), 
('C-226', 'A-201'), 
('C-101', 'A-217'),
('C-215', 'A-222');
insert into borrower values 
('C-101', 'L-17'), 
('C-201', 'L-23'), 
('C-211', 'L-15'), 
('C-226', 'L-14'), 
('C-212', 'L-93'), 
('C-201', 'L-11'), 
('C-222', 'L-17'), 
('C-225', 'L-16');
#select * from table1 inner join table2 on table1.attribute=table2.attribute;
#Select * from ((Tablel inner join Table2 on Tablel.attribute=Table2.attribute) 
#			   inner join Table3 on Table3.attribute = Tablel.attribute);
#Select * from T1, T2 where T1.attr=T2.attr / other conditions;
select c.customer_name, c.customer_city from customer c,borrower b,loan l 
where c.customer_id=b.customer_id and b.loan_number = l.loan_number and l.branch_name = 'Perryridge';
select * from account where balance between 700 and 900;
select customer_name from customer c where customer_street like '%Hill';
select branch_name from branch where assets>any(select assets from branch where branch_city='Brooklyn');
select branch_name from branch where assets>all(select assets from branch where branch_city='Horseneck');
select customer_name from customer c,depositor d,account a 
where c.customer_id = d.customer_id and d.account_number = a.account_number and branch_name='Brighton' 
order by c.customer_name;
select * from loan order by amount desc, loan_number asc;
select branch_name from account group by branch_name having avg(balance)>=700; 
select distinct c.customer_name, d.account_number from customer c,depositor d,account a 
where c.customer_id = d.customer_id and d.account_number = a.account_numbe and 
      a.balance in(select distinct balance from account order by balance desc limit 3);


select c.customer_name from customer c,depositor d,account a
where c.customer_id=d.customer_id and d.account_number=a.account_number and a.branch_name in(
    select a1.branch_name from customer c1, depositor d1, account a1
    where c1.customer_id=d1.customer_id and d1.account_number=a1.account_number and c1.customer_name='Johnson');

select c.customer_name from customer c,depositor d,account a 
where c.customer_id = d.customer_id and d.account_number = a.account_number and a.branch_name = 'Mianus' and 
    c.customer_id not in (select b.customer_id from borrower b, loan l where b.loan_number = l.loan_number and l.branch_name = 'Mianus');

select b.branch_name,COUNT(DISTINCT d.customer_id) from branch b,account a,depositor d 
where b.branch_name = a.branch_name and a.account_number = d.account_number group by b.branch_name;

select AVG(a.balance) from customer c,account a,depositor d 
where a.account_number = d.account_number and d.customer_id = c.customer_id and c.customer_city = 'Palo Alto' and
d.customer_id in (select customer_id from depositor group by customer_id having COUNT(*) >= 2);

SELECT c.customer_name,a.account_number from customer c,account a,depositor d 
where a.account_number = d.account_number and d.customer_id = c.customer_id order by a.balance desc
limit 1 offset 2;

