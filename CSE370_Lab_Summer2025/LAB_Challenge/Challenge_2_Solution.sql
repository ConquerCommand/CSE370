create database DC_Battles;
use DC_Battles;
create table Heroes(
Hero_id varchar(3),
Name varchar(30),
Location varchar(30),
Primary key(Hero_id));
create table Villains(
Villain_id  varchar(3),
Name varchar(30),
Location varchar(30),
Primary key(Villain_id));
create table Battles(
Battle_id varchar(3),
Hero_id varchar(3),
Villain_id varchar(3),
Battle_Date date,
Hero_points int,
Villain_points int,
Battle_location varchar(30),
Primary key(Battle_id),
Foreign key(Hero_id) references Heroes(Hero_id),
Foreign key(Villain_id) references Villains(Villain_id));
insert into Heroes values
('h01', 'The Flash', 'Central City'),
('h02', 'Batman', 'Gotham'),
('h03', 'Green Arrow', 'Star City'),
('h04', 'Wonder Woman', 'Themyscira'),
('h05', 'Green Lantern', 'Coast City'),
('h06', 'Black Canary', 'Star City');
insert into Villains values
('v01', 'Reverse Flash', 'Central City'),
('v02', 'Deathstroke', 'Star City'),
('v03', 'Joker', 'Gotham'),
('v04', 'Riddler', 'Gotham'),
('v05', 'Harley Quinn', 'Gotham'),
('v06', 'Ares', 'Mount Olympus');
insert into Battles values
('b01', 'h01', 'v01', '2017-12-12', 85, 90, 'Central City'),
('b02', 'h01', 'v06', '2016-10-09', 40, 98, 'Metropolis'),
('b03', 'h03', 'v02', '2018-06-11', 90, 93, 'Star City'),
('b04', 'h04', 'v06', '2016-10-10', 99, 98, 'Central City'),
('b05', 'h06', 'v05', '2018-07-08', 92, 85, 'Star City'),
('b06', 'h03', 'v02', '2017-06-11', 90, 88, 'Star City');

#a
select h.name, avg(b.hero_points) average_point from heroes h, battles b 
where h.hero_id=b.hero_id group by h.name,h.hero_id;
#b
select h.name,v.name,b.battle_date,b.battle_location from heroes h, villains v, battles b
where h.hero_id=b.hero_id and v.villain_id=b.villain_id and b.hero_points<b.villain_points;
#c
select v.name from villains v, battles b where v.villain_id=b.villain_id 
group by v.villain_id having count(b.hero_id)>1;
#d
select distinct v.name from villains v, battles b where v.location!=b.battle_location ;
#e
set SQL_SAFE_UPDATES = 0;
update battles set villain_points=Villain_points*0.8
where villain_id =(select villain_id from villains where name='Reverse Flash');
#f
select h.name from heroes h, battles b where h.hero_id=b.hero_id and
b.hero_points=(select max(hero_points) from battles);
#g
select v.name from villains v, battles b where v.villain_id=b.villain_id  and
b.villain_points=(select min(villain_points) from battles);
#h
select v.name from villains v, battles b where v.villain_id=b.villain_id
group by v.villain_id having count(v.villain_id)>1;
#i
select h.name from heroes h, battles b where h.hero_id=b.hero_id
group by h.hero_id having count(distinct b.battle_location)>1;
#j
select v.name from villains v, battles b where v.villain_id=b.villain_id
order by b.villain_points desc limit 3;
#k
select h.name from heroes h, battles b where h.hero_id=b.hero_id
order by b.hero_points asc limit 3;



