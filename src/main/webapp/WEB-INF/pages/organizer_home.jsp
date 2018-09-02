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
<h2>Organizer info</h2>
<table>
    <tr>
        <td>organizer username:</td>
        <td>${sessionScope.organizer.username}</td>
    </tr>
    <tr>
        <td>organizer password:</td>
        <td>${sessionScope.organizer.password}</td>
    </tr>
</table>
</body>
</html>
