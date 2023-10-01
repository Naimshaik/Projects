-- 1
create database Travego;
use Travego;

create table Passenger
(
	Passenger_id tinyint,
    Passenger_name varchar(10),
    Category varchar(10),
    Gender varchar(1),
    Boarding_City varchar(10),
	Destination_City varchar(10),
    Distance int,
    Bus_Type varchar(10)
);
show columns from Passenger;
insert into Passenger values
	(1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
    (2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
    (3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
    (4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
    (5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
	(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
    (7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
	(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
	(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');
	
select * from Passenger;

create table Price
(
	id tinyint,
    Bus_type varchar(10),
    Distance int, 
    Price int
);
show columns from Price;
insert into Price values
	(1, 'Sleeper', 350, 770),
	(2, 'Sleeper', 500, 1100),
	(3, 'Sleeper', 600, 1320),
	(4, 'Sleeper', 700, 1540),
	(5, 'Sleeper', 1000, 2200),
	(6, 'Sleeper', 1200, 2640),
	(7, 'Sleeper', 1500, 2700),
	(8, 'Sitting', 500, 620),
	(9, 'Sitting', 600, 744),
	(10, 'Sitting', 700, 868),
	(11, 'Sitting', 1000, 1240),
	(12, 'Sitting', 1200, 1488),
	(13, 'Sitting', 1500, 1860);

select * from Price;

-- 2
-- a. How many female passengers traveled a minimum distance of 600 KMs?
select * from Passenger;
select count(Gender) from passenger 
where Distance >= 600;

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and
-- who are traveling in a sleeper bus.
select * from Passenger;
select * from Passenger where Distance > 500 and Bus_Type = 'Sleeper';

-- c. Select passenger names whose names start with the character 'S'.
select * from Passenger;
select Passenger_name from Passenger 
where Passenger_name like 'S%';

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
-- Destination City, Bus type, and Price in the output.
select * from Passenger;
select * from Price;
select
  p.Passenger_name,
  p.Boarding_City,
  p.Destination_City,
  p.Bus_Type,
  pr.Price
from Passenger as p
join Price as pr 
on p.Bus_Type = pr.Bus_type and p.Distance = pr.Distance;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
select
  p.Passenger_name,
  p.Distance,
  p.Bus_type,
  pr.Price
from Passenger as p
join Price as pr 
on p.Bus_Type = pr.Bus_type and p.Distance = pr.Distance
where p.Distance >= 1000 and p.Bus_type = 'Sitting';

select * from Passenger;

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select
  (Select Passenger_name from Passenger where Passenger_name = 'Pallavi') as Passenger_name, 
  (select Price from Price 
  where Bus_Type = 'Sitting' and Distance = (select Distance from Passenger where Passenger_name = 'Pallavi')) as Sitting_Bus_Charge,
  (select Price from Price 
  where Bus_Type = 'Sleeper' and Distance = (select Distance from Passenger where Passenger_name = 'Pallavi')) as Sleeper_Bus_Charge;
  
  
  -- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
select   
	(select count(Category) from Passenger where Category = 'AC') as AC,
    (select count(Category) from Passenger where Category = 'Non-AC') as 'Non-Ac'; 
    
update Passenger
set category = 'Non-AC'
where Bus_Type = 'Sleeper';

select   
	(select count(Category) from Passenger where Category = 'AC') as AC,
    (select count(Category) from Passenger where Category = 'Non-AC') as 'Non-Ac'; 
 
 -- h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
delete from Passenger
where Passenger_name = 'Piyush';
commit;
 
 select * from Passenger;
 
 -- i. Truncate the table passenger and comment on the number of rows in the table (explain if required)
 select count(*) as Total_rows from Passenger ;
 
 truncate table Passenger;
 
 select count(*) as Total_rows from Passenger;
  
  -- j. Delete the table passenger from the database.  
show tables;
drop table Passenger;
show tables;

