<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 9/09/18
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seminars</title>
    <link rel="stylesheet" href="/css/style.css">
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
                <h1>${seminar.subject}</h1>
            </div>
        </div>
    </div>
</header>

<div class='single-seminar-section'>
    <div class='single-seminar-banner'>
        <img src='/img/tech-banner.jpg'>
    </div>
    <div class='single-seminar-details'>
        <h2>${seminar.subject}</h2>
        <div class='single-seminar-location'>
            <img src='/img/location-icon.png' class='seminar-location-icon'>
            <h4>${seminar.location}</h4>
        </div>

        <div class='single-seminar-top-buttons'>
            <button class='delete-seminar-button'>Back to Seminars</button></div>

        <h5>${seminar.holdDate} ${seminar.time}${seminar.duration}</h5>
        <p>${seminar.description}</p>

        <div class='single-seminar-extra-details'>
            <p>Category: <span>${seminar.category}</span></p>
            <div class='single-seminar-host'>
                <img src='/img/user-icon.png' class='seminar-user-icon'>
                <p>Hosted by <span>${seminar.hostByHostId.username}</span></p>
            </div>


            <div class="cancel-section">
                <form:form action="/seminar/attendees/delete" method="get">
                    <p><b>To cancel your registration, enter your registration code below.</b></p>
                    <input type="text" name="code" width="100"/>
                    <input type="submit" value="Cancel" class="cancel-btn"/>
                </form:form>
            </div>

            <div class="register-section">
                <h3>Registration</h3>
                <form:form action="/seminar/register" method="POST">
                    <input type="text" id="nameTag" name="nameTag" placeholder="Name"/>
                    <input type="email" id="email" name="email" placeholder="Email Address"/>
                        <input type="hidden" name="seminarId" value="${seminar.id}"/>
                        <input type="submit" value="Register" class="create-seminar-button"/>
                </form:form>
                <h4>${error}</h4>
            </div>
        </div>
        </div>
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




<!--<table style="align-content: center" width="500" border="0.5">
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
<h2>${error}</h2> -->

</body>
</html>
