<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 4/09/18
  Time: 11:29 AM
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
<form:form action="/admin/modify_organizer" method="POST">
    <table>
        <tr>
            <td>
                <label for="id">ID</label>
            </td>
            <td>
                <input type="text" id="id" name="id" value="${organizer.id}" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="username">Username</label>
            </td>
            <td>
                <input type="text" id="username" name="username" value="${organizer.username}" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">Password</label>
            </td>
            <td>
                <input type="password" id="password" name="password" value="${organizer.password}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="repeatpassword">Repeat password</label>
            </td>
            <td>
                <input type="password" id="repeatpassword" name="repeatpassword" value="${organizer.password}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="email">Email</label>
            </td>
            <td>
                <input type="text" id="email" name="email" value="${organizer.email}"/>
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
<<a href="/admin/"></a>
</body>
</html>
