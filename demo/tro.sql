drop database if exists quan_ly;
create database quan_ly;
use quan_ly;
create table benh_nhan (
id int primary key auto_increment,
ten_benh_nhan varchar(50),
is_delete bit default 0
);

create table benh_an (
id int auto_increment primary key,
id_benh_nhan int,
ngay_nhap_vien date,
ngay_ra_vien date,
ly_do_nhap_vien varchar(200),
is_delete bit default 0,
foreign key(id_benh_nhan) references benh_nhan(id)
);

insert into benh_nhan (id,ten_benh_nhan)
value (1,'Hoàng Đức Danh'),
	  (2,'Hoàng Đức Danh1'),
	  (3,'Hoàng Đức Danh3'),
	  (4,'Hoàng Đức Danh4'),
	  (5,'Hoàng Đức Danh5'),
      (6, 'Hoàng Đức Danh2');
      
insert into benh_an (id,id_benh_nhan,ngay_nhap_vien,ngay_ra_vien,ly_do_nhap_vien)
value (1,1,'2022-12-10','2022-10-30','Sốt'),
 (2,2,'2022-12-10','2022-10-30','Gãy tay'),
 (3,3,'2022-12-10','2022-10-30','gãy chân'),
 (4,4,'2022-12-10','2022-10-30','gãy chân'),
 (5,5,'2022-12-10','2022-10-30','gãy chân'),
 (6,6,'2022-12-10','2022-10-30','gãy chân');
