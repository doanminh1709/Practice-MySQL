create database DeptEmp;
use DeptEmp;

create table Department(
	DepartmentNo integer , 
    DepartmentName char(25) not null, 
    Location char(25) not null , 
    primary key(DepartmentNo)
);
create table Employee(
	EmpNo integer , 
    Fname varchar(15) not null , 
    Lname varchar(15) not null , 
    Job varchar(25) not null , 
    HireDate datetime not null , 
    Salary numeric not null , 
    Commision numeric, 
    DepartmentNo integer ,
    primary key(EmpNo) , 
    foreign key(DepartmentNo) 
    references Department(DepartmentNo)
);

-- add data 
insert into Department values(10 , 'Accounting' , 'Melbourne');
insert into Department values(20 , 'Resourch' , 'Adealide');
insert into Department values(30 , 'Sales' , 'Sydney');
insert into Department values(40 , 'Operations' , 'Perth');

select*from Employee;
-- Note : In mysql datetype has format is'YYYY-MM-DD' 
insert into Employee(EmpNo , Fname , Lname , Job , HireDate , Salary , DepartmentNo)
values(1 , 'John' , 'Smith' , 'Clerk' , '1980-12-17' , 800  , 20);

insert into Employee values(2 , 'Peter' , 'Allen' , 'Salesman' , '1981-11-20' , 1600 , 300 , 30);

insert into Employee values(3 , 'Kate' , 'Ward' , 'Salesman' , '1981-11-22' , 1250 , 500 , 30);

insert into Employee(EmpNo , Fname , Lname , Job , HireDate , Salary , DepartmentNo)
values(4 , 'Jock' , 'Jones' , 'Manager' , '1981-07-02' , 2975  , 20);

insert into Employee values(5 , 'Joe' , 'Martin' , 'Salesman' , '1981-09-28' , 1250 , 1400 , 30);

-- execute request 
-- 1. show content deparment board 
select*from Department;

-- 2. Show content of Employee board 
select*from Employee;

-- 3.Select employee number , emloyee firt name and empoyy lastname from Employee and employee firstname has name 'Kate'
select EmpNo , Fname , Lname from Employee where Fname like 'Kate';

-- 4.Show 2 filed Fname and Lname to FullName , Salary and 10% Salary 
select concat(Fname , ' ', Lname) as FullName, (Salary+Salary*0.1) as Salary from Employee;

-- 5.Show Fname , Lnam , HireDate for all Employee has HireDte 1981 and sort ASC of Lname 
select Fname , Lname , HireDate from Employee where year(HireDate) = 1981 order by (Lname);

-- 6.Show average , max , min of salary for each deparment in staff table 
select DepartmentName, avg(salary) as 'Avg salary' , max(salary) as 'Max salary' , min(salary) as 'Min salary'
from Employee inner join Department on Employee.DepartmentNo = Department.DepartmentNo 
group by (Department.DepartmentName);

-- 7.Show DepartmentNo and number of each class in employy table 

select DepartmentNo , count(EmpNo) as 'Number of depatment' from Employee group by DepartmentNo;

-- 8.Show DepartmentNo , DepartmentName , FullName(Fname and Lname) , Job , Salary in the Department table  and Employee table 
select Department.DepartmentNo , DepartmentName , concat(Fname , ' ' , Lname) as FullName , Job , Salary
from Department inner join Employee on Department.DepartmentNo = Employee.DepartmentNo;
 
 -- 9.Show departmentNo , DepartmentName , Location and number of each department in department table and employee table 
select Employee.DepartmentNo , DepartmentName , Location ,count(EmpNo) as 'Number Of Department' from Department inner join Employee 
on Department.DepartmentNo = Employee.DepartmentNo group by(Employee.DepartmentNo);




