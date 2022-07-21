<%-- 
    Document   : contact
    Created on : 30-05-2021, 21:37:55
    Author     : dinhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="root/css/index.css">
        <link rel="stylesheet" href="root/css/responsive.css">
        <link rel="stylesheet" href="root/css/contact.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="root/css/nav.css" rel="stylesheet" type="text/css"/>
        <script src="root/js/nav.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="menuBar.jsp"/>

        <div class="container">
            <div class="left">
                <div class="info-div">
                    <h4>PHOTOGRAPHER</h4>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>Address: </td>
                                <td>Dinh Cong</td>
                            </tr>
                            <tr>
                                <td>City: </td>
                                <td>Ha Noi</td>
                            </tr>
                            <tr>
                                <td>Country: </td>
                                <td>VietNam</td>
                            </tr>
                        </tbody>

                        <tr>
                            <td>Tel: </td>
                            <td href="tel:12345">
                                12345
                            </td>
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td href="
                                your-email@your-email.com
                                ">
                                your-email@your-email.com
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="div-img-left">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14900.872707801827!2d105.81994767877988!3d20.983889676361542!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acf587927d3f%3A0x407ca203a0891b89!2zxJDhu4tuaCBDw7RuZywgSG_DoG5nIE1haSwgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1623464015526!5m2!1svi!2s" 
                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

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
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v10.0" nonce="fZ9yLSi2"></script>

    </body>
</html>