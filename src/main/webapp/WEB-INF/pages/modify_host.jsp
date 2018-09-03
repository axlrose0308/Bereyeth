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
<form:form action="/admin/save_changed_host" method="POST">
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
                <input type="text" id="password" name="password"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="repeatpassword">repeat password</label>
            </td>
            <td>
                <input type="text" id="repeatpassword" name="repeatpassword"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="phone">phone</label>
            </td>
            <td>
                <input type="text" id="phone" name="phone"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="email">email</label>
            </td>
            <td>
                <input type="text" id="email" name="email"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Confirm"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
