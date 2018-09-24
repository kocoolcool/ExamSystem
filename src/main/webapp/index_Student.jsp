<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!--判斷登入者身分的程式碼(aaa)-->
<%session= request.getSession(false);
if(session.getAttribute("LoginOK")!= null){ 
  if((String.valueOf(session.getAttribute("WhichIdentity"))).equals(String.valueOf(2))== true){%>
<c:set var="visitName" value="${LoginOK.studentName}" scope="session" />
<%}}
if(session.getAttribute("LoginOK")!= null){ 
  if((String.valueOf(session.getAttribute("WhichIdentity"))).equals(String.valueOf(1))== true){%>
<c:set var="visitName" value="${LoginOK.employeeName}" scope="session" />
<%}}
if(session.getAttribute("LoginOK")!= null){ 
  if((String.valueOf(session.getAttribute("WhichIdentity"))).equals(String.valueOf(0))== true){%>
<c:set var="visitName" value="${LoginOK.employeeName}" scope="session" />
<%}}else{%>
<c:set var="visitName" value="訪客" scope="session" />
<%}%>
<!--判斷登入者身分的程式碼-->


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>


<!-- 以下為了google第三方登入加的 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="65257694703-upl97b2f58a3spn0ts8opmtefbkbgnkd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script src="js/google3.js"></script>
<!-- 以上為了google第三方登入加的 -->



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ExamSystem</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Unicat project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><!--使用bootstrap 掛載css的樣式-->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="css/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link rel="stylesheet" type="text/css" href="css/about.css">
<link rel="stylesheet" type="text/css" href="css/about_responsive.css">
<link rel="stylesheet"
	href='<c:url value="css/jquery-ui-1.10.4.custom.css"/>'>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="css/EEIT10127_AccessibleMegaMenu.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>



<!-- 以上保留，下面放自己的資源 -->
<!-- <script src="js/jquery-3.3.1.min.js"></script> -->
<script src="js/jquery-accessibleMegaMenu.js"></script>

<link rel="stylesheet" href="/css/bootstrap-theme.min.css"><!--使用bootstrap 掛載css的樣式-->

<!-- <script src="https://code.jquery.com/jquery.js"></script>使用bootstrap 掛載JS的樣式 -->
<!------ 以下為使用bootstrap 為了首頁之影片 ---------->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ 以上為使用bootstrap 為了首頁之影片 ---------->

<!-- 智輝加的 -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://itemslide.github.io/dist/itemslide.min.js"></script>
<!-- 智輝加的結束 -->

<script>
	
</script>

<style>
/*  以下為了背景圖之前區塊內的影片而加的css樣式(bootstrap 4.0.0) */
.video {
    height: 0;
    position: relative;
    padding-bottom: 56.25%; /* Если видео 16/9, то 9/16*100 = 56.25%. Также и с 4/3 - 3/4*100 = 75% */
}
.video iframe {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
}
/*  以上為了背景圖之前區塊內的影片而加的css樣式(bootstrap 4.0.0) */


table {
	border: 2px solid blue;
	border-collapse: collapse;
}

td {
	border: 1px solid blue
}
user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;

    margin: 0;
    padding: 0 0 0 0 ;
    position: absolute;
    /*top:10%;*/
/*     margin-top:4vh; */
    height:100%;

    list-style-type: none;

    -webkit-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transform-style: preserve-3d;
	
	margin:0 0 0 0 ;
/* 	border:3px solid red; */
}

/* //智輝開始 */
#scrolling { /* Carousel Frame */
          position:static;   
/*        top:0;     */
/*        bottom: 0%; */

       background:lightblue;/*FF473D*/  
      height:60%; 
     width:100%; 
	padding-bottom:50px;
	padding-top:0;
	margin:0 0 0 0 ;
/*     overflow: visible;  */
}

#ulSlider {
    /*Add if you want to disable the option of selecting the text while sliding*/
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;

    margin: 0;
    padding: 0 0 0 0 ;
    position: absolute;
    /*top:10%;*/
/*     margin-top:4vh; */
    height:100%;

    list-style-type: none;

    -webkit-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transform-style: preserve-3d;
	
	margin:0 0 0 0 ;
/* 	border:3px solid red; */
}

#liSlider {
       font-size:8vmin;/*cool*/
    float: left;
    width:25vw;
    min-width: 800px;
