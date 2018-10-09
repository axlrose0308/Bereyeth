<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: eric
  Date: 2/09/18
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin Login</title>
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
<div class='login-bg'>
    <img src="/img/home-bg.png" class='login-bg-img'>
    <div class='login-form-container'>
        <img src="/img/logo.png" class='login-logo'>
        <h1>Admin Login</h1>
            <form:form action="/login/admin" method="POST">
                <div class=login-form>
                    <form>
                            <input type="text" id="username" name="username" placeholder="Username" />

                            <input type="password" id="password" name="password" placeholder="Password"/>
                    <div class="login-buttons">
                            <input type="submit" value="Login"/>
                    </div>
                    </form>
                </div>
            </form:form>
    </div>
    <h2>${error}</h2>
</div>
</body>
</html>
