<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %><%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 31/08/18
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>SMS</title>
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
    <!--
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
    -->
</head>

<body>
<header class="site-header">
    <div class="header-bg">
        <img src="/img/home-bg.png" class="header-bg">
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
                            <button class="login-dropbtn"><p>${sessionScope.admin.username}${sessionScope.host.username}${sessionScope.organizer.username} | <a href="/logout">Log Out</a></p></button>
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


            <div class="title-container">
                <h1>Find and register for UTS seminars here!</h1>
            </div>
        </div>
    </div>
</header>


<form:form action="/" method="GET">
    <!--<table>
    <tr>
        <td>
            <select id="category" name="category">
                <option>All</option>
                <c:forEach items="${categories}" var="category">
                    <c:if test="${category.equals(selected)}">
                        <option selected="selected">${category}</option>
                    </c:if>
                    <c:if test="${not category.equals(selected)}">
                        <option>${category}</option>
                    </c:if>
                </c:forEach>
            </select>
        </td>
        <td>
            <input type="submit" value="View By Category"/>
        </td>
    </tr>
</table>-->
</form:form>

<div class="about-section">
    <div class="about-section-icon">
        <img src="/img/logo.png">
    </div>
    <div class="about-section-desc">
        <h1>What is UTS SMS?</h1>
        <p>UTS SMS is the dedicated Seminar Management System for the University of Technology Sydney. Here you will see all the upcoming seminar's for UTS, and are able to register to attend them! To get started, visit the Seminars page to find a seminar that interests you.</p>

        <div class="cancel-section">
        <form:form action="/seminar/attendees/delete" method="get">
            <p><b>To cancel your registration, enter your registration code below.</b></p>
            <input type="text" name="code" width="100"/>
            <input type="submit" value="Cancel" class="cancel-btn"/>
        </form:form>
        <h3>${error}</h3>
        </div>

    </div>

</div>

<div class="seminars-section">
    <img src="/img/seminars-banner.jpg">
    <div class="seminars-section-desc">
        <h1>Seminars</h1>
        <a href="#"><button><span>Click to search for seminars</span></button></a>
    </div>
</div>

<div class='upcoming-seminars-section'>
    <h1>Upcoming Seminars</h1>

<c:if test="${empty seminars}">
    <p>There are no available seminars.</p>
</c:if>

<c:if test="${not empty seminars}">
    <!--<table >
        <tr>
            <th>Subject</th>
            <th>Hold Date</th>
            <th>Category</th>
            <th></th>
        </tr>-->
        <c:forEach var="seminar" items="${seminars}">
    <div class='individual-seminar-item'>
        <img src='img/tech-banner.jpg' class='individual-seminar-item-banner'>
        <h2>${seminar.subject}</h2>
        <div class='individual-seminar-item-location'>
            <img src='img/location-icon.png' class='location-icon'>
            <h4>${seminar.location}</h4>
        </div>
        <p>${seminar.holdDate} ${seminar.time} </p>
        <a href="/seminar/details?id=${seminar.id}"><button>Read more</button></a>
        <div class='individual-seminar-item-tags'>
            <p>${seminar.category}</p>
        </div>
    </div>


           <!-- <tr>
                <td >
                        ${seminar.subject}
                </td>
                <td>
                        ${seminar.holdDate}
                </td>
                <td>
                        ${seminar.category}
                </td>
                <td>
                    <a href="/seminar/details?id=${seminar.id}">View detail</a>
                </td>
            </tr>-->
        </c:forEach>
    </div>

    <!--</table>-->
</c:if>

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
            <img src='img/logo.png'>
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
