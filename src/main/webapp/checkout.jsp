<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="domain.Cart" %><%--
  Created by IntelliJ IDEA.
  User: asus-b
  Date: 1/29/2021
  Time: 8:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Three Brothers - Checkout</title>
    <style>
        <%@include file="/resources/css/products.css" %>
    </style>
    <style>
        <%@include file="/resources/css/layout.css" %>
    </style>
    <style>
        <%@include file="/resources/css/checkout.css" %>
    </style>
    <script>
        async function checkout() {
            await fetch('http://covidkw.info/trobicano/api/send_email', {
                method: 'POST',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify({
                    email_to: this.email,
                    email_from: 'info@threebrothers.com',
                    email_subject: 'New Order',
                    email_body: 'Thanks for using The Three Brothers store for your purchases. We provide quality product to you always.',
                }),
            });
        }
    </script>
</head>
<body>
<header>
    <%@include file="navbar.jsp" %>
</header>

<div class="row justify-content-center">
    <section class="box row">
        <article class="col-6">
            <div class="mx-auto">
                <p class="primary-color">Your cart contains these items</p>
            </div>
            <ol>
                <c:forEach items="${cart.products}" var="product">
                    <li>
                            ${product.name}
                        <span class="ml-2">$${product.price}</span>
                    </li>
                </c:forEach>
            </ol>
            <p id="total">Total: <span id="total-price">$${cart.totalCost}</span></p>
        </article>
        <article class="col-6">
            <p class="primary-color">Place an order</p>
            <form method="post" class="mt-3 checkout-form">
                <label>
                    Email: <input id="email" type="email" name="email" required>
                </label>
                <label>
                    Shipping Address:
                    <textarea id="address" class="w-100 mt-3" rows="10" cols="50" name="address" required></textarea>
                </label>
                <input type="submit" onclick="checkout()" value="Place an Order">
            </form>
        </article>
    </section>
</div>
</body>
</html>
