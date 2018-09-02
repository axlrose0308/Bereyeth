<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
