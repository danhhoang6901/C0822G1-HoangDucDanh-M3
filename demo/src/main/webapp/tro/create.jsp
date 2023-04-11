<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 15/11/2022
  Time: 4:01 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm mới</title>
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
<div align="center">
    <p>
        <c:if test="${mess != null}">
            <span class="message">${mess}</span>
        </c:if>
    </p>
    <form method="post">
        <fieldset>
            <legend>THÊM MỚI</legend>
            <a role="button" class="btn btn-primary" href="/phongTro">Quay lại</a>
            <table>
                <tr>
                    <td>Tên người thuê trọ:</td>
                    <td><input type="text" name="tenNguoiThueTro" id="tenNguoiThueTro" required pattern="\D{5,50}"
                               title="Không chứa số và kí tự đặc biệt"></td>
                </tr>
                <tr>
                    <td>Số điện thoại:</td>
                    <td><input type="text" name="soDienThoai" id="soDienThoai" required pattern="\d{10}"
                               title="Số điện thoại phải là số và không quá 10 số"></td>
                </tr>
                <tr>
                    <td>Ngày bắt đầu thuê:</td>
                    <td><input type="text" name="ngayBatDauThue" id="ngayBatDauThue" required
                               pattern="\d{4}-\d{2}-\d{2}" title="Đúng định dạng yyyy-MM-dd">
                    </td>
                </tr>
                <tr>
                    <td>Hình thức thanh toán:</td>
                    <td>
                        <select name="idThanhToan">
                            <c:forEach var="httt" items="${thanhToanList}">
                                <option value="${httt.getId()}">${httt.getHinhThucThanhToan()}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Ghi chú:</td>
                    <td><input type="text" name="ghiChu" id="ghiChu" pattern="\D{0,200}" title="Không nhập quá 200 từ">
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Tạo mới" role="button" class="btn btn-primary"></td>
                    <td><a href="/phongTro" role="button" class="btn btn-primary">Hủy</a></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
</body>
</html>
