<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 05/11/2022
  Time: 12:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Find Product</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Find product</h1>
<p>
    <a href="/products">Back list product</a>
</p>
<form method="post">
    <fieldset>
        <legend>Find product:</legend>
        <table>
            <tr>
                <td><input type="radio" name="option" value="id" onclick="openInput(this.value)">ID:</td>
                <td><input type="text" name="id" id="id" disabled="disabled">
                </td>
                <td>Find exactly</td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="name" onclick="openInput(this.value)">Name Product:</td>
                <td><input type="text" name="name" id="name" disabled="disabled"></br>
                </td>
                <td>Find approximate:</td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="Price" onclick="openInput(this.value)">Price: From</td>
                <td></td>
                <td><input type="number" name="maxPrice" id="maxPrice" disabled="disabled"></td>
            </tr>
            <tr>
                <td><input type="radio" name="option" value="producer" onclick="openInput(this.value)">Producer:
                </td>
                <td><input type="text" name="producer" id="producer" disabled="disabled">
                </td>
                <td>Find approximate:</td>
            </tr>
            <tr>
                <td><input type="submit" value="Find product"></td>
            </tr>
        </table>

    </fieldset>
</form>
<h3>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</h3>
<table class="table">
    <tr>
        <td>Name Product</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
