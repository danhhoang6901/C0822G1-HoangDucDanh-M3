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
    <title>Edit Customer</title>
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
            <a style="font-weight: bold" class="navbar-brand" href="/customer?action=edit">Edit customer</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item" style="margin-left: 10px">
                        <a class="nav-link active" aria-current="page" href="/customer">List customer</a>
                    </li>
                    <li class="nav-item" style="margin-left: 10px">
                        <a class="nav-link active" aria-current="page" href="/customer?action=add">Add customer</a>
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
    <div style="height: 70%"align="center">
        <form action="/customer?action=edit" method="post">
            <fieldset>
                <legend>Edit Customer</legend>
                <table>
                    <tr>
                        <td>Id:</td>
                        <td><input type="hidden" name="id" id="id" value="${customer.getId()}"></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" id="name" value="${customer.getName()}"></td>
                    </tr>
                    <tr>
                        <td>Date Of Birth:</td>
                        <td><input type="text" name="birthday" id="birthday" value="${customer.getDateOfBirth()}"></td>
                    </tr>
                    <tr>
                        <td>Id Card:</td>
                        <td><input type="text" name="idCard" id="idCard" value="${customer.getIdCard()}"></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td><input type="radio" name="gender" value="true" }>Male
                            <input type="radio" value="false" name="gender" }>Female
                        </td>
                    </tr>
                    <tr>
                        <td>Phone number:</td>
                        <td><input type="text" name="phone" id="phone"
                                   value="${customer.getPhoneNumber()}"></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" id="email" value="${customer.getEmail()}"></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" id="address" value="${customer.getAddress()}"></td>
                    </tr>
                    <tr>
                        <td>Customer Type:</td>
                        <td>
                            <select name="customerTypeId">
                                <c:forEach var="ct" items="${customerTypeList}">
                                    <option value="${ct.getId()}">
                                            ${ct.getName()}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Edit customer"></td>
                    </tr>
                </table>

            </fieldset>
        </form>
    </div>
</div>
<footer class="text-center text-lg-start bg-light text-muted">
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
        <div class="me-5 d-none d-lg-block">
            <span>Get connected with us on social networks:</span>
        </div>
        <div>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-google"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-linkedin"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-github"></i>
            </a>
        </div>
    </section>
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3"></i>Company name
                    </h6>
                    <p>
                        Here you can use rows and columns to organize your footer content. Lorem ipsum
                        dolor sit amet, consectetur adipisicing elit.
                    </p>
                </div>
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Products
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Angular</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">React</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Vue</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Laravel</a>
                    </p>
                </div>
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Useful links
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Settings</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Orders</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Help</a>
                    </p>
                </div>
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                    <p><i class="fas fa-home me-3"></i> Da Nang, DN 50000, VN</p>
                    <p>
                        <i class="fas fa-envelope me-3"></i>
                        danhhoang0196@gmail.com
                    </p>
                    <p><i class="fas fa-phone me-3"></i> + 84 123 456 789</p>
                    <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                </div>
            </div>
        </div>
    </section>
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2022 Copyright:
        <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
    </div>
</footer>

</body>
</html>
