create table if not exists customer
(
cid char(5) not null primary key,
cname varchar(20),
age int(2),
gen char(1),
bamt int(5),
loc varchar(15),
Ino char(3)
);
insert into customer VALUES
('C0001','Anu',28,'F',32000,'Australia','I02'),
('C0002','Bini',43,'F',90000,'India','I02'),
('C0003','Cion',36,'M',24000,'Canada','I03'),
('C0004','Lura',24,'F',70500,'Canada','I04'),
('C0005','Hillar',51,'M',42000,'Australia','I03'),
('C0006','Zeny',36,'F',60800,'India','I01');

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

select cname,age from customer;

//1. display the records of female customers
select *
from customer
where gen='F';

//2. Display name of customers whose age is less than 30
select *
from customer
where age<30

//3. Display name and age of the customers from Australia or Canada
select cname,age
from customer
where loc in('Australia','Canada');

//4. Display names of female customers whose bill amount is less than 40000
select cname
from customer
where gen='F' and bamt<40000;

//5. Display names of customers whose age is between 30 to 40 and bamt is not less than 40000
select cname
from customer
where age between 30 and 40
and not bamt<40000;
select * from customer;

//6. Display the names of customers whose names starts with C
select cname 
from customer
where cname like 'C%';

//7. Display the names of customers whose names ends with u
select cname 
from customer
where cname like '%u';

//8. Display the names of customers whose names are 4 characters long
select cname
from customer
where cname like '______';

#9. Display non repeated values
select DISTINCT(loc) from customer;
select DISTINCT(company) from item;

#10.) Display all values
select loc from customer;
select company from item;

#aggregate functions : group of records->avg,min,max,count
#11.) Display total bill amount of all customers
select sum(bamt)
from customer;

#12.) Display average bill amount of all customers
select avg(bamt)
from customer;

#13.) Display minimum cost of item
select min(cost),Iname
from item;

#14.) Display maximum cost of item
select max(cost),Iname
from item;

#15.) Display total number of Items
select count(*)
from item;

#16.) Display the total number of items whose cost is more than 40000
select sum(cost)
from item
where cost>40000;

#17.) Display the maximum and minimum age of female customers
select max(age),min(age)
from customer
where gen='F';

#18.) Display the average bill amount of the customers from Canada and Australia
select avg(bamt)
from customer
where loc in('Canada','Australia');

select * from customer
select * from item

drop table customer;
drop table item;