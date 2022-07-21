<%-- 
    Document   : viewImage
    Created on : 30-05-2021, 02:09:55
    Author     : dinhd
--%>

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
        <link href="root/css/image.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>

    <body>
        <jsp:include page="menuBar.jsp"/>
        <div class="container">
            <div class="left">
                <div style="margin-left: 4%" class="main-left">

                    <button style="background-color: #834143; border-color: #834143">
                        <a href="Gallery?id=${requestScope.info.id}">
                            <i style="background-color: #834143;border-color: #834143;color: #fff">&#8592; Back to album</i>
                        </a>
                    </button>
                    <button style="margin-left: 20%;background-color: #834143; border-color: #834143">
                        <a href="Gallery?id=${requestScope.info.id}&img=${requestScope.img.id-1}">
                            <i style="background-color: #834143;border-color: #834143;color: #fff"class="fa fa-step-backward">&#9198;</i>
                        </a>
                    </button >
                    <button style="margin-left: 20%;background-color: #834143; border-color: #834143">
                        <a href="Gallery?id=${requestScope.info.id}&img=${requestScope.img.id+1}">
                            <i style="background-color: #834143;border-color: #834143;color: #fff"class="fa fa-step-forward">&#9197;</i></a>
                    </button>

                    <div class="div-img-left">
                        <img class=""  src="data:image/png;base64,${requestScope.img.encode}" alt="lorem ipsum dolor sit amet">
                    </div>
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
