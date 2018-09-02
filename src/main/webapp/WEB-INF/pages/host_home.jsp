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
<h2>host info</h2>
<table>
    <tr>
        <td>host username:</td>
        <td>${sessionScope.host.username}</td>
    </tr>
    <tr>
        <td>host password:</td>
        <td>${sessionScope.host.password}</td>
    </tr>
</table>
</body>
</html>
