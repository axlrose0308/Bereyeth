<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Admin admin = null;
    Host host = null;
    Organizer organizer = null;
    String home = null;
    if (session.getAttribute("admin") != null) {
        admin = (Admin) session.getAttribute("admin");
        home = "/admin/";
    } else if (session.getAttribute("host") != null) {
        host = (Host) session.getAttribute("admin");
        home = "/host/";
    } else if (session.getAttribute("organizer") != null) {
        organizer = (Organizer) session.getAttribute("organizer");
        home = "/organizer/";
    }
%>
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
                <c:if test="${seminar.passed()}"><td></td></c:if>
                <c:if test="${not seminar.passed()}"><td><a href="/seminar/attendees/edit?id=${attendee.id}&seminarId=${seminar.id}">Edit</a></td></c:if>
            </tr>
        </c:forEach>
    </table>
    <a href="/seminar/attendees/download?id=${seminar.id}">Download attendees</a>
</c:if>
<c:if test="${empty attendees}">
    <h1>No one attends seminar No.${seminar.id} ${seminar.subject}</h1>
</c:if>
<a href="<%=home%>">Back</a>

</body>
</html>