/*     height: auto; */
	height: auto;
    color: #000;
    font-weight: 300;
    text-align: center;
    border-radius: 30px;
    -webkit-border-radius: 30px;
    -o-border-radius: 30px;
    -moz-border-radius: 30px;
    cursor: pointer;
/*     background: #FFF; */
    -webkit-transform:  scale(0.95);
    -ms-transform:  scale(0.95);
    -moz-transform:  scale(0.95);
    transform: scale(0.95);
/*     border:3px solid green; */
    
    margin: 0;
    padding: 0 0 0 0 ;
}

.itemslide-active
{/*applied to current active item*/
    -webkit-transform:  scale(1);
    -ms-transform:  scale(1);
    -moz-transform:  scale(1);
    transform: scale(1);
}

/* //智輝結束 */
</style>
</head>
<body background="images/home_slider_1.jpg">

<div class="super_container">

	<!-- Header -->

	<header class="header">
			
		<!-- Top Bar -->
		<div class="top_bar">
			<div class="top_bar_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="top_bar_content d-flex flex-row align-items-center justify-content-start">
								<ul class="top_bar_contact_list">
									<li><div class="question">Have any questions?</div></li>
									<li>
										<i class="fa fa-phone" aria-hidden="true"></i>
										<div>(02)6631-6666</div>
									</li>
									<li>
										<i class="fa fa-envelope-o" aria-hidden="true"></i>
										<div>EEIT10102@gmail.com</div>
									</li>
								</ul>
<!------------------------這邊填上登入頁面Google Login(asd)------------- -->
								<div class="top_bar_login ml-auto">
								    <div style="float:left" class="login_button"><a href="/ExamSystem/loginSystem/logouttt" ><b>登出</b></a></div>
								    <div style="float:left"><p>　　</p></div>								    
									<div style="float:left"><p style="color:Black"><font size="3">您好，學生${visitName}</font></p></div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>				
		</div>

		<!-- Header Content -->
		<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div  class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container">
								<a href="/ExamSystem/index" >
									<div  class="logo_text" >Exam<span>System</span></div>
								</a>
							</div>
							
							
<!-- 選單 選單 選單 選單 選單(qwe)-->					
     <nav class="main_nav_contaner ml-auto ml-auto">
        <ul class="nav-menu" >
            <li class="nav-item">
                <a  href="index_Student">首頁</a>
            </li>
            <li class="nav-item">
                <a  href="examAppointment/AppAllExam">預約考試</a>
            </li>
             <li class="nav-item">
                <a  href="myStudentProfile">維護考生個人資料</a>
             </li>
              <li class="nav-item">
                <a href="ContactUs_Student.jsp">地圖及聯絡</a>
            </li>
         
        </ul>
    </nav>
			


    
<!-- 								<nav class="main_nav_contaner ml-auto"> -->
<!------------------------------搜尋按鈕------------------------ --> 
<!--  								<div class="search_button"><i class="fa fa-search" aria-hidden="true"></i></div>  -->
<!------------------------------購物車按鈕------------------------ -->
<!-- 								<div class="shopping_cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div>  -->
								
<!-- 								Hamburger -->
								<div class="hamburger menu_mm">
									<i class="fa fa-bars menu_mm" aria-hidden="true"></i>
								</div>
							</nav>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Header Search Panel -->
		<div class="header_search_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_search_content d-flex flex-row align-items-center justify-content-end">
							<form action="#" class="header_search_form">
								<input type="search" class="search_input" placeholder="Search" required="required">
								<button class="header_search_button d-flex flex-column align-items-center justify-content-center">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>			
		</div>			
	</header>

	<!-- Menu -->

	<div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
		<div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
		<div class="search">
			<form action="#" class="header_search_form menu_mm">
				<input type="search" class="search_input menu_mm" placeholder="Search" required="required">
				<button class="header_search_button d-flex flex-column align-items-center justify-content-center menu_mm">
					<i class="fa fa-search menu_mm" aria-hidden="true"></i>
				</button>
			</form>
		</div>
		<nav class="menu_nav">
			<ul class="menu_mm">
				<li class="menu_mm"><a href="/ExamSystem/index">Home</a></li>
				<li class="menu_mm"><a href="#">Appointment</a></li>
				<li class="menu_mm"><a href="#">Exam</a></li>
				<li class="menu_mm"><a href="#">Leave</a></li>
				<li class="menu_mm"><a href="#">Mail</a></li>
				<li class="menu_mm"><a href="#">Manage</a></li>
				<li class="menu_mm"><a href="contact.html">Contact222222222</a></li>
			</ul>
		</nav>
	</div>
	
	<!-- Home -->

	<div class="home">
		<div class="breadcrumbs_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="breadcrumbs">
							<ul>
								<li><a href="http://localhost:8080/ExamSystem/index_Student.jsp">首頁</a></li>
					  <!--zxc--><li style="color:Black; font-size:17px">歡迎您登入考試系統之<b style="color:blue">學生</b>首頁</li><!--<font size="3"></font>-->
								<!-- 這邊記得修改當前所在位置 -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>			
	</div>

		<!-- 背景圖案	 -->
		<div style="background-image:url(images/home_slider_3.jpg) ;height:765px" >
