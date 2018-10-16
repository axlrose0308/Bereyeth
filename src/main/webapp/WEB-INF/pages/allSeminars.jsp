<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: eric_stradlin
  Date: 15/10/18
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="utf-8">
    <title>All Seminars</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="/css/font-awesome.min.css">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="/css/swiper.min.css">

    <!-- Styles -->
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/custom.js"></script>
</head>
<body>
<div class="all-seminars">
    <h1>All Seminars</h1>
<form:form action="/seminar/allSeminars" method="post" id="all-seminars-form" name="all-seminars-form">
    <c:if test="${empty seminars}">
        <p>There are no available seminars.</p>
    </c:if>

    <c:if test="${not empty seminars}">
        <table>
        <tr>
            <c:forEach var="seminar" items="${seminars}">
                <div class='individual-seminar-item'>
                    <img src='/img/tech-banner.jpg' class='individual-seminar-item-banner'>
                    <h2>${seminar.subject}</h2>
                    <div class='individual-seminar-item-location'>
                        <img src='/img/location-icon.png' class='location-icon'>
                        <h4>${seminar.location}</h4>
                    </div>
                    <p>${seminar.holdDate} ${seminar.time}${seminar.duration} </p>
                    <a href="/seminar/details?id=${seminar.id}"><button>Read more</button></a>
                    <div class='individual-seminar-item-tags'>
                        <p>${seminar.category}</p>
                    </div>
                </div>
            </c:forEach>
            <td>
            <a href="/seminar/details?id=${seminar.id}">View detail</a>
                <button type="submit"> submit </button>
            </td>
            </tr>
        </table>
    </c:if>
</div>
</form:form>
</body>
</html>
