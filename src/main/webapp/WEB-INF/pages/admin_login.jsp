<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: eaton
  Date: 2/09/18
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Admin Login:</h1>
<form:form action="/login/admin" method="POST">
    <table>
        <tr>
            <td>
                <label for="username">username</label>
            </td>
            <td>
                <input type="text" id="username" name="username"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">password</label>
            </td>
            <td>
                <input type="password" id="password" name="password"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Login"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
