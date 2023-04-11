-- SQL 1-5 --	
-- Task 2: 
select * from nhan_vien 
where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%') 
and char_length(ho_ten) <=15; 

-- Task 3:
select * from khach_hang 
where ((year(now())-year(ngay_sinh)) between 18 and 50) 
and(dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');

-- Task 4:
select khach_hang.ma_khach_hang,khach_hang.ho_ten,count(hop_dong.ma_khach_hang) 
as so_lan_dat_phong
from khach_hang 
join hop_dong 
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where (loai_khach.ten_loai_khach = 'Diamond')
group by hop_dong.ma_khach_hang
order by so_lan_dat_phong;

-- Task 5:
select khach_hang.ma_khach_hang,khach_hang.ho_ten,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,
sum(ifnull(dich_vu.chi_phi_thue,0) + ifnull(hop_dong_chi_tiet.so_luong,0) * ifnull(dich_vu_di_kem.gia,0)) as tong_tien
from khach_hang
left join hop_dong
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong_chi_tiet
on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong
order by khach_hang.ma_khach_hang;

-- SQL 6-10 --
-- Task 6:
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu not in(
select hop_dong.ma_dich_vu from hop_dong
where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31');

-- Task 7:
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu not in(
select hop_dong.ma_dich_vu from hop_dong
where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-12-30');

-- Task 8:
-- Cách 1:
select ho_ten from khach_hang
group by ho_ten;
-- Cách 2:
select distinct ho_ten 
from khach_hang;
-- Cách 3:
select ho_ten 
from khach_hang
union
select ho_ten
from khach_hang;

-- Task 9:
select month(ngay_lam_hop_dong) as thang, count(ma_hop_dong) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang 
order by thang;

-- Task 10:
select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, sum(ifnull(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- SQL 11-15 --
-- Task 11:
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem 
from dich_vu_di_kem 
join hop_dong_chi_tiet
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong
on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join khach_hang
on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach = 'Diamond' and khach_hang.dia_chi like '% Vinh' or khach_hang.dia_chi like '% Quảng Ngãi'
group by dich_vu_di_kem.ma_dich_vu_di_kem;

-- Task 12:
select hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.so_dien_thoai, dich_vu.ten_dich_vu, sum(ifnull(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem, hop_dong.tien_dat_coc
from hop_dong
join nhan_vien
on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
join khach_hang
on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join dich_vu
on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where hop_dong.ngay_lam_hop_dong between '2020-10-01' and '2020-12-30' and hop_dong.ma_hop_dong not in(
select hop_dong.ma_hop_dong from hop_dong
where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-06-30')
group by hop_dong.ma_hop_dong;

-- Task 13:
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem 
from dich_vu_di_kem
join hop_dong_chi_tiet
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem >= all(
select sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet
join dich_vu_di_kem
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
);

-- Task 14
select hop_dong.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem
join hop_dong_chi_tiet
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong
on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_lan_su_dung = 1
order by hop_dong.ma_hop_dong;

-- Task 15:
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi
from nhan_vien
join trinh_do
on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
join bo_phan
on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join hop_dong
on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where year(hop_dong.ngay_lam_hop_dong) between 2020 and 2021
group by nhan_vien.ma_nhan_vien
having count(nhan_vien.ma_nhan_vien) < 4
order by nhan_vien.ma_nhan_vien;

-- Task 16:
set SQL_SAFE_UPDATES = 0;
delete from nhan_vien 
where nhan_vien.ma_nhan_vien not in(
select hop_dong.ma_nhan_vien from hop_dong
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021
);
select ma_nhan_vien, ho_ten from nhan_vien;

-- Task 17:
update khach_hang
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang in(
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, 
sum(ifnull(dich_vu.chi_phi_thue,0) + ifnull(hop_dong_chi_tiet.so_luong,0)) * ifnull(dich_vu_di_kem.gia,0) as tong_tien
from khach_hang
left join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong
on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
where loai_khach.ma_loai_khach = 'Platinum'
group by khach_hang.ma_khach_hang
having tong_tien > 10000000 
);
select ma_khach_hang, ho_ten, ma_loai_khach from khach_hang;

-- Task 18:
set SQL_SAFE_UPDATES = 0;
delete from khach_hang
where khach_hang.ma_khach_hang in(
select ma_khach_hang
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) < 2021
);
select * from khach_hang;

-- Task 19:
set SQL_SAFE_UPDATES = 0;
update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem in(
select tinh_tong.ma_dich_vu_di_kem from (
select hop_dong_chi_tiet.ma_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as tong_so_lan_su_dung
from hop_dong_chi_tiet
join hop_dong
on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2020
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having tong_so_lan_su_dung > 10
)as tinh_tong);	

-- Task 20:
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi 
from nhan_vien
union all
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi 
from khach_hang;

-- Task 21:
create view v_nhan_vien as 
select nhan_vien.* from nhan_vien
join hop_dong
on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where nhan_vien.ma_nhan_vien in (
select hop_dong.ma_nhan_vien from hop_dong
where hop_dong.ngay_lam_hop_dong = '2019-12-12'
)
and nhan_vien.dia_chi like '% Hải Châu';
drop view v_nhan_vien;

-- Task 22:
set SQL_SAFE_UPDATES = 0;
update v_nhan_vien
set dia_chi = 'Liên Chiểu'
where dia_chi like '% Hải Châu';

-- Task 23:
delimiter //
create procedure sp_xoa_khach_hang (in sp_ma_khach_hang int)
begin
delete from khach_hang where khach_hang.ma_khach_hang = sp_ma_khach_hang;
end //
delimiter ;
call sp_xoa_khach_hang(1);

-- Task 24:
