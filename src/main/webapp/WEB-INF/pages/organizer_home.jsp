<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: eaton
  Date: 2/09/18
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="logout_component.jsp" %>
<h2>Welcome! ${sessionScope.organizer.username}</h2>

<c:if test="${not empty seminars}">
    <h3>Current seminars that you hold</h3>
    <table>
        <tr>
            <th>Id</th>
            <th>Location</th>
            <th>Date</th>
            <th>Time</th>
            <th>Subject</th>
            <th>Description</th>
            <th>Duration</th>
            <th>Capacity</th>
            <th>Admin</th>
            <th>Host</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach items="${seminars}" var="seminar">
            <tr>
                <td>${seminar.id}</td>
                <td>${seminar.location}</td>
                <td>${seminar.holdDate}</td>
                <td>${seminar.time}</td>
                <td>${seminar.subject}</td>
                <td>${seminar.description}</td>
                <td>${seminar.duration}</td>
                <td>${seminar.capacity}</td>
                <td>${seminar.adminByAdminId.username}</td>
                <td>${seminar.hostByHostId.username}</td>
                <td><a>View attendees</a></td>
                <td><a href="/organizer/seminars/edit?seminarId=${seminar.id}">Edit</a></td>
                <td><a href="/organizer/seminars/delete?seminarId=${seminar.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty seminars}">
    <h1>No seminar that is hold by you.</h1>
</c:if>
<a href="/organizer/seminars/add">Add seminar</a>
</body>
</html>
