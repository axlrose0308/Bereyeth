<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Admin admin = null;
    Host host = null;
    Organizer organizer = null;
    String home = null;
    if (session.getAttribute("admin") != null) {
        admin = (Admin) session.getAttribute("admin");
        home = "/admin/";
    } else if (session.getAttribute("host") != null) {
        host = (Host) session.getAttribute("admin");
        home = "/host/";
    } else if (session.getAttribute("organizer") != null) {
        organizer = (Organizer) session.getAttribute("organizer");
        home = "/organizer/";
    }
%>
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
<h1>${error}</h1>
<form:form action="/seminar/edit" method="POST">
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

        <c:if test="${not empty organizers}">
        <tr>
            <td>
                <label for="organizerId">Host</label>
            </td>
            <td>
                <select id="organizerId" name="organizerId">
                    <c:forEach items="${organizers}" var="organizer">
                        <c:if test="${organizer.id==seminar.organizerByOrganizerId.id}">
                            <option value="${organizer.id}" selected="selected">${organizer.username}</option>
                        </c:if>
                        <c:if test="${organizer.id!=seminar.organizerByOrganizerId.id}">
                            <option value="${organizer.id}">${organizer.username}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
        </tr>
        </c:if>

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
                <label for="category">Category</label>
            </td>
            <td>
                <select id="category" name="category">
                    <c:forEach items="${categories}" var="category">
                        <c:if test="${category.equals(seminar.category)}">
                            <option selected="selected">${category}</option>
                        </c:if>
                        <c:if test="${not category.equals(seminar.category)}">
                            <option >${category}</option>
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
                <a href="<%=home%>">Return</a>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
