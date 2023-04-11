<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 08/11/2022
  Time: 3:43 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="vh-100">
    <nav class="navbar navbar-light bg-light" style="height: 20%">
        <div class="container-fluid">
            <img src="https://cdn.azvd.asia/images/furama/logo-m.png" alt="" width="200" height="100"
                 class="d-inline-block align-text-top">
            <h1>FURAMA</h1>
        </div>
    </nav>
    <nav class="navbar navbar-expand-lg navbar-light bg-secondary" style="height: 10%">
        <div class="container-fluid" style="margin-left: 40px">
            <a style="font-weight: bold" class="navbar-brand" href="/customer?action=add">Add customer</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item" style="margin-left: 10px">
                        <a class="nav-link active" aria-current="page" href="/customer">List employee</a>
                    </li>
                    <li class="nav-item" style="margin-left: 10px">
                        <a class="nav-link" href="/employee">Employee</a>
                    </li>
                    <li class="nav-item" style="margin-left: 10px">
                        <a class="nav-link" href="/service">Service</a>
                    </li>
                    <li class="nav-item" style="margin-left: 10px">
                        <a class="nav-link" href="#">Contract</a>
                    </li>
                    <li class="nav-item" style="margin-left: 10px">
                        <a class="nav-link" href="/home">Home</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button style="color: black;background: green" class="btn btn-outline-success" type="submit">
                        Search
                    </button>
                </ul>
            </div>
        </div>
    </nav>
    <div style="height: 70%" align="center">
        <p>
            <c:if test="${mess != null}">
                <span class="message">${mess}</span>
            </c:if>
        </p>
        <form method="post">
            <fieldset>
                <legend>Add Customer</legend>
                <table>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <td>Date Of Birth:</td>
                        <td><input type="text" name="birthday" id="birthday"></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td><input type="radio" name="gender" value="true" }>Male
                            <input type="radio" value="false" name="gender" }>Female
                        </td>
                    </tr>
                    <tr>
                        <td>Id Card:</td>
                        <td><input type="text" name="idCard" id="idCard"></td>
                    </tr>
                    <tr>
                        <td>Phone number:</td>
                        <td><input type="text" name="phone" id="phone"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" id="email"></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" id="address"></td>
                    </tr>
                    <tr>
                        <td>Customer Type:</td>
                        <td>
                               <select name="customerTypeId">
                                   <c:forEach var="ct" items="${customerTypeList}">
                                       <option value="${ct.getId()}">${ct.getName()}</option>
                                   </c:forEach>
                               </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Create customer"></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
