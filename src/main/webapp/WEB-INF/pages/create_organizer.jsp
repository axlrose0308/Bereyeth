<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 2/09/18
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Create Organizer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="/css/font-awesome.min.css">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="/css/swiper.min.css">

    <!-- Styles -->
    <link rel="stylesheet" href="../../css/style.css">
    <script src="/js/custom.js"></script>

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
    <h1>User Management</h1>

    <div class='user-management-bg'>
        <h2>Create Organizer</h2>
<form:form action="/admin/add_organizer" method="POST" class='create-user-form'>
    <table>
        <tr>
            <td>
                <label for="username">Username</label>
            </td>
            <td>
                <input type="text" id="username" name="username" class='seminar-form-input'/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">Password</label>
            </td>
            <td>
                <input type="password" id="password" name="password" class='seminar-form-input'/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="email">Email</label>
            </td>
            <td>
                <input type="email" id="email" name="email" class='seminar-form-input'/>
            </td>
        </tr>
    </table>
        <p class="login-error">${error}</p>

        <div class='create-seminar-buttons'>
            <input type="submit" value="Create" class='create-seminar-button'/>
            </form:form>
        </div>
        <a href="/admin/"><button class='back-seminar-button'>Back</button></a>
    </div>
</div>

        <footer class='site-footer'>
            <div class='footer-container'>
                <div class='footer-top'>
                    <div class='footer-top-container'>
                        <h1>Contact</h1>
                        <p>For any questions or comments, please contact us through the email address below.</p>
                        <h3>utsseminar@uts.edu.au</h3>
                    </div>
                </div>

                <div class='footer-container-bottom'>
                    <img src='/img/logo.png'>
                    <ul class='nav-menu'>
                        <a href='index.html'><li>Home</li></a>
                        <a href='index.html'><li>About Us</li></a>
                        <a href='seminars.html'><li>Seminars</li></a>
                        <a href='index.html'><li>Contact</li></a>
                    </ul>

                </div>
            </div>
        </footer>

</body>
</html>
