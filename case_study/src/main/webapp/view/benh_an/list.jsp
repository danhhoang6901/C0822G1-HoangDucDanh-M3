<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 15/11/2022
  Time: 2:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Phòng Trọ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css">
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="datatables/js/jquery.dataTables.min.js"></script>
    <script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</head>
<body>
<h1 style="font-weight: bold;text-align: center">DANH SÁCH BỆNH ÁN</h1>
<table class="table table-striped table-bordered" id="tableBenhAn">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Mã bệnh án</th>
        <th scope="col">Mã bệnh nhân</th>
        <th scope="col">Tên bệnh nhân</th>
        <th scope="col">Ngày nhập viên</th>
        <th scope="col">Ngày ra viện</th>
        <th scope="col">Lý do nhập viện</th>
        <th scope="col">Chỉnh sửa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="benhAn" items="${benhAnList}" varStatus="stt">
        <tr>
            <th scope="row">${stt.count}</th>
            <td>${benhAn.getId()}</td>
            <td>${benhAn.getIdBenhNhan()}</td>
            <c:forEach var="bn" items="${benhNhanList}">
                <c:if test="${benhAn.getIdBenhNhan() == bn.getId()}">
                    <td>${bn.getTenBenhNhan()}</td>
                </c:if>
            </c:forEach>
            <td>${benhAn.getNgayNhapVien()}</td>
            <td>${benhAn.getNgayRaVien()}</td>
            <td>${benhAn.getLyDoNhapVien()}</td>
            <td>
                <a href="/benh_an?action=edit&id=${benhAn.getIdBenhNhan()}" class="btn btn-primary" role="button">Edit</a>
            </td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#sp${benhAn.getId()}">
                    Xóa
                </button>
                <div id="sp${benhAn.getId()}" class="modal fade" id="exampleModal" tabindex="-1"
                     aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Xóa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có muốn xóa thông tin bệnh án <b
                                    style="font-weight: bold;color: red">${benhAn.getIdBenhNhan()}</b> hay không?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <a href="/benh_an?action=delete&id=${benhAn.getId()}" type="button" class="btn btn-primary">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script>
    $(document).ready(function () {
        $('#tableBenhAn').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
