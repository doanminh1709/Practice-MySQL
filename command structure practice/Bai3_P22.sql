create database MarkManagement;
use MarkManagement;

create table Students(
	StudentId nvarchar(12) , 
    StudentName nvarchar(25) not null , 
    DateOfBirth nvarchar(40) not null , 
    Email nvarchar(40) , 
    Phone nvarchar(12) , 
    Class nvarchar(10) , 
    primary key(StudentId)
);

create table Subjects(
	SubjectID nvarchar(10) , 
    SubjectName nvarchar(25) not null , 
    primary key(SubjectID)
);

create table Mark(
	StudentId nvarchar(12) , 
    SubjectId nvarchar(10) , 
    Dates datetime , 
    Theory tinyint , 
    Pratical tinyint,
    constraint Pk_Mark primary key(StudentId , SubjectId)
);

-- add data to table 
insert into Students values('AV0807005', N'Mail Trung Hiếu','11/10/1989', 'trunghieu@yahoo.com', '0904115116', 'AV1');
insert into Students values('AV0807006', N'Nguyễn Quý Hùng','2/12/1988', 'quyhung@yahoo.com', '0955667787', 'AV1');
insert into Students values('AV0807007', N'Đỗ Đắc Huỳnh','2/1/1990', 'dachuynh@yahoo.com', '0988574747', 'AV2');
insert into Students values('AV0807009', N'An Đăng Khuê','12/7/1989', 'dangkhue@yahoo.com', '0986757463', 'AV1');
insert into Students values('AV0807010', N'Nguyễn T. Tuyết Lan','12/7/1989', 'tuyetlan@gmail.com', '0983310342', 'AV2');
insert into Students(StudentId ,StudentName , DateOfBirth ,Email , Class) 
values ('AV0807011', N'Đinh Phụng Long','2/12/1990 ', 'phunglong@yahoo.com', 'AV1');
insert into Students(StudentId ,StudentName , DateOfBirth ,Email , Class) 
values ('AV0807012', N'Nguyễn Tuấn Nam','2/3/1990', 'tuannam@yahoo.com', 'AV1');

insert into Subjects values('S001' , 'SQL');
insert into Subjects values('S002' , 'Java Simplefield');
insert into Subjects values('S003' , 'Active Server Page');

insert into Mark values('AV0807005', 'S001',  '2008-05-06' ,8, 25);
insert into Mark values('AV0807006', 'S002', '2008-05-06',16, 30);
insert into Mark values('AV0807007', 'S001', '2008-05-06', 10, 25);
insert into Mark values('AV0807009', 'S003', '2008-05-06', 7, 13);
insert into Mark values('AV0807010', 'S003', '2008-05-06', 9, 16);
insert into Mark values('AV0807011', 'S002', '2008-05-06', 8, 30);
insert into Mark values('AV0807012', 'S001', '2008-05-06', 7, 31);
insert into Mark values('AV0807005', 'S003', '2008-06-06', 12, 11);
insert into Mark values('AV0807009', 'S001', '2008-06-06', 11, 20);
insert into Mark values('AV0807010', 'S001', '2008-06-06', 7, 6);

-- 1. Hiển thị nội dung bảng Student
select*from Students;

-- 2. Hiển thị nội dung danh sách sinh viên lớp AV1
select*from Students where Class = 'AV1';

-- 3. Sử dụng lệnh UPDATE để chuyển sinh viên có mã AV0807012 sang lớp AV2
UPDATE Students set Class = 'AV2' where StudentId ='AV0807012';

-- 4. Tính tổng số sinh viên của từng lớp
select Class , count(StudentId) as 'Sum student of class' from Students group by(Class);

-- 5. Hiển thị danh sách sinh viên lớp AV2 được sắp xếp tăng dần theo StudentName
select*from Students where Class = 'AV1' order by(StudentName) ASC;

-- 6. Hiển thị danh sách sinh viên không đạt lý thuyết môn S001 (theory < 10) thi ngày 6/5/2008
select Students.StudentId , StudentName,DateOfBirth,Email, Phone , Class  from Students inner join Mark
on Students.StudentId = Mark.StudentId where  Mark.SubjectId = 'S001' and Theory < 10 and Dates='2008-05-06';

-- 7. Hiển thị tổng số sinh viên không đạt lý thuyết môn S001. (theory <10)
select count(StudentId) as 'Sum of student' from Mark where SubjectId = 'S001' and Theory < 10;

-- 8. Hiển thị Danh sách sinh viên học lớp AV1 và sinh sau ngày 1/1/1980
select*from Students where Class = 'AV1' and DateOfBirth > '1/1/1980';

-- 9. Xoá sinh viên có mã AV0807011
delete from Students where StudentId = 'AV0807011';

-- 10.Hiển thị danh sách sinh viên dự thi môn có mã S001 ngày 6/5/2008 bao gồm các trường sau: StudentID, StudentName, SubjectName, Theory, Practical, Date
select Students.StudentId , StudentName , SubjectName , Theory , Pratical , Dates from Students inner join Mark
on Students.StudentId = Mark.StudentId inner join Subjects on Subjects.SubjectID = Mark.SubjectID 
where Subjects.SubjectID='S001' and Dates = '2008-05-06';