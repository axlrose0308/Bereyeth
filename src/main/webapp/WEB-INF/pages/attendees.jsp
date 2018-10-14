<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Attendees</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body>

<header class="site-header">
    <div class="header-bg">
        <img src="/img/home-bg-small.png" class="header-bg">
        <div class="header-container">
            <div class="header-top">
                <div class="header-top-logo"><a href="index.jsp"><img src="/img/logo.png" class="header-logo"></a></div>

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

                <div class="header-top-login">
                    <button class="login-dropbtn"><p>${sessionScope.admin.username}${sessionScope.host.username}${sessionScope.organizer.username} | <a href="/logout" class="logout-btn">Log Out</a></p></button>
                </div>

                <%} else {%>
                <div class="header-top-login">
                    <button class="login-dropbtn">Login</button>
                    <div class="login-dropdown-content">
                        <a href="/redirect/admin">Administrator</a>
                        <a href="/redirect/organizer">Organizer</a>
                        <a href="/redirect/host">Host</a>
                    </div>
                </div>
                <%}%>

                <div class='header-links'>
                    <ul class='nav-menu'>
                        <li><a href='/'><li>Home</li></a></li>
                        <li><a href="/seminar/register">Seminars</a></li>
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>

<div class='user-management-section'>
    <h1>Attendees Management</h1>

    <div class='user-management-bg'>

<c:if test="${not empty attendees}">
    <h3>Attendees for seminar ${seminar.subject}</h3>
    <table>
        <tr>
            <th>Id</th>
            <th>Email</th>
            <th>Code</th>
            <th>Name</th>
            <th></th>
        </tr>
        <c:forEach items="${attendees}" var="attendee">
            <tr>
                <td>${attendee.id}</td>
                <td>${attendee.email}</td>
                <td>${attendee.code}</td>
                <td>${attendee.nameTag}</td>
                <c:if test="${seminar.passed()}"><td></td></c:if>
                <c:if test="${not seminar.passed()}"><td><a href="/seminar/attendees/edit?id=${attendee.id}&seminarId=${seminar.id}"><img src="/img/edit.png" class="table-icon"></a></td></c:if>
                <td><a href="/seminar/attendees/delete?id=${attendee.id}&seminarId=${seminar.id}"><img src="/img/delete.png" class="table-icon"></a></td>
            </tr>
        </c:forEach>
    </table>

    <a href="/seminar/attendees/download?id=${seminar.id}"><button class="create-seminar-button">Download attendees</button></a>
</c:if>
<c:if test="${empty attendees}">
    <div class="center">
    <h2>No one attends seminar ${seminar.subject}</h2>
    </div>
</c:if>
    <a href="<%=home%>"><button class='back-seminar-button'>Back</button></a>
    </div>
</div>

</body>
</html>
