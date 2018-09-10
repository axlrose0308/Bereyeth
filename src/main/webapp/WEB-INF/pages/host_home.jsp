<%@ page import="java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: eaton
  Date: 2/09/18
  Time: 5:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    Date today = new Date(new java.util.Date().getTime());
%>
<%@include file="logout_component.jsp"%>
<h2>Welcome ${sessionScope.host.username}</h2>
<c:if test="${not empty seminars}">
    <h3>Seminars that you host</h3>
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
            <th>Organizer</th>
            <th>Status</th>
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
                <td>${seminar.organizerByOrganizerId.username}</td>
                <td>
                <c:choose>
                    <c:when test="${seminar.passed()}">
                        PASSED
                    </c:when>
                    <c:otherwise>
                        UPCOMING
                    </c:otherwise>
                </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty seminars}">
    <h1>No seminar that is hosted by you.</h1>
</c:if>
</body>
</html>
