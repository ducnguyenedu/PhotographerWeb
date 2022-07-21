<%-- 
    Document   : viewGallery
    Created on : 30-05-2021, 02:01:51
    Author     : dinhd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="root/css/index.css">
        <link href="root/css/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="root/css/nav.css" rel="stylesheet" type="text/css"/>
        <script src="root/js/nav.js" type="text/javascript"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="root/css/gallery.css" rel="stylesheet" type="text/css"/>
        <script src="root/js/gallery.js" type="text/javascript"></script>
        <link href="root/css/lightbox.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>

    <body>
        <jsp:include page="menuBar.jsp"/>
        <div class="container">
            <div class="left">
                <div class="main-left">
                    <h2>${requestScope.info.name}</h2>
                    <c:forEach items="${requestScope.images}" var="o">
                        <input type="hidden" id="imageID" name="imageID" value="${o.id}"> 
                        <input type="hidden" id="imageData" name="imageData" value="${o.encode}">
                    </c:forEach>
                    <input type="hidden" id="curG" name="curG" value="${requestScope.info.id}">
                    <input type="hidden" id="curSlide" name="curSlide"value="0">

                    <div class="slideshow-container" id="imgSlide" name="imgSlide">



                    </div>

                </div>
                <div class="content-left"id="allImg" name="allImg">
                </div>
                <div id="btnPageG" name="btnPageG"></div>
            </div>

            <div class="right">
                <div class="right-share">
                    <div class="title-right">
                        <h2>Share this page</h2>
                    </div>
                    <div class="right-share2">
                        <ul>
                            <li>
                                <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.simplesite.com%2Fdefault.aspx&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">
                                    <img style="width:15px" src="root/images/fb.png" alt="">
                                    <span>Share on Facebook</span>
                                </a>
                            </li>

                            <li>
                                <a href="http://www.twitter.com/share?url=http://localhost:26831/J3LP0017/HomeController">
                                    <img style="width:15px" src="root/images/tw.png" alt="">
                                    <span>Share on Twitter</span></a>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>


    </body>
    <script>
        getData();
        renderImages();
        btnPageG();
        slideShow();

    </script>
</html>