<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tong
  Date: 10/09/18
  Time: 8:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        th, td {
            padding: 2px;
        }
        table {
            border-spacing: 15px;
            padding: 5px;
            border: solid chartreuse;
        }
    </style>
</head>
<body>
<c:if test="${not empty attendees}">
    <h3>Attendees for Seminar No.${seminar.id} ${seminar.subject}</h3>
    <table>
        <tr>
            <th>Id</th>
            <th>Email</th>
            <th>Code</th>
            <th>Name</th>
            <th></th>
        </tr>
        <c:forEach items="${attendees}" var="attendee">
            <tr>
                <td>${attendee.id}</td>
                <td>${attendee.email}</td>
                <td>${attendee.code}</td>
                <td>${attendee.nameTag}</td>
                <td><a href="/seminar/attendees/delete?id=${attendee.id}&seminarId=${seminar.id}">Delete</a></td>
                <td><a href="/seminar/attendees/edit?id=${attendee.id}&seminarId=${seminar.id}">Edit</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty attendees}">
    <h1>No one attends seminar No.${seminar.id} ${seminar.subject}</h1>
</c:if>
<a href="/organizer/">Back</a>

</body>
</html>
