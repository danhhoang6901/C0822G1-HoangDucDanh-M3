<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 05/11/2022
  Time: 12:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Information Product</title>
</head>
<body>
<h1>Thông tin chi tiết sản phẩm</h1>
<p>
    <a href="/products">Quay lại Danh sách sản phẩm</a>
</p>
<table>
    <tr>
        <td>Name Product:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>Producer:</td>
        <td>${product.getProducer()}</td>
    </tr>
</table>
</body>
</html>