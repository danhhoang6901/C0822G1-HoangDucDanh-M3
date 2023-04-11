<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 16/11/2022
  Time: 9:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <a href="/benh_an" role="button" class="btn btn-primary">Quay lại danh sách</a>
    <form action="/benh_an?action=edit" method="post">
        <fieldset>
            <legend>Chỉnh sửa bệnh án</legend>
            <table>
                <tr>
                    <td>Mã bệnh án:</td>
                    <td><input type="hidden"  name="id" id="id" value="${benhAn.getId()}"></td>
                </tr>
                <tr>
                    <td>Mã bệnh nhân:</td>
                    <td><input type="hidden"  name="idBenhNhan" id="idBenhNhan" value="${benhAn.getIdBenhNhan()}">
                    </td>
                </tr>
                <td>Tên bệnh nhân:</td>
                <td>
                    <c:forEach var="bn" items="${benhNhanList}">
                        <c:if test="${benhAn.getIdBenhNhan() == bn.getId()}">
                            <input type="text" disabled value="${bn.getTenBenhNhan()}">
                        </c:if>
                    </c:forEach>
                </td>
                </tr>
                <tr>
                    <td>Ngày nhập viện:</td>
                    <td><input type="text" name="ngayNhapVien" id="ngayNhapVien" value="${benhAn.getNgayNhapVien()}">
                    </td>
                </tr>
                <tr>
                    <td>Ngày ra viện:</td>
                    <td><input type="text" name="ngayRaVien" id="ngayRaVien" value="${benhAn.getNgayRaVien()}"></td>
                </tr>
                <tr>
                    <td>Lý do nhập viện:</td>
                    <td><input type="text" name="lyDoNhapVien" id="lyDoNhapVien" value="${benhAn.getLyDoNhapVien()}">
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Chỉnh sửa"></td>
                </tr>
            </table>

        </fieldset>
    </form>
</div>
</body>
</html>
