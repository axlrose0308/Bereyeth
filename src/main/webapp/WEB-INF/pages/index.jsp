<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %><%--
  Created by IntelliJ IDEA.
  User: eaton
  Date: 31/08/18
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
</head>
<body>
<h1>Welcome to seminar management system</h1>

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
    if (home != null) {
%>
<h2>You are now logged in
    as ${sessionScope.admin.username}${sessionScope.host.username}${sessionScope.organizer.username}</h2>
<a href="<%=home%>">Home</a>
<a href="/logout">Log out</a>
<%} else {%>
<a href="/redirect/admin">Admin Login</a>
<a href="/redirect/host">Host Login</a>
<a href="/redirect/organizer">Organizer Login</a>
<%}%>

<c:if test="${empty seminars}">
    <h1>No available seminars</h1>
</c:if>
<c:if test="${not empty seminars}">
    <h3>Seminars currently available.</h3>
    <table>
        <tr>
            <th>Subject</th>
            <th>Hold Date</th>
            <th></th>
        </tr>
        <c:forEach var="seminar" items="${seminars}">
            <tr>
                <td>
                        ${seminar.subject}
                </td>
                <td>
                        ${seminar.holdDate}
                </td>
                <td>
                    <a href="/seminar/details?id=${seminar.id}">View detail</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>
