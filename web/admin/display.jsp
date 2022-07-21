<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : display
    Created on : May 28, 2021, 10:30:57 PM
    Author     : duchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <c:forEach items="${requestScope.imgBase}" var="img">
      
          <img src="data:image/png;base64,${img}"/>
        </c:forEach>
    </body>
</html>
