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


select c.customer_name,b.loan_number from customer c,borrower b,loan l 
where c.customer_id = b.customer_id and b.loan_number = l.loan_number and l.branch_name = 'Downtown';

select c1.customer_name,c2.customer_name,c1.customer_city from customer c1, customer c2
where c1.customer_city = c2.customer_city and c1.customer_id < c2.customer_id;

SELECT a.branch_name, SUM(a.balance * 0.04) from account a group by a.branch_name;

#select a.account from account a,depositor d,customer c,branch b 
#where a.account_number = d.account_number and d.customer_id = c.customer_id;

#select a.account_number from account a,branch b where a.branch_name=b.branch_name group by b.branch_city;

select a.account_number,b.branch_city from account a,branch b where a.branch_name = b.branch_name and 
(b.branch_city, a.balance) in (select b.branch_city, max(a.balance) from account a,branch b 
where a.branch_name = b.branch_name group by b.branch_city);

select l.loan_number, l.amount, c.customer_name from loan l,borrower b,customer c 
where l.loan_number = b.loan_number and b.customer_id = c.customer_id
order by l.amount asc, l.loan_number desc limit 5;

select distinct c.customer_name from customer c,depositor d,account a,borrower b,loan l 
where c.customer_id = d.customer_id and d.account_number = a.account_number and c.customer_id = b.customer_id and b.loan_number = l.loan_number
and a.branch_name = 'Perryridge' and l.branch_name = 'Perryridge';

select c.customer_name, SUM(l.amount) from customer c,borrower b,loan l 
where c.customer_id = b.customer_id and b.loan_number = l.loan_number
group by c.customer_id, c.customer_name having COUNT(*) >= 2;

