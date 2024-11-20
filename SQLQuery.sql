
use Company

create table regions(Region_ID int identity primary key,
Region_Name varchar(25))

INSERT INTO regions (Region_Name) VALUES ('Europe');
INSERT INTO regions (Region_Name) VALUES ('Asia');

select * from regions

create table countries( 
Country_ID int identity primary key ,
Country_Name varchar(40), 
Region_ID int foreign key references regions(Region_ID))

INSERT INTO countries (Country_Name, Region_ID) VALUES ('Germany', 1);
INSERT INTO countries (Country_Name, Region_ID) VALUES ('Japan', 2);

select * from countries




create table locations(
Location_ID int identity primary key ,
Street_Address varchar(25),
Postal_Code varchar(12),
City varchar(30),
State_Province varchar(12),
Country_ID int foreign key references countries(Country_ID))

INSERT INTO locations (Street_Address, Postal_Code, City, State_Province, Country_ID) 
VALUES ('Street 1', '10001', 'Berlin', 'Berlin', 1);
INSERT INTO locations (Street_Address, Postal_Code, City, State_Province, Country_ID) 
VALUES ('Street 2', '150-0031', 'Tokyo', 'Tokyo', 2);





create table departments(
Department_ID int identity primary key ,
Department_Name varchar(30),
Manager_ID int ,
Location_ID int foreign key references locations(Location_ID))

INSERT INTO departments (Department_Name, Manager_ID, Location_ID) 
VALUES ('HR', 1, 7);
INSERT INTO departments (Department_Name, Manager_ID, Location_ID) 
VALUES ('Sales', 2, 8);
select * from locations
select * from departments



create table job_history(
Employee_ID int identity primary key,
[Start_Date] date,
[End_Date] date,
Job_ID varchar(10),
Department_ID int foreign key references departments(Department_ID))

INSERT INTO job_history (Start_Date, End_Date, Job_ID, Department_ID) 
VALUES ('2020-01-01', '2021-01-01', 'J001', 1);
INSERT INTO job_history (Start_Date, End_Date, Job_ID, Department_ID) 
VALUES ('2021-02-01', '2022-01-01', 'J002', 2);
select * from job_history

create table jobs(
Job_ID varchar(10) primary key,
Job_Title varchar(35),
Min_Salary int,
Max_Salary int)
INSERT INTO jobs (Job_ID, Job_Title, Min_Salary, Max_Salary) 
VALUES ('J001', 'HR Manager', 50000, 70000);
INSERT INTO jobs (Job_ID, Job_Title, Min_Salary, Max_Salary) 
VALUES ('J002', 'Sales Manager', 60000, 80000);
select * from jobs

create table employees(
Employee_ID int foreign key references job_history(Employee_ID),
First_Name varchar(20),
Last_Name varchar(20),
Email varchar(25),
Phone_Number varchar(25),
HireDate Date,
JOb_ID varchar(10) foreign key references jobs(Job_ID),
Salary int,
Commission_Pot int,
Manager_ID int,
Department_ID int foreign key references departments(Department_ID))

INSERT INTO employees (Employee_ID, First_Name, Last_Name, Email, Phone_Number, HireDate, Job_ID, Salary, Commission_Pot, Manager_ID, Department_ID) 
VALUES (1, 'John', 'Doe', 'jdoe@example.com', '123-4567', '2020-01-01', 'J001', 55000, 5000, 1, 1);
INSERT INTO employees (Employee_ID, First_Name, Last_Name, Email, Phone_Number, HireDate, Job_ID, Salary, Commission_Pot, Manager_ID, Department_ID) 
VALUES (2, 'Jane', 'Smith', 'jsmith@example.com', '234-5678', '2021-02-01', 'J002', 65000, 7000, 2, 2);








create table job_grades(
Grade_Level varchar(2),
Lowest_Sal int,
Highest_Sal int)

INSERT INTO job_grades (Grade_Level, Lowest_Sal, Highest_Sal) 
VALUES ('A', 30000, 50000);
INSERT INTO job_grades (Grade_Level, Lowest_Sal, Highest_Sal) 
VALUES ('B', 50001, 70000);

select * from countries
select * from departments
select * from employees
select * from job_grades
select * from job_history
select * from jobs
select * from locations
select * from regions