<!-- 		<img src="images/home_slider_1.jpg"> -->
<!-- 		<!-- About --> 


<!-- 		  <!-- 以下自己設計(是在背景圖之前的區塊) -->


			<!--  調整距離用的div -->
			<div style="height: 10px; text-align: left"></div>  <!-- border:3px blue dashed;  -->
			<!--  調整距離用的div -->
			
			  <BR><!--  調整距離用的br -->
			  <BR><!--  調整距離用的br -->
			  <BR><!--  調整距離用的br -->
			
			
<div style="float:left; width:1800px; height:250px" class="container">


	<div class="row" style="width:1900px">  <!-- border:3px black dashed;  -->
	
	
        <div style="width:680px; height:155px" align="center">  <!-- border:3px red dashed;  -->
    	<div style="height:500px"><iframe src="https://www.youtube.com/embed/6JvuJwpFhcw" frameborder="0"  allow="autoplay; encrypted-media" allowfullscreen></iframe></div>
    	</div>
    	
    	
        <div style="width:550px">  <!-- width:700px; border:3px blue dashed;  -->
    	    <p></p>
		</div>

		
		<div style="width:320px; height:155px" align="center">  <!-- width:500px; border:3px red dashed;  -->
        <div style="height:250px"><iframe src="https://www.youtube.com/embed/oxxTHYZBkag" frameborder="0"  allow="autoplay; encrypted-media" allowfullscreen></iframe></div>
    	</div>
		
		
	</div>
	
	
</div>
			  <!-- 以上自記設計(是在背景圖之前的區塊) -->
			  
			  
<!-- 		背景圖案 -->





	<!-- 智輝開始 -->	
<div style="float:left; width:1800px; height:250px ; padding-bottom:0 ; padding-top:240px" class="container">
	<div class="row" style="width:1900px">  <!-- border:3px black dashed;  -->
		        <div style="width:680px; height:155px" align="center">  <!-- border:3px red dashed;  -->
<script>
var carousel;
$(document).ready(function () {
    carousel = $("#ulSlider");
    carousel.itemslide(
	   {
	        disable_slide: false,
	        duration: 1500,
	        parent_width:false,
	    });

	    carousel.on('changePos', function(e) {
// 	        console.log("new pos: "+ carousel.getCurrentPos());
		});
	
		carousel.on('swipeout', function(event) {
// 	        console.log("swiped out slide - "+ event.slide);
		});
});

</script>

<%-- <c:if test="${not empty allCMBeanForShowList}"> --%>
<!-- 	<div id="scrolling"> -->
<!-- 	<ul id="ulSlider"> -->
<%-- 		<c:forEach var="CMBeanForShow" items="${allCMBeanForShowList}"> --%>
<%-- 			<li id="liSlider"><a href="${CMBeanForShow.linkURL}"><img src='data:image/jpeg;base64, ${CMBeanForShow.base64image}'  alt="${CMBeanForShow.title}" width="500px" height="200px"/></a></li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<!-- 	</div> -->
<%-- </c:if>	 --%>

	
			<c:if test="${not empty allCMBeanForShowList}">
				<div id="scrolling">
				<ul id="ulSlider">
					<c:forEach var="CMBeanForShow" items="${allCMBeanForShowList}">
						<li id="liSlider"><a href="${CMBeanForShow.linkURL}"><img src='data:image/jpeg;base64, ${CMBeanForShow.base64image}'  alt="${CMBeanForShow.title}" width="500px" height="200px"/></a></li>
					</c:forEach>
				</ul>
				</div>
			</c:if>	
		</div>
    </div>
