<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: eaton
  Date: 3/09/18
  Time: 5:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form action="/host/edit" method="POST">
    <table border="1">
        <tr>
            <td>
                <label for="id">ID</label>
            </td>
            <td>
                <input type="text" id="id" name="id" readonly="readonly" value="${host.id}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="username">Username</label>
            </td>
            <td>
                <input type="text" id="username" name="username" readonly="readonly" value="${host.username}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">Password</label>
            </td>
            <td>
                <input type="password" id="password" name="password" value="${host.password}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="repeatpassword">repeat password</label>
            </td>
            <td>
                <input type="password" id="repeatpassword" name="repeatpassword" value="${host.password}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="phone">Phone</label>
            </td>
            <td>
                <input type="text" id="phone" name="phone" value="${host.phone}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="email">Email</label>
            </td>
            <td>
                <input type="text" id="email" name="email" value="${host.email}"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Confirm"/>
            </td>
        </tr>
    </table>
</form:form>
<h1>${error}</h1>
</body>
</html>
