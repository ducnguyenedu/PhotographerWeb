<%-- 
    Document   : homePage
    Created on : 30-05-2021, 01:47:46
    Author     : duchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="root/css/index.css">
        <link href="root/css/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="root/css/nav.css" rel="stylesheet" type="text/css"/>
        <script src="root/js/nav.js" type="text/javascript"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="root/js/homepagedata.js" type="text/javascript"></script>

    </head>
    <body>
        <jsp:include page="menuBar.jsp"/>

        <div class="container">
            <div class="left">
                <div class="main-left">
                    <img src="root/images/home.jpg" alt="lorem ipsum dolor sit amet">
                    <figcaption><i>Lorem ipsum dolor sit amet</i></figcaption>
                </div>
                <div class="content-left">

                    <c:forEach items="${sessionScope.homePageDisplay}" var="o">
                        <input type="hidden" id="homePageDisplayID" name="homePageDisplayID" value="${o.id}">
                        <input type="hidden" id="homePageDisplayName" name="homePageDisplayName" value="${o.name}">
                        <input type="hidden" id="homePageDisplayDescription" name="homePageDisplayDescription" value="${o.description}">
                        <c:forEach items="${o.images}" var="img">
                            <input type="hidden" id="homePageDisplayImg" name="homePageDisplayImg" value="${img.encode}">

                        </c:forEach>
                    </c:forEach>
                    <script>
                        getData();

                    </script>
                    <div id="galleryDisplay"name="galleryDisplay">

                    </div>



                </div>
                <div id="btnPage" name="btnPage"></div>
                <script>
                    renderGallery();
                    btnPage();
                </script>
                <div class="last-div-left">
                    <h2>About me</h2>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim</p>
                </div>
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
</html>
