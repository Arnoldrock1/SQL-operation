create table if not exists customer
(
cid char(5) not null primary key,
cname varchar(20),
age int(2),
gen char(1),
bamt int(5),
loc varchar(15),
Ino char(3)
sid char(3)
);
insert into customer VALUES
('C0001','Anu',28,'F',32000,'Australia','I02','S02'),
('C0002','Bini',43,'F',90000,'India','I02','S01'),
('C0003','Cion',36,'M',24000,'Canada','I03','S02'),
('C0004','Lura',24,'F',70500,'Canada','I04','S02'),
('C0005','Hillar',51,'M',42000,'Australia','I03','S04'),
('C0006','Zeny',36,'F',60800,'India','I01','S01'),
('C0007','Lohishree',40,'F',60800,'Australia','I05','S04'),
('C0008','Arnold',25,'M',69800,'Canada','I04','S01'),
('C0009','Owe',39,'F',60880,'India','I02','S03'),
('C0010','Anie',30,'F',60500,'Canada','I01','S05'),
('C0011','Bisha',66,'F',70800,'Australia','I04','S04'),
('C0012','Zoy',32,'F',60100,'India','I03','S03'),
('C0013','Luke',56,'M',64800,'Canada','I01','S06'),
('C0014','Luyanda',33,'M',69800,'Australia','I02','S05'),
('C0015','Canyon',38,'M',60200,'Canada','I05','S04');

create table if not EXISTS Item
(
Ino char(3) not null primary key,
Iname varchar(15),
Cost int(3),
company varchar(10)
);
insert into item VALUES
('I01','Refridgerator',30000,'ABC'),
('I02','Television',45000,'DEF'),
('I03','Scooter',42000,'ABC'),
('I04','Car',125000,'ABC'),
('I05','AC',20000,'DEF');

select * from customer;
select * from Item;

select count(*),gen
from customer
group by gen;
select count(*),loc
from customer
group by loc;
select count(*),Ino
from customer
group by Ino;

select Cname,age
from customer
order by age;

select Cname,age,bamt
from customer
order by bamt desc;

create table if not EXISTS salesman(
SID char(3) not null primary key,
Sname varchar (20),
Sage int(2),
Sgen char(1),
sal int(5),
Sloc varchar(10),
Exp int(2)
);
insert into saleman values
('S01','Vikran',30,'M',120000,'Australia',3),
('S02','Sailsu',25,'F',10000,'Nigeria',2),
('S03','Emmanuel',NULL,'M',15000,'Nigeria',5),
('S04','Damian',NULL,'M',16000,'Canada',NULL),
('S05','Esther',38,'F',14000,'Nigeria',2),
('S06','Precious',NULL,'F',20000,'Australia',4);

#1) Display customers and salesmen records who are coming from same location
select c.name,s.name,loc as 'Location of customer',sloc as 'Location of salesman' from customer c join salesman s on c.loc=s.Sloc;

#2) Display the female customers whose age is less than the saleman in Australia
select cname from customer c, salesman s where c.age<s.sage and c.loc=s.Sloc and gen='F' and loc='Australia';

#3) Display total bill amount paid by female customers from India.
select sum(bamt)
from customer
where gen='F' and loc='India';

#4) Display customer names of canada in descending order of age
select cname
from customer
where loc='Canada'
order by age desc;

#5) Display customer names which have 'a' anywhere in their name and bill amount is between 30000 to 60000
select cname
from customer
where cname like '%a%'
and bamt BETWEEN 30000 and 60000;

#6) Display non repeated locations of customers whose names are atmost 4 characters long
select DISTINCT loc, cname
from customer
where cname like '____%';

#7) Display customer name and age who have purchased Scooter or Car
select cname,age
from customer c, item i
where c.Ino=i.Ino
and iname in('Scooter','Car');

#8) Display customer id and name who have purchased items from Sailsu or Damian
select cid ,cname,sname
from customer c, salesman s
where c.sid=s.sid
and sname in('Sailsu', 'Damian');