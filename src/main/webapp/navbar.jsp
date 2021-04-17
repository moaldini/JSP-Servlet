<%@ page import="domain.Cart" %><%--
  Created by IntelliJ IDEA.
  User: asus-b
  Date: 1/29/2021
  Time: 10:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    <%@include file="resources/css/navbar.css" %>
</style>
<nav>
    <ul class="menu-bar" style="height: fit-content">
        <li>
            <a href="/shopping">Home</a>
        </li>
        <c:if test="${user != null}">
            <li>
                <span>${user}'s Cart (<span id="count">${cart.productsSize}</span>)</span>
            </li>
        </c:if>
        <c:if test="${user == null}">
            <li>
                <span>Guest's Cart (<span id="count">${cart.productsSize}</span>)</span>
            </li>
        </c:if>

        <li>
            <a href="checkout">Checkout</a>
        </li>

        <li>
            <c:if test="${user == null}">
                <a href="login">Login</a>
            </c:if>
            <c:if test="${user != null}">
                <a href="logout">Logout</a>
            </c:if>
        </li>
    </ul>

</nav>