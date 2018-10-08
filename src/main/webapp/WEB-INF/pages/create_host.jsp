<%@ page import="model.Admin" %>
<%@ page import="model.Host" %>
<%@ page import="model.Organizer" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 2/09/18
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
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
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Create Host</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="/css/font-awesome.min.css">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="/css/swiper.min.css">

    <!-- Styles -->
    <link rel="stylesheet" href="css/style.css">
    <script src="/js/custom.js"></script>
</head>
<body>
<header class='site-header'>
    <div class='header-bg'>
        <img src='/img/seminars-bg.jpg' class='header-bg'>
        <div class='header-container'>
            <div class='header-top'>
                <div class='header-top-logo'><a href=<%=home%>><img src='/img/logo.png' class='header-logo'></a></div>
            </div>
            <div class='title-container'>
                <h1>Please enter the host information needed for creation.</h1>

            </div>
        </div>
    </div>
</header>
<form:form action="/admin/add_host" method="POST">
    <table>
        <tr>
            <td>
                <label for="username">username</label>
            </td>
            <td>
                <input type="text" id="username" name="username"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">password</label>
            </td>
            <td>
                <input type="password" id="password" name="password"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="email">email</label>
            </td>
            <td>
                <input type="email" id="email" name="email"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="phone">phone</label>
            </td>
            <td>
                <input type="text" id="phone" name="phone"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Create"/>
            </td>
        </tr>
    </table>
</form:form>
<h1>${error}</h1>
<a href="/admin/">Back</a>
</body>
</html>
