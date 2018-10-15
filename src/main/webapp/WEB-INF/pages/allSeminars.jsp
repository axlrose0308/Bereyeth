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

    <c:if test="${empty seminars}">
        <p>There are no available seminars.</p>
    </c:if>

    <c:if test="${not empty seminars}">
        <table>
        <tr>
        <th>Subject</th>
        <th>Hold Date</th>
        <th>Category</th>
        <th></th>
        </tr>-->
            <tr>
            <td >
            ${seminar.subject}
            </td>
            <td>
            ${seminar.holdDate}
            </td>
            <td>
            ${seminar.category}
            </td>
            <td>
            ${seminar.location}
            </td>
            <td>
            ${seminar.time}
            </td>
            <td>
            <a href="/seminar/details?id=${seminar.id}">View detail</a>
            </td>
            </tr>
        </table>
    </c:if>
</div>

</body>
</html>
