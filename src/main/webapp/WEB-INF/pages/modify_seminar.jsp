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
<h1>${error}</h1>
<form:form action="/organizer/seminars/edit" method="POST">
    <table>
        <tr>
            <td>
                <label for="seminarId">Seminar Id</label>
            </td>
            <td>
                <input type="number" name="seminarId" id="seminarId" readonly="readonly" value="${seminar.id}">
            </td>
        </tr>
        <tr>
            <td>
                <label for="location">Location</label>
            </td>
            <td>
                <input type="text" id="location" name="location" value="${seminar.location}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="time">Time</label>
            </td>
            <td>
                <input type="time" id="time" name="time" value="${seminar.time}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="subject">Subject</label>
            </td>
            <td>
                <input type="text" id="subject" name="subject" value="${seminar.subject}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="description">Description</label>
            </td>
            <td>
                <textarea name="description" id="description" rows="6">${seminar.description}</textarea>
            </td>
        </tr>

        <tr>
            <td>
                <label for="duration">Duration</label>
            </td>
            <td>
                <input type="time" id="duration" name="duration" value="${seminar.duration}"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="capacity">Capacity</label>
            </td>
            <td>
                <input type="number" min="1" id="capacity" name="capacity" value="${seminar.capacity}"/>
            </td>
        </tr>

        <tr>
            <td>
                <label for="hostId">Host</label>
            </td>
            <td>
                <select id="hostId" name="hostId">
                    <c:forEach items="${availableHosts}" var="host">
                        <c:if test="${host.id==seminar.hostByHostId.id}">
                            <option value="${host.id}" selected="selected">${host.username}</option>
                        </c:if>
                        <c:if test="${host.id!=seminar.hostByHostId.id}">
                            <option value="${host.id}">${host.username}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="holdDate">Hold date</label>
            </td>
            <td>
                <input type="date" id="holdDate" name="holdDate" value="${seminar.holdDate}"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Save"/>
            </td>
            <td>
                <a href="/organizer/">Return</a>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
