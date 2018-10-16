<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>

<%--
  Created by IntelliJ IDEA.
  User: eric_stradlin
  Date: 15/10/18
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="utf-8">
    <title>All Seminars</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="/css/font-awesome.min.css">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="/css/swiper.min.css">

    <!-- Styles -->
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/custom.js"></script>
</head>
<body>

<header class="site-header">
    <div class="header-bg">
        <img src="/img/seminars-bg.jpg" class="header-bg">
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
                        <li><a href="/seminar/allSeminars">Seminars</a></li>
                        <li><a href='/'>About us</a></li>
                        <li><a href='/'>Contact</a></li>
                    </ul>
                </div>
            </div>

            <div class="title-container">
                <h1>All Seminars</h1>
            </div>
        </div>
    </div>
</header>


<div class='search-seminars-section'>
<form:form action="/" method="GET">
    <select id="category" name="category">
        <option>Forum</option>
        <option>Lecture</option>
        <option>Academic Conference</option>
        <option>Summit Meeting</option>
    <c:forEach items="${categories}" var="category">
        <c:if test="${category.equals(selected)}">
            <option selected="selected">${category}</option>
        </c:if>
        <c:if test="${not category.equals(selected)}">
            <option>${category}</option>
        </c:if>
    </c:forEach>
    </select>
    <input type="submit" value="View By Category"/>
</form:form>
</div>


<div class="all-seminars">
<form:form action="/seminar/allSeminars" method="post" id="all-seminars-form" name="all-seminars-form">
    <c:if test="${empty seminars}">
        <h2>There are no available seminars.</h2>
    </c:if>

    <c:if test="${not empty seminars}">
            <c:forEach var="seminar" items="${seminars}">
                <div class='individual-seminar-item'>
                    <img src='/img/tech-banner.jpg' class='individual-seminar-item-banner'>
                    <h2>${seminar.subject}</h2>
                    <div class='individual-seminar-item-location'>
                        <img src='/img/location-icon.png' class='location-icon'>
                        <h4>${seminar.location}</h4>
                    </div>
                    <p>${seminar.holdDate} ${seminar.time}${seminar.duration} </p>
                    <a href="/seminar/details?id=${seminar.id}"><button>Read more</button></a>
                    <div class='individual-seminar-item-tags'>
                        <p>${seminar.category}</p>
                    </div>
                </div>
            </c:forEach>
    </c:if>
</div>
</form:form>

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
                <a href='/'><li>Home</li></a>
                <a href='/'><li>About Us</li></a>
                <a href='/seminar/allSeminars'><li>Seminars</li></a>
                <a href='/'><li>Contact</li></a>
            </ul>

        </div>
    </div>
</footer>

</body>
</html>
