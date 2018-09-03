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
</head>
<body>
<%@include file="logout_component.jsp"%>
<h2>admin info</h2>
<table>
    <tr>
        <td>admin username:</td>
        <td>${sessionScope.admin.username}</td>
    </tr>
    <tr>
        <td>admin password:</td>
        <td>${sessionScope.admin.password}</td>
    </tr>
</table>
<h3>All hosts:</h3>
<c:forEach var="host" items="${hosts}">
    <c:if test="${!host.deleted}">
        <tr>
            <td rowspan="4">${host.username}</td>
            <td rowspan="4">${host.phone}</td>
            <td rowspan="4">${host.email}</td>
            <td rowspan="4">
                <a href="/admin/modify_host?id=${host.id}">Modify</a>
                <a href="/admin/deletehost?id=${host.id}">Delete</a>
            </td>
        </tr>
    </c:if>
</c:forEach>
<h3>Create account</h3>
<form:form action="/admin/get_type" method="POST">
    <label for="createType">Which do you want to create </label>
    <select id="createType" name="createType">
        <option>Host</option>
        <option>Organizer</option>
    </select>
    <input type="submit" value="Confirm"/>
</form:form>
</body>
</html>
