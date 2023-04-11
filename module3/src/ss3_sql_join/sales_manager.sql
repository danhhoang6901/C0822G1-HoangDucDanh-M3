insert into customer(cName,cAge) value ('Minh Quan',10);
insert into customer(cName,cAge) value ('Ngoc Oanh',20);
insert into customer(cName,cAge) value ('Hong Ha',50);

insert into `order`(cId,oDate,oTotalPrice) value (1,'2006-3-21',null);
insert into `order`(cId,oDate,oTotalPrice) value (2,'2006-3-23',null);
insert into `order`(cId,oDate,oTotalPrice) value (1,'2006-3-16',null);

insert into product(pName,pPrice) value ('May Giat',3);
insert into product(pName,pPrice) value ('Tu Lanh',5);
insert into product(pName,pPrice) value ('Dieu Hoa',7);
insert into product(pName,pPrice) value ('Quat',1);
insert into product(pName,pPrice) value ('Bep Dien',2);

insert into order_detail(oId,pId,odQTY) value (1,1,3);
insert into order_detail(oId,pId,odQTY) value (1,3,7);
insert into order_detail(oId,pId,odQTY) value (1,4,2);
insert into order_detail(oId,pId,odQTY) value (2,1,1);
insert into order_detail(oId,pId,odQTY) value (3,1,8);
insert into order_detail(oId,pId,odQTY) value (2,5,4);
insert into order_detail(oId,pId,odQTY) value (2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oId,oDate,oTotalPrice from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.cName, product.pName 
from product
join order_detail
on product.pId = order_detail.pId
join `order`
on `order`.oId = order_detail.oId
join customer 
on customer.cId = `order`.cId;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cName, p.pName
from customer c
left join `order` o
on c.cId = o.cId
left join order_detail od
on o.oId = od.oId
left join product p
on od.pId = p.pId
where p.pName is null; 

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oId,o.oDate,sum(od.odQTY * p.pPrice) as tong
from `order`o
join order_detail od
on o.oId = od.oId
join product p
on p.pId = od.pId
group by o.oId