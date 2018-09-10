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
    <style>
        th, td {
            padding: 1px;
        }

        table {
            border-spacing: 15px;
            padding: 5px;
            border: solid chartreuse;
        }
    </style>
</head>
<body>

<table style="align-content: center" width="500" border="0.5">
    <thead><h1>Seminar Detail</h1></thead>
    <tr>
        <td>
            <label>Seminar Id</label>
        </td>
        <td>
            <h3>${seminar.id}</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Location</label>
        </td>
        <td>
            <h3>${seminar.location}</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Category</label>
        </td>
        <td>
            <h3>${seminar.category}</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Time</label>
        </td>
        <td>
            <h3>${seminar.time}</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Subject</label>
        </td>
        <td>
            <h3>${seminar.subject}</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Description</label>
        </td>
        <td>
            <h3>${seminar.description}</h3>
        </td>
    </tr>

    <tr>
        <td>
            <label>Duration</label>
        </td>
        <td>
            <h3>${seminar.duration}"</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Capacity</label>
        </td>
        <td>
            <h3>${seminar.capacity}</h3>
        </td>
    </tr>

    <tr>
        <td>
            <label>Host</label>
        </td>
        <td>
            <h3>${seminar.hostByHostId.username}</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Organizer</label>
        </td>
        <td>
            <h3>${seminar.organizerByOrganizerId.username}</h3>
        </td>
    </tr>
    <tr>
        <td>
            <label>Hold date</label>
        </td>
        <td>
            <h3>${seminar.holdDate}</h3>
        </td>
    </tr>
    <tr>
        <form:form action="/seminar/register" method="POST">
    <tr>
        <td>
            <input type="email" id="email" name="email" placeholder="Fill in with your email to register"/>
        </td>

        <td>
            <input type="text" id="nameTag" name="nameTag" placeholder="Enter you name tag"/>
        </td>
    </tr>
    <tr>
        <td>
            <input type="hidden" name="seminarId" value="${seminar.id}"/>
        </td>

        <td>
            <input type="submit" value="Register"/>
        </td>
    </tr>
    </form:form>
</table>
<a href="/">Back</a>
<h2>${error}</h2>

</body>
</html>
