<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 10/09/18
  Time: 11:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form action="/seminar/attendees/edit" method="POST">
    <table border="1">
        <tr>
            <td>
                <label for="id">ID</label>
            </td>
            <td>
                <input type="text" id="id" name="id" readonly="readonly" value="${attendee_editted.id}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Email</label>
            </td>
            <td>
                <input type="text" readonly="readonly" value="${attendee_editted.email}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label >Code</label>
            </td>
            <td>
                <input type="text" readonly="readonly" value="${attendee_editted.code}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="name">Name Tag</label>
            </td>
            <td>
                <input type="text" id="name" name="name" value="${attendee_editted.nameTag}"/>
            </td>
        </tr>
        <tr>
            <td> <input type="hidden" id="seminarId" name="seminarId" value="${seminarId}"/></td>
            <td>
                <input type="submit" value="Confirm"/>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
