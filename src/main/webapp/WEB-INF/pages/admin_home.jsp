<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 2/09/18
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SMS</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="/css/swiper.min.css">
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


<div class='about-section-v2'>
    <h1>User Management</h1>
<div class="your-seminar-section">
<table>
    <h2>All hosts</h2>
    <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Phone Number</th>
    </tr>
<c:forEach var="host" items="${hosts}">
        <tr>
            <td >${host.username}</td>
            <td >${host.email}</td>
            <td >${host.phone}</td>
            <td >
                <a href="/host/edit?id=${host.id}"><img src="/img/edit.png" class="table-icon"></a>
            </td>
            <td><a href="/admin/delete_host?id=${host.id}"><img src="/img/delete.png" class="table-icon"></a></td>
        </tr>
</c:forEach>
</table>
    <div class='create-seminar-buttons'>
        <a href="/admin/add_host"><button class="create-seminar-button">Create Host</button></a>
    </div>
</div>
</div>

<div class="about-section-v2">
    <div class="your-seminar-section">
<table>
    <h2>All Organizers</h2>
    <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th></th>
        <th></th>
    </tr>
<c:forEach var="organizer" items="${organizers}">
    <tr>
            <td >${organizer.username}</td>
            <td >${organizer.email}</td>
            <td >${organizer.phone}</td>
            <td >
                <a href="/admin/modify_organizer?id=${organizer.id}"><img src="/img/edit.png" class="table-icon"></a>
            </td><td>
                <a href="/admin/delete_organizer?id=${organizer.id}"><img src="/img/delete.png" class="table-icon"></a>
            </td>
        </tr>
</c:forEach>
</table>
        <div class='create-seminar-buttons'>
            <a href="/admin/add_organizer"><button class="create-seminar-button">Create Organizer</button></a>
        </div>

    </div></div>

<div class="about-section-v2">
    <div class="your-seminar-section">
<table>
    <h2>All Seminars</h2>
    <tr>
        <th>Subject</th>
        <th>Location</th>
        <th>Date</th>
        <th>Time</th>
        <th>Category</th>
        <th>Duration</th>
        <th>Host</th>
        <th>Organizer</th>
        <th colspan="3"></th>
    </tr>
    <c:forEach items="${seminars}" var="seminar">
        <tr>
            <td>${seminar.subject}</td>
            <td>${seminar.location}</td>
            <td>${seminar.holdDate}</td>
            <td>${seminar.time}</td>
            <td>${seminar.category}</td>
            <td>${seminar.duration}</td>
            <td>${seminar.adminByAdminId.username}</td>
            <c:if test="${seminar.hostByHostId.deleted}"><td>Deleted</td></c:if>
            <c:if test="${not seminar.hostByHostId.deleted}"><td>${seminar.hostByHostId.username}</td></c:if>
            <c:if test="${not seminar.passed()}"><td><a href="/seminar/edit?seminarId=${seminar.id}"><img src="/img/edit.png" class="table-icon"></a></td></c:if>
            <c:if test="${seminar.passed()}"><td> </td></c:if>
            <td><a href="/seminar/attendees?seminarId=${seminar.id}"><img src="/img/attendance.png" class="table-icon"></a></td>
            <td><a href="/seminar/delete?seminarId=${seminar.id}"><img src="/img/delete.png" class="table-icon"></a></td>
        </tr>
    </c:forEach>
</table>
        <div class='create-seminar-buttons'>
            <a href="/seminar/add"><button class="create-seminar-button">Create Seminar</button></a>
        </div>
    </div>
</div>

<div class="about-section-v2">
    <div class="your-seminar-section">
<h3>Create</h3>
<form:form action="/admin/get_type" method="POST">
    <label for="createType">What do you want to create </label>
    <select id="createType" name="createType">
        <option>Host</option>
        <option>Organizer</option>
        <option>Seminar</option>
    </select>
    <input type="submit" value="Confirm" class="create-seminar-button"/>
</form:form>
</div>
</div>


<footer class="site-footer">
    <div class="footer-container">
        <div class="footer-top">
            <div class="footer-top-container">
                <h1>Contact</h1>
                <p>For any questions or comments, please contact us through the email address below.</p>
                <h3><b>uts_sms@uts.edu.au</b></h3>
            </div>
        </div>

        <div class='footer-container-bottom'>
            <img src='/img/logo.png'>
            <ul class='nav-menu'>
                <a href="index.jsp"><li>Home</li></a>
                <a href='/index'><li>About Us</li></a>
                <a href='/seminars'><li>Seminars</li></a>
                <a href='/contact'><li>Contact</li></a>
            </ul>
        </div>
    </div>
</footer>
</body>
</html>
