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
    <title>Three Brothers Store - Sign Up</title>
    <link href="<c:url value='resources/css/layout.css' />" rel="stylesheet">
    <link href="<c:url value="resources/css/auth.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/form.css" />" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.0/examples/sign-in/signin.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="text-center">
<main class="form-signin border">
    <form id="loginForm" method="post" action="singUp">
        <h1 class="h3 mb-3 fw-normal">Three Brothers Store</h1>
        <p class="primary-color">Please sign up to continue</p>
        <div class="section-alert"></div>
        <label>Full Name: <input type="text" name="fullName" class="form-control required" /></label>
        <label>User Name: <input type="text" name="userName" class="form-control required" /></label>
        <label>Email: <input type="email" name="email" class="form-control required" /></label>
        <label>Password: <input type="password" name="password" class="form-control required" /></label>
        <div class="m-2 text-center">
            <input type="submit" name="submit" value="SIGNUP" class="btn reg-btn w-100 btn-primary text-uppercase">
        </div>
        <p>You are already a customer? <a href="login">Login</a></p>
    </form>
</main>
<script src="<c:url value='resources/js/jquery.js' />" type="text/javascript"></script>
<script src="<c:url value='resources/js/validation.js' />" type="text/javascript"></script>
</body>
</html>
