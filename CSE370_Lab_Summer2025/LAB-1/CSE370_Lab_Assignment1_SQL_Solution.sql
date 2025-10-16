CREATE DATABASE Google_23201003;
USE Google_23201003;
CREATE TABLE Developers
(
    member_id int,
    name varchar(30),
    email varchar(30),
    influence_count int,
    Joining_date date,
    multiplier int
);
INSERT INTO Developers (member_id, name, email, influence_count, Joining_date, multiplier ) values
(1, 'Taylor Otwell', 'otwell@laravel.com', 739360, '2020-6-10', '10') ,
(2, 'Ryan Dahl', 'ryan@nodejs.org', 633632, '2020-04-22', '10') ,
(3, 'Brendan Eich', 'eich@javascript.com', 939570, '2020-05-07', '8'), 
(4, 'Evan You', 'you@vuejs.org', 982630, '2020-06-11', '7') ,
(5, 'Rasmus Lerdorf', 'lerdorf@php.net', 937927, '2020-06-3', '8'), 
(6, 'Guido van Rossum', 'guido@python.org', 968827, '2020-07-18', '19'), 
(7, 'Adrian Holovaty', 'adrian@djangoproject.com', 570724, '2020-05-07', '5'), 
(8, 'Simon Willison', 'simon@djangoproject.com', 864615, '2020-04-30', '4') ,
(9, 'James Gosling', 'james@java.com', 719491, '2020-05-18', '5') ,
(10, 'Rod Johnson', 'rod@spring.io', 601744, '2020-05-18', '7') ,
(11, 'Satoshi Nakamoto', 'nakamoto@blockchain.com', 630488, '2020-05-10', '10');
alter table Developers rename column influence_count to followers;
set sql_safe_updates=0;
update Developers set followers = followers + 10;
select name,((followers*100/1000000)*(multiplier*100/20))/100 as Efficiency from Developers;
select upper(name) from Developers order by Joining_date;
select member_id,name,email,followers from Developers where email like '%.com%' or email like '%.net%';


