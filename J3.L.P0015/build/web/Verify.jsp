<%-- 
    Document   : Verify
    Created on : Mar 4, 2021, 10:57:40 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/header.css">
        <title>Verify Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <div class="header">
            <a href="#" class="logo">Car Rental</a>
            <div class="header-right">
                <a style="color: red;">Welcome, ${user.fullName}</a>
                <a href="loadCarDefault">Home</a>
                <c:if test="${user.role == 'new'}">
                    <a class="active" href="#">Verify Email</a>
                </c:if>
                <c:if test="${user.role != 'active'}">
                    <a href="viewcartPage">Renting</a>
                </c:if>
                <a href="logout">Log Out</a>
            </div>
        </div>
        <div style="margin-top: 20px;"></div>
        <form action="VerifyCode">
            <div class="input-group mb-3" style="width: 60%; margin: auto;">
                <input type="number" name="authcode" class="form-control" placeholder="Input Code..." aria-label="Apply Discount"
                       aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-outline-primary" type="submit">Verify Code</button>
                </div>
            </div>
        </form>
    </body>
</html>