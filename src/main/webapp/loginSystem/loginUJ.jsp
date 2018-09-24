<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html lang="en-US">
    <head>
        <title>Boxus - Html Responsive One Page Template</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Template by Colorlib" />
        <meta name="keywords" content="HTML, CSS, JavaScript, PHP" />
        <meta name="author" content="Colorlib" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="shortcut icon" href="images/favicon.png" />
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,400i,700,700i,900|Montserrat:400,700|PT+Serif' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css"  href='css/clear.css' />
        <link rel="stylesheet" type="text/css"  href='css/common.css' />
        <link rel="stylesheet" type="text/css"  href='css/font-awesome.min.css' />
        <link rel="stylesheet" type="text/css"  href='css/carouFredSel.css' />
        <link rel="stylesheet" type="text/css"  href='css/prettyPhoto.css' />
        <link rel="stylesheet" type="text/css"  href='css/sm-clean.css' />
        <link rel="stylesheet" type="text/css"  href='css/style.css' />

        <!--[if lt IE 9]>
                <script src="js/html5.js"></script>
        <![endif]-->

    </head>
    <body class="single-portfolio">

        <!-- Preloader Gif -->
        <table class="doc-loader">
            <tr>
                <td>
                    <img src="images/ajax-document-loader.gif" alt="Loading..." />
                </td>
            </tr>
        </table>

        <!-- Menu -->
        <div class="menu-wrapper center-relative">
            <nav id="header-main-menu">
                <div class="mob-menu">MENU</div>
                <ul class="main-menu sm sm-clean">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#services">Services</a></li>
                    <li><a href="#portfolio">Portfolio</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#news">News</a></li>
                    <li><a href="#video">Video</a></li>
                    <li><a href="#skills">Skills</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </nav>
        </div>



        <article id="portfolio-2" class="section portfolio">
            <div class="center-relative content-1170">
                <div class="entry-content">
                    <div class="content-wrap relative">
                    
                    
                        <a class="absolute x-close" href="index">
                            <img src="images/icon_x.svg" alt="Close">
                        </a>


                        <div class="clear"></div>
                        <br>
                        <br>
                        <br>
                        
                        
                        <div class="one_half text-right">
							<br>
                                <span style="color: #e54b76;font-size:50px;">Welcome to</span>
                            <br>
                            <br>
                                <span style="color: #e54b76;font-size:70px;">PMderr</span>
                        </div>
                        
                        
                        <div class="one_half last ">
                            <div class="contact-form">
                            <form:form method='POST' modelAttribute="memberBean">
                            	<p><input type="text" class="myP" name="email" placeholder="Email"></p>
                                <p><input type="password" class="myP" name="pswd" placeholder="Password"></p>
                                <p><input type="submit" value="Login"></p>
                            </form:form>
                            </div>
                            
                        <br>
                        
                        <div style="text-align:center;">或    <a href="addMember">Sign Up</a></div>
                        </div>
                        
                        
                        <div class="clear"></div>
                        
                        
                    </div>
                </div>
                
                <div class="clear"></div>
                
            </div>



            <!-- Footer -->
            <footer>
                <div class="footer content-1170 center-relative">
                    <ul>
                        <li class="copyright-footer">
                            © 2018 All rights reserved. | Boxus Template by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        </li>
                        <li class="social-footer">
                            <a href="#"><span class="fa fa-twitter"></span></a>
                            <a href="#"><span class="fa fa-behance"></span></a>
                            <a href="#"><span class="fa fa-dribbble"></span></a>
                            <a href="#"><span class="fa fa-facebook"></span></a>
                            <a href="#"><span class="fa fa-rss"></span></a>
                        </li>
                    </ul>
                </div>
            </footer>
        </article>




        <!--Load JavaScript-->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type='text/javascript' src='js/jquery.sticky-kit.min.js'></script>
        <script type='text/javascript' src='js/jquery.smartmenus.min.js'></script>
        <script type='text/javascript' src='js/jquery.sticky.js'></script>
        <script type='text/javascript' src='js/jquery.dryMenu.js'></script>
        <script type='text/javascript' src='js/isotope.pkgd.js'></script>
        <script type='text/javascript' src='js/jquery.carouFredSel-6.2.0-packed.js'></script>
        <script type='text/javascript' src='js/jquery.mousewheel.min.js'></script>
        <script type='text/javascript' src='js/jquery.touchSwipe.min.js'></script>
        <script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
        <script type='text/javascript' src='js/imagesloaded.pkgd.js'></script>
        <script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
        <script type='text/javascript' src='js/main.js'></script>
    </body>
</html>
