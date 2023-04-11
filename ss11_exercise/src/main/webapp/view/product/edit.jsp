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
    <title>Edit Product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back list product</a>
</p>
<form method="post">
    <fieldset>
        <legend>Information Product</legend>
        <table>
            <tr>
                <td>Name Product:</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>