<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Modify Attendee</title>
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
    <h1>Attendee Management</h1>

    <div class='user-management-bg'>
        <h2>Modify Attendee</h2>

<form:form action="/seminar/attendees/edit" method="POST" class='create-user-form'>
    <table>
        <tr>
            <td>
                <label for="id">ID</label>
            </td>
            <td>
                <input type="text" id="id" name="id" readonly="readonly" value="${attendee_editted.id}" class="seminar-form-input"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Email</label>
            </td>
            <td>
                <input type="text" readonly="readonly" value="${attendee_editted.email}" class="seminar-form-input"/>
            </td>
        </tr>
        <tr>
            <td>
                <label >Code</label>
            </td>
            <td>
                <input type="text" readonly="readonly" value="${attendee_editted.code}" class="seminar-form-input"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="name">Full Name</label>
            </td>
            <td>
                <input type="text" id="name" name="name" value="${attendee_editted.nameTag}" class='seminar-form-input'/>
            </td>
        </tr>
        <tr>
            <td> <input type="hidden" id="seminarId" name="seminarId" value="${seminarId}" /></td>
        </tr>
    </table>
        <div class='create-seminar-buttons'>
            <input type="submit" value="Confirm" class='create-seminar-button'/>
            </form:form>
        </div>
        <a href="/seminar/attendees?seminarId=${seminar.id}"><button class='back-seminar-button'>Back</button></a>
    </div>
</div>

</body>
</html>
