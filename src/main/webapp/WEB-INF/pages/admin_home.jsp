<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 2/09/18
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        td,th {
            padding: 2px;
        }
        table {
            border-spacing: 15px;
            padding: 5px;
            border: 0.6px solid chartreuse;
        }
    </style>
</head>
<body>
<%@include file="logout_component.jsp"%>
<h2>Welcome ${sessionScope.admin.username}</h2>
<table>
    <thead>All hosts</thead>
    <tr>
        <th>Username</th>
        <th>Phone</th>
        <th>Email</th>
    </tr>
<c:forEach var="host" items="${hosts}">
        <tr>
            <td >${host.username}</td>

            <td >${host.phone}</td>
            <td >${host.email}</td>
            <td >
                <a href="/host/edit?id=${host.id}">Modify</a>
            </td>
            <td><a href="/admin/delete_host?id=${host.id}">Delete</a></td>
        </tr>
</c:forEach>
</table>

<table>
    <thead>All Organizers</thead>
    <tr>
        <th>Username</th>
        <th>Email</th>
        <th></th>
        <th></th>
    </tr>
<c:forEach var="organizer" items="${organizers}">
    <tr>
            <td >${organizer.username}</td>
            <td >${organizer.email}</td>
            <td >
                <a href="/admin/modify_organizer?id=${organizer.id}">Modify</a>
            </td><td>
                <a href="/admin/delete_organizer?id=${organizer.id}">Delete</a>
            </td>
        </tr>
</c:forEach>
</table>

<table>
    <thead>All Seminars</thead>
    <tr>
        <th>Id</th>
        <th>Location</th>
        <th>Date</th>
        <th>Time</th>
        <th>Category</th>
        <th>Subject</th>
        <th>Description</th>
        <th>Duration</th>
        <th>Capacity</th>
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
            <td>${seminar.category}</td>
            <td>${seminar.subject}</td>
            <td>${seminar.description}</td>
            <td>${seminar.duration}</td>
            <td>${seminar.capacity}</td>
            <td>${seminar.adminByAdminId.username}</td>
            <td>${seminar.hostByHostId.username}</td>
            <td><a href="/seminar/attendees?seminarId=${seminar.id}">View attendees</a></td>
            <td><a href="/seminar/edit?seminarId=${seminar.id}">Edit</a></td>
            <td><a href="/seminar/delete?seminarId=${seminar.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>

<h3>Create account</h3>
<form:form action="/admin/get_type" method="POST">
    <label for="createType">What do you want to create </label>
    <select id="createType" name="createType">
        <option>Host</option>
        <option>Organizer</option>
        <option>Seminar</option>
    </select>
    <input type="submit" value="Confirm"/>
</form:form>
</body>
</html>