</div>
<!-- 智輝結束 -->




		</div>
		
		

		<!-- Footer -->
		<footer class="footer">
		<div class="footer_background"
			style="background-image: url(images/footer_background.png)"></div>
		<div class="container">
			<div class="row footer_row">
				<div class="col">
					<div class="footer_content">
						<div class="row">

							<div class="col-lg-3 footer_col">
								<!-------------------------------Footer About開始----------------------------------->
								<div class="footer_section footer_about">
									<div class="footer_logo_container">
										<a href="#">
											<div class="footer_logo_text">
												Exam<span>System</span>
											</div>
										</a>
									</div>
									<div class="footer_about_text">
										<p>Only You.Official social pipeline.</p>

									</div>
									<div class="footer_social">
										<ul>
											<li><a href="http://taipei.iiiedu.org.tw/"><i
													class="fa fa-facebook" aria-hidden="true"></i></a></li>
											<li><a href="http://taipei.iiiedu.org.tw/"><i
													class="fa fa-google-plus" aria-hidden="true"></i></a></li>
											<li><a href="http://taipei.iiiedu.org.tw/"><i
													class="fa fa-instagram" aria-hidden="true"></i></a></li>
											<li><a href="http://taipei.iiiedu.org.tw/"><i
													class="fa fa-twitter" aria-hidden="true"></i></a></li>
										</ul>
									</div>
								</div>

							</div>

							<div class="col-lg-3 footer_col">
								<!-------------------------------Footer About結束------------------------------------>
								<!-------------------------------Footer Contact開始----------------------------------->
								<div class="footer_section footer_contact">
									<div class="footer_title">Contact Us</div>
									<div class="footer_contact_info">
										<ul>
											<li>Email: EEIT10102@gmail.com</li>
											<li>Phone: (02)6631-6666</li>
											<li>2F., No.390, Sec. 1, Fuxing S. Rd., Da’an Dist.,
												Taipei City 106, Taiwan (R.O.C.)</li>
										</ul>
									</div>
								</div>

							</div>

							<div class="col-lg-3 footer_col">
								<!-------------------------------Footer links----------------------------------->
								<div class="footer_section footer_links">
									<div class="footer_title">Contact Us</div>
									<div class="footer_links_container">
										<ul>
											<li><a href="/ExamSystem/index">Home</a></li>
											<li><a href="about.html">Appointment</a></li>
											<li><a href="/ExamSystem/index.jsp">Exam</a></li>
											<li><a href="#">Leave</a></li>
											<li><a href="courses.html">Mail</a></li>
											<li><a href="#">Manage</a></li>
											<li><a href="#">Contact</a></li>
											<li><a href="#">FAQs</a></li>
										</ul>
									</div>
								</div>

							</div>

							<div class="col-lg-3 footer_col clearfix">

								<!-------------------------------Footer links----------------------------------->
								<div class="footer_section footer_mobile">
									<div class="footer_title">WebSite</div>
									<div class="footer_mobile_content">
										<div class="footer_image">
											<a href="#"><img src="images/QRCode.png" alt=""></a>
										</div>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="row copyright_row">
				<div class="col">
					<div
						class="copyright d-flex flex-lg-row flex-column align-items-center justify-content-start">
						<div class="cr_text">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
						<div class="ml-lg-auto cr_links">
							<ul class="cr_list">
								<li><a href="#">Copyright notification</a></li>
								<li><a href="#">Terms of Use</a></li>
								<li><a href="#">Privacy Policy</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</footer>
	</div>
	
    <script>
    ////Google SignIn
    
	var profile=null;
	var id_token=null;
      function onSignIn(googleUser) {
        // 客户端如果有需要的话可以通过profile来获取用户信息
        profile = googleUser.getBasicProfile();
        // 传回后台验证，并获取userid
        id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);	
      };
      
      
     function go(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "http://localhost:8080/ExamSystem/googleVerify");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
//           console.log('Signed in as: ' + xhr.responseText);
        };
        xhr.send('idtokenstr=' + id_token);
//   	    location.href= "http://localhost:8080/ExamSystem/";
      };
      
      
      </script>


	<!-- 以下保留，可再增加自己的資源 -->
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script><!--使用bootstrap 掛載JS的樣式-->
	<script src="js/TweenMax.min.js"></script>
	<script src="js/TimelineMax.min.js"></script>
	<script src="js/ScrollMagic.min.js"></script>
	<script src="js/animation.gsap.min.js"></script>
	<script src="js/ScrollToPlugin.min.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/easing.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/jquery.colorbox-min.js"></script>
	<script src="js/about.js"></script>
	<script src="js/EEIT10127_AccessibleMegaMenu.js"></script>

</body>
</html>