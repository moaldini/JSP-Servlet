<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 1/31/2021
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Three Brothers Store - Thanks!</title>
    <style><%@include file="resources/css/layout.css"%></style>
    <style>
        body {
            display: flex;
        }
        #thanks {
            width: 500px;
        }
    </style>
</head>
<body>
    <div id="thanks" class="mx-auto my-auto box">
        <h1>Thanks for purchasing items!</h1>
        <p>
            Your items will be send to the <span class="primary-color">${address}</span>
        </p>
    </div>
</body>
</html>
