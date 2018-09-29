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
<form:form action="/seminar/add" method="POST">
    <table>
        <tr>
            <td>
                <label for="location">location</label>
            </td>
            <td>
                <select id="location" name="location">
                    <option>UTS Building 11</option>
                    <option>UTS Building 10</option>
                    <option>UTS Building 7</option>
                    <option>UTS Building 6</option>
                    <option>UTS Building 5</option>
                    <option>UTS Buidling 4</option>
                    <option>UTS Buidling 3</option>
                    <option>UTS Buidling 1</option>
                </select>
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
                <label for="subject">Title</label>
            </td>
            <td>
                <input type="text" id="subject" name="subject"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="description">Description</label>
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
                <label for="capacity">Room Capacity</label>
            </td>
            <td>
                <select id="capacity" name="capacity">
                    <option>200</option>
                    <option>100</option>
                    <option>60</option>
                    <option>20e</option>
                </select>
            </td>
        </tr>
        <c:if test="${not empty organizers}">
            <tr>
                <td>
                    <label for="organizerId">Organizer</label>
                </td>
                <td>
                    <select id="organizerId" name="organizerId">
                        <c:forEach items="${organizers}" var="organizer">
                            <option value="${organizer.id}">${organizer.username}</option>
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
                        <option value="${host.id}">${host.username}</option>
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
                        <option>${category}</option>
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
<a href="<%=home%>">Return</a>

</body>
</html>
