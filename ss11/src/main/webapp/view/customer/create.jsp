<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 04/11/2022
  Time: 11:39 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>
<h1>Add Customer</h1>
<a href="/customer">Back</a><br>
<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>
<form action="/customer?action=create" method="post">
    <pre>Id: <input type="number" name="id"></pre>
    <pre>Name: <input type="text" name="name"></pre>
    <pre>Email: <input type="text" name="email"></pre>
    <pre>Address: <input type="text" name="address"></pre>
    <pre><button>Save</button></pre>
</form>
</body>
</html>
