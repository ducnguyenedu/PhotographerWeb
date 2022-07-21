<%-- 
    Document   : footer
    Created on : 30-05-2021, 01:52:14
    Author     : dinhd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer>
    <div class="div-footer">
        <div>
            <c:forEach items="${sessionScope.numOnlineFormat}" var="o">
                <span class="footer-page-counter-item">${o}</span>
            </c:forEach>
        </div>
    </div>
    <div class="div-site">
        <a href="https://www.simplesite.com/default.aspx">
            Created with SimpleSite
        </a>
    </div>
</footer>
