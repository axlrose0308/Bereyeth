<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Cancel Registration</title>
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

<div class="center">
<h1>You have successfully cancelled you registration for ${seminar.subject}</h1>
<a href="/"><button class='back-seminar-button'>Back</button></a>
</div>


</body>
</html>
