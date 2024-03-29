drop database if exists data_furama;
create database data_furama;
use data_furama;
create table position (
id int primary key auto_increment,
name varchar(45),
is_delete bit default 0
);

create table education_degree(
id int primary key auto_increment,
name varchar(45),
is_delete bit default 0
);

create table division(
id int primary key auto_increment,
name varchar(45),
is_delete bit default 0
);

 create table user(
 username varchar(255) primary key,
 password varchar(255),
 is_delete bit default 0
 );
 
 create table role(
 role_id int primary key auto_increment,
 role_name varchar(255),
 is_delete bit default 0
 );
 
create table user_role(
role_id int,
username varchar(255),
foreign key (role_id) references role(role_id),
foreign key (username) references user (username),
is_delete bit default 0,
primary key(role_id, username)
);

create table employee(
id int auto_increment primary key,
name varchar(45),
date_of_birth date,
id_card varchar(45),
salary double,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key (position_id) references position (id),
foreign key (education_degree_id) references education_degree (id),
foreign key (division_id) references division (id),
foreign key (username) references user (username),
is_delete bit default 0
);

create table customer_type(
id int auto_increment primary key,
name varchar(45),
is_delete bit default 0
);

create table customer(
id int auto_increment primary key,
name varchar(45),
date_of_birth date,
gender bit(1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
customer_type_id int, 
foreign key(customer_type_id) references customer_type(id),
is_delete bit default 0
);

create table facility_type(
id int auto_increment primary key,
name varchar(45),
is_delete bit default 0
);

create table rent_type(
id int auto_increment primary key,
name varchar(45),
is_delete bit default 0
);

 create table facility(
 id int auto_increment primary key,
 name varchar(45),
 area int,
 cost double,
 max_people int,
 standard_room varchar(45),
 description_other_convenience varchar(45),
 pool_area double,
 number_of_floors int,
 facility_free text,
 rent_type_id int,
 facility_type_id int,
 foreign key(facility_type_id) references facility_type (id),
 foreign key(rent_type_id) references rent_type (id),
 is_delete bit default 0
 );

create table contract(
id int auto_increment primary key,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
customer_id int,
facility_id int, 
foreign key (employee_id) references employee (id),
foreign key (customer_id) references customer (id),
foreign key (facility_id) references facility (id),
is_delete bit default 0
);

create table attach_facility(
id int auto_increment primary key,
name varchar(45),
cost double,
unit varchar(10),
status varchar(45),
is_delete bit default 0
);

create table contract_detail(
id int auto_increment primary key,
quantity int,
contract_id int,
attach_facility_id int,
foreign key (contract_id) references contract(id),
foreign key (attach_facility_id) references attach_facility(id),
is_delete bit default 0);

INSERT INTO `position` (`id`, `name`) 
VALUES ('1', 'Lễ tân'),
('2', 'Phục vụ'),
('3', 'Chuyên viên'),
('4', 'Giám sát'),
('5', 'Quản lý'),
('6', 'Giám đốc');

INSERT INTO `education_degree` (`id`, `name`)
VALUES (1, 'Trung Cấp'),
(2, 'Cao Đẳng'),
(3, 'Đại Học'),
(4, 'Sau Đại Học');

INSERT INTO `division` (`id`, `name`) 
VALUES (1, 'Sale-Marketing'),
(2, 'Hành chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

-- INSERT INTO `role` (`role_id`, `role_name`) 
-- VALUES ('1', 'Admin'),
-- ('2', 'User');

INSERT INTO `employee` (`id`, `name`, `date_of_birth`, `id_card`, `salary`, `phone_number`, `email`, `address`, `position_id`, `education_degree_id`, `division_id`) 
VALUES (1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
(2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
(3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
(4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
(5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
(6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
(7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
(8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
(9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
(10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);

INSERT INTO `customer_type` (`id`, `name`) 
VALUES (1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

INSERT INTO `customer` (`id`, `name`, `date_of_birth`,`gender`,`id_card`, `phone_number`, `email`, `address`, `customer_type_id`, `status`) 
VALUES (1, 'Nguyễn Thị Hào', '1970-11-07',0,  '643431213',  '0945423362',  'thihao07@gmail.com',  '23 Nguyễn Hoàng, Đà Nẵng',  5,0),
( 2,  'Phạm Xuân Diệu',  '1992-08-08',1,  '865342123',  '0954333333',  'xuandieu92@gmail.com',  'K77/22 Thái Phiên, Quảng Trị',  3,0),
( 3,  'Trương Đình Nghệ',  '1990-02-27',1,  '488645199',  '0373213122',  'nghenhan2702@gmail.com',  'K323/12 Ông Ích Khiêm, Vinh',  1,0),
( 4,  'Dương Văn Quan',  '1981-07-08',1,  '543432111',  '0490039241',  'duongquan@gmail.com',  'K453/12 Lê Lợi, Đà Nẵng',  1,0),
( 5,  'Hoàng Trần Nhi Nhi',  '1995-12-09',0,  '795453345',  '0312345678',  'nhinhi123@gmail.com',  '224 Lý Thái Tổ, Gia Lai',  4,0),
( 6,  'Tôn Nữ Mộc Châu',  '2005-12-06',0,  '732434215',  '0988888844',  'tonnuchau@gmail.com',  '37 Yên Thế, Đà Nẵng',  4,0),
( 7,  'Nguyễn Mỹ Kim',  '1984-04-08',0,  '856453123',  '0912345698',  'kimcuong84@gmail.com',  'K123/45 Lê Lợi, Hồ Chí Minh',  1,0),
( 8,  'Nguyễn Thị Hào',  '1999-04-08',0,  '965656433',  '0763212345',  'haohao99@gmail.com',  '55 Nguyễn Văn Linh, Kon Tum',  3,0),
( 9,  'Trần Đại Danh',  '1994-07-01',1,  '432341235',  '0643343433',  'danhhai99@gmail.com',  '24 Lý Thường Kiệt, Quảng Ngãi',  1,0),
( 10,  'Nguyễn Tâm Đắc',  '1989-07-01',1,  '344343432',  '0987654321',  'dactam@gmail.com',  '22 Ngô Quyền, Đà Nẵng',  2,0);

INSERT INTO `facility_type` (`id`, `name`) VALUES 
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

INSERT INTO `rent_type` (`id`, `name`) 
VALUES (1, 'year'),
(2, 'month'),
(3, 'day'),
(4, 'hour');

INSERT INTO `facility` (`id`, `name`, `area`, `cost`, `max_people`, `standard_room`, `description_other_convenience`, `pool_area`, `number_of_floors`, `facility_free`, `rent_type_id`, `facility_type_id`) 
VALUES (1, 'Villa Beach Front', 25000, 1000000, 10, 'vip', 'Có hồ bơi', 500, '4', null, 3, 1),
(2, 'House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, '3', null, 2, 2),
(3, 'Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp', 4, 3),
(4, 'Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, '3', null, 3, 1),
(5, 'House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, '2', null, 3, 2),
(6, 'Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy', 4, 3);

INSERT INTO `contract` (`id`, `start_date`, `end_date`, `deposit`, `employee_id`, `customer_id`, `facility_id`) 
VALUES (1,'2020-12-08','2020-12-08',0,3,1,3),
(2,'2020-07-14','2020-07-21',200000,7,3,1),
(3,'2021-03-15','2021-03-17',50000,3,4,2),
(4,'2021-01-14','2021-01-18',100000,7,5,5),
(5,'2021-07-14','2021-07-15',0,7,2,6),
(6,'2021-06-01','2021-06-03',0,7,7,6),
(7,'2021-09-02','2021-09-05',100000,7,4,4),
(8,'2021-06-17','2021-06-18',150000,3,4,1),
(9,'2020-11-19','2020-11-19',0,3,4,3),
(10,'2021-04-12','2021-04-14',0,10,3,5),
(11,'2021-04-25','2021-04-25',0,2,2,1),
(12,'2021-05-25','2021-05-27',0,7,10,1);

INSERT INTO `attach_facility` (`id`, `name`, `cost`, `unit`, `status`) 
VALUES (1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
(2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
(3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
(4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

INSERT INTO `contract_detail`(`id`,`quantity`,`contract_id`,`attach_facility_id`)
VALUES(1,5,2,4),
(2,8,2,5),
(3,15,2,6),
(4,1,3,1),
(5,11,3,2),
(6,1,1,3),
(7,2,1,2),
(8,2,12,2);

