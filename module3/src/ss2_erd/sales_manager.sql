drop database if exists sales_manager;
create database sales_manager;
use sales_manager;
create table customer(
cId int primary key auto_increment,
cName varchar(45),
cAge int
);
create table `order`(
oId int primary key auto_increment,
cId int,
oDate date,
oTotalPrice double,
foreign key(cId) references customer(cId)
);
create table product(
pId int primary key auto_increment,
pName varchar(45),
pPrice double
);
create table order_detail(
oId int,
pId int,
odQTY int,
primary key(oId,pId),
foreign key(oId) references `order`(oId),
foreign key(pId) references product(pId)
);