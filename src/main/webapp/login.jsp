<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mohammed ALDINI
  Date: 02/01/2021
  Time: 8:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login page</title>
    <link href="<c:url value='resources/css/layout.css' />" rel="stylesheet">
    <link href="<c:url value="resources/css/auth.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/form.css" />" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.0/examples/sign-in/signin.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="text-center">
<main class="form-signin border radius">
    <form id="loginForm" method="post" action="login">
        <h1 class="h3 mb-3 fw-normal">Three Brothers Store</h1>
        <p class="primary-color">Please login to continue</p>
        <div class="section-alert"></div>
        <div class="input-group mb-1">
            <label for="usernameID" class="visually-hidden">User Name:</label>
            <input type="text" name="userName" id="usernameID" class="form-control required" placeholder="User Name:" required />
        </div>
        <div class="input-group mb-1">
            <label for="passwordID" class="visually-hidden">Password:</label>
            <input type="password" id="passwordID" name="password" class="form-control required" placeholder="Password:" required />
        </div>
        <div class="input-group mb-1">
            <label>Remember Me: <input type="checkbox" name="remember" value="yes"/></label>
        </div>
        <div class="m-2 text-center">
            <input type="submit" name="submit" value="LOGIN" class="btn login-btn w-100 btn-primary text-uppercase">
        </div>
        <c:if test="${errMsg}">
            <p style="color: #ff0000">${errMsg}</p>
        </c:if>
        <span class="mb-2 mt-5">Don't have an account yet? <a href="singUp">Sign up</a> </span>
    </form>
</main>
<script src="<c:url value='resources/js/jquery.js' />" type="text/javascript"></script>
<script src="<c:url value='resources/js/validation.js' />" type="text/javascript"></script>
</body>
</html>
