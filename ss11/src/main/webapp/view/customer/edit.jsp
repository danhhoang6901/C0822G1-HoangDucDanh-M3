<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 04/11/2022
  Time: 3:54 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Edit Customer</title>
</head>
<body>
<h1>Edit Customer</h1>
<a href="/customer">Back</a><br>
<c:if test="${mess!=null}">
    <span>${mess}</span>
</c:if>
<form action="/customer?action=edit" method="post">
    <pre>Id: <input type="number" name="id"></pre>
    <pre>Name: <input type="text" name="name" ></pre>
    <pre>Email: <input type="text" name="email" ></pre>
    <pre>Address: <input type="text" name="address"></pre>
    <pre><button>Update</button></pre>
</form>
</body>
</html>
