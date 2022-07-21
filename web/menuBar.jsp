<%-- 
    Document   : menuBar.jsp
    Created on : 30-05-2021, 01:49:09
    Author     : dinhd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>


    <div class="topnav" id="myTopnav">
        <a></a>
        <a href="HomePage">My font page</a>
        <c:forEach var="i" begin="1" end="3">
            <a href="Gallery?id=${homePageDisplay[i-1].id}">${homePageDisplay[i-1].name}</a>
        </c:forEach>
        
        <a href="Contact">Contact</a>
        <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myMenu()">Menu</a>
    </div>



    <div class="titlepage">
        <div class="img-title">
            <img src="root/images/icon.png" alt="">
        </div>
        <div class="namepage">
            <div>
                <h1>        PHOTOGRAPHER</h1>
            </div>
            <div>
                <h3>Welcome to this website</h3>
            </div>
        </div>
    </div>
</header>
