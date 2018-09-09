<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tong
  Date: 9/09/18
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form action="/organizer/seminars/add" method="POST">
    <table>
        <tr>
            <td>
                <label for="location">location</label>
            </td>
            <td>
                <input type="text" id="location" name="location"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="time">Time</label>
            </td>
            <td>
                <input type="time" id="time" name="time"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="subject">Subject</label>
            </td>
            <td>
                <input type="text" id="subject" name="subject"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="description">Subject</label>
            </td>
            <td>
                <textarea name="description" id="description" rows="6"></textarea>
            </td>
        </tr>

        <tr>
            <td>
                <label for="duration">Duration</label>
            </td>
            <td>
                <input type="time" id="duration" name="duration"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="capacity">Capacity</label>
            </td>
            <td>
                <input type="number" min="1" id="capacity" name="capacity"/>
            </td>
        </tr>


        <tr>
            <td>
                <label for="hostId">Host</label>
            </td>
            <td>
                <select id="hostId" name="hostId">
                    <c:forEach items="${availableHosts}" var="host">
                        <option value="${host.id}">${host.username}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="holdDate">Hold date</label>
            </td>
            <td>
                <input type="date" id="holdDate" name="holdDate"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Create"/>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
