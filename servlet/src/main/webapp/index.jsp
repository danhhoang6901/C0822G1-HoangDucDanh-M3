<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 02/11/2022
  Time: 11:27 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/display-discount" method="post">
    <label>Product Description: </label><br>
    <input type="text" name="productDescription" placeholder="Input product description"><br>
    <label>List Price: </label><br>
    <input type="number" name="listPrice" placeholder="Input list price"><br>
    <label>Discount Percent: </label><br>
    <input type="number" name="discountPercent" placeholder="Input discount percent"><br>
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
