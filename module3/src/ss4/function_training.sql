-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject`
where credit = (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *,max(mark.mark) from `subject`
join mark 
on `subject`.sub_id = mark.sub_id
group by `subject`.sub_id,`subject`.sub_name
having max(mark) >= all (select max(mark) from mark group by mark.sub_id);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select *,avg(mark) from student
join mark 
on mark.student_id = student.student_id 
group by student.student_id, student.student_name
order by mark;