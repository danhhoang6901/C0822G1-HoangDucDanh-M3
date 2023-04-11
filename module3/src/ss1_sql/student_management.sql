drop database if exists student_management;
create database student_management;
use student_management;
-- tạo bảng class 
create table class(
id int primary key auto_increment,
`name` varchar(45)
);
-- tạo bảng teacher
create table teacher(
id int primary key auto_increment,
`name` varchar(45),
age int,
country varchar(45));
-- thêm mới dữ liệu 
insert into class (`name`)value('danh'),('vinh');
insert into teacher (`name`, age, country) value('quang',25,'đà nẵng');
-- hiển thị dữ liệu 
select id from class;
select * from class;
-- chỉnh sửa 
update class set `name` = 'linh' where id = 2;
-- xóa dữ liệu
delete from class where id = 1;
-- xóa bảng: drop table class;
-- xóa database: drop database student_management;