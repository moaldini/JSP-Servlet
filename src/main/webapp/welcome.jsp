<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="prod" uri="org.example.my-custom-tags" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.Product" %><%--
  Created by IntelliJ IDEA.
  User: asus-b
  Date: 1/29/2021
  Time: 8:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>--%>
<html>
<head>
    <title>Three Brothers - Our Products</title>
    <link href="resources/css/welcome.css" rel="stylesheet">
    <link href="resources/css/layout.css" rel="stylesheet">
    <link href="resources/css/products.css" rel="stylesheet">

    <script type="text/javascript" src="resources/js/shopping.js"></script>
</head>
<body>

<%@include file="navbar.jsp" %>

<section class="ml-3" style="display:block;">
    <h1 class="ml-3">Our Products</h1>

    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class='product col-2'>
                <prod:Product product="${product}" />
                <input type='submit' value='Add to Cart' onclick='add("${product.id}")'
                       class='detail button button2' id='add'/>
            </div>

        </c:forEach>
    </div>
</section>
<section id="about-us">
    <h1>About Us</h1>
    <p></p>
</section>
<script>

</script>

</body>

</html>
