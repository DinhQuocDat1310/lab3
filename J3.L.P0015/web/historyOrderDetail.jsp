<%-- 
    Document   : historyOrderDetail
    Created on : Mar 8, 2021, 10:33:43 PM
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
        <title>ORDER HISTORY</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <div class="header">
            <a href="#" class="logo">Car Rental</a>
            <div class="header-right">
                <a style="color: red;">Welcome, ${user.fullName}</a>
                <a  href="loadCarDefault">Home</a>
                <c:if test="${user.role eq 'new'}">
                    <a href="UserVerifyServlet">Verify Email</a>
                </c:if>
                <c:if test="${user.role eq 'active'}">
                    <a href="viewcartPage">Renting</a>
                    <a href="loadOrder">History Renting</a>
                    <a class="active" href="#">History Renting Detail</a>
                </c:if>
                <a href="logout">Log Out</a>
            </div>
        </div>
        <div style="margin-top: 40px"></div>
        <c:set var="listDetail" value="${requestScope.LISTDETAIL}"/>
        <c:if test="${not empty listDetail}">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Renting ID</th>
                        <th scope="col">Car ID</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Unit Price</th>
                        <th scope="col">rental Date</th>
                        <th scope="col">return Date</th>
                        <th scope="col">Status</th>
                        <th scope="col">FeedBack</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${listDetail}" varStatus="counter">
                        <tr>
                    <form action="">

                        <th scope="row">${counter.count}</th>
                        <td>${dto.rentingID}</td>
                        <td>${dto.carID}</td>
                        <td>${dto.quantity}</td>
                        <td>${dto.price}</td>
                        <td>
                            <input type="date" value="${dto.rentalDate}" disabled/>
                        </td>
                        <td>
                            <input type="date" value="${dto.returnDate}" disabled/>
                        </td>
                        <c:if test="${dto.status eq true}"> 
                            <td>Active</td>    
                        </c:if>
                        <c:if test="${dto.status eq false}"> 
                            <td>InActive</td>    
                        </c:if>

                        <td>
                            <button type="submit" class="btn btn-success">FeedBack</button>
                        </td>
                    </form>

                </tr>

            </c:forEach>
        </tbody>
    </table>   
</c:if>        



</body>
</html>
