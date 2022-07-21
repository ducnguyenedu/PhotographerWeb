<%-- 
    Document   : admin
    Created on : May 28, 2021, 8:57:08 PM
    Author     : duchi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Admin" method="POST"enctype="multipart/form-data">
            NumberUserOnline: ${sessionScope.numOnline}</br>
            Name:  <input type="text"id="name" name="name"></br>
            Description:  <input type="text"id="description" name="description"></br>
            JPG Images:  <input type="file"id="image" name="image" multiple></br>
            <button type="submit">Submit</button>
        </form>

    </body>
</html>
