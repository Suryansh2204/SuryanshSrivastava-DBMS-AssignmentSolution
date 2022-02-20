create database Travel_On_The_Go;
use Travel_On_The_Go;

#1 creation of tables
create table if not exists `PASSENGER`(
`Passenger_name` varchar(50),
`Category` varchar(50),
`Gender` varchar(1),
`Boarding_City` varchar(50),
`Destination_City` varchar(50),
`Distance` int,
`Bus_Type` varchar(50)
);
create table if not exists `PRICE`(
`Bus_Type` varchar(50),
`Distance` int ,
`Price` int 
);

#2 insertion 
insert into `PASSENGER` values("Sejal", "AC", "F", "Bengaluru", "Chennai", 350 , "Sleeper");
insert into `PASSENGER` values("Anmol", "Non-AC" , "M" , "Mumbai" , "Hyderabad" , 700 , "Sitting");
insert into `PASSENGER` values("Pallavi", "AC" , "F" , "Panaji" , "Bengaluru" , 600 , "Sleeper");
insert into `PASSENGER` values("Khusboo", "AC" , "F" , "Chennai" , "Mumbai" , 1500 , "Sleeper");
insert into `PASSENGER` values("Udit" , "Non-AC" , "M" , "Trivandrum" , "Panaji" , 1000 , "Sleeper");
insert into `PASSENGER` values("Ankur", "AC" , "M" , "Nagpur" , "Hyderabad" , 500 , "Sitting");
insert into `PASSENGER` values("Hemant" , "Non-AC" , "M" , "Panaji" , "Mumbai" , 700 , "Sleeper");
insert into `PASSENGER` values("Manish", "Non-AC" , "M" , "Hyderabad" , "Bengaluru" ,500 , "Sitting");
insert into `PASSENGER` values("Piyush", "AC" , "M" , "Pune" , "Nagpur" , 700 , "Sitting");

insert into `PRICE` values("Sleeper" , 350 , 770);
insert into `PRICE` values("Sleeper" , 500 , 1100);
insert into `PRICE` values("Sleeper" , 600 , 1320);
insert into `PRICE` values("Sleeper" , 700 , 1540);
insert into `PRICE` values("Sleeper" , 1000 , 2200);
insert into `PRICE` values("Sleeper" , 1200 , 2640);
insert into `PRICE` values("Sleeper" , 1500 , 2700);
insert into `PRICE` values("Sitting" , 500 , 620);
insert into `PRICE` values("Sitting" , 600 , 744);
insert into `PRICE` values("Sitting" , 700 , 868);
insert into `PRICE` values("Sitting" , 1000 ,1240);
insert into `PRICE` values("Sitting" , 1200 , 1488);
insert into `PRICE` values("Sitting" , 1500 , 1860);


#3 How many females and how many male passengers travelled for a minimum distance of 600 KM s?
Select `Gender` , count(`Gender`) as Passengers from `PASSENGER`  where Distance>=600 Group By `Gender`;

#4 Find the minimum ticket price for Sleeper Bus
Select min(price) as Min_Price_Sleeper from `PRICE` where `Bus_type`="Sleeper";

#5 Select passenger names whose names start with character 'S'
Select `Passenger_name` from `passenger` where `Passenger_name` like 'S%';

#6 Calculate price charged for each passenger displaying Passenger name, Boarding City,
#  Destination City, Bus_Type, Price in the output
SELECT `Passenger_name`  , `Boarding_City`, `Destination_city`, `Passenger`.`Bus_Type`, `Price`.Price  FROM `Passenger` ,`Price` 
where `Passenger`.`Distance` = `Price`.`Distance` and `Passenger`.`Bus_type` = `Price`.`Bus_type`;


#7 What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
#  for a distance of 1000 KM s
SELECT `Passenger_name`, `Price`.Price FROM `Passenger`, `Price` 
WHERE `Passenger`.`Distance` = 1000 and `Passenger`.`Bus_type` = 'Sitting' 
and `Price`.`Distance` = 1000 and `Price`.`Bus_type` = 'Sitting';


#8 What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT DISTINCT `Passenger_name`,  Destination_city as Boardng_city, `Boarding_city` as Destination_city, 
`Passenger`.Bus_type, `Price`.Price FROM `Passenger` , `Price` 
WHERE `Passenger_name` = 'Pallavi' and `Passenger`.`Distance` = `Price`.Distance;


#9 List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
Select Distinct `Distance` from `Passenger` Order By `Distance` DESC;


#10 Display the passenger name and percentage of distance travelled by that passenger
#   from the total distance travelled by all passengers without using user variables.
SELECT `Passenger_name`, `Distance` * 100.0/ (SELECT SUM(`Distance`) FROM `Passenger`) as "% Distance" FROM `Passenger`;


#11 Display the distance, price in three categories in table Price
#   a) Expensive if the cost is more than 1000
#   b) Average Cost if the cost is less than 1000 and greater than 500
#   c) Cheap otherwise

Select `Distance`, Price ,
case
when Price > 1000 then 'Expensive'
when Price >500 then 'Average Cost'
else 'Cheap'
end
as  'Cost Rating' from `Price`;