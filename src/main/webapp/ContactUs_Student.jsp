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
<title>地圖及聯絡</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Unicat project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="css/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link rel="stylesheet" type="text/css" href="css/about.css">
<link rel="stylesheet" type="text/css" href="css/about_responsive.css">
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
<%-- <link rel="stylesheet" href='<c:url value="css/jquery-ui-1.10.4.custom.css"/>'> --%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="css/EEIT10127_AccessibleMegaMenu.css">  
<!-- 以上保留，下面放自己的資源 -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/EEIT10106-jquery.email-autocomplete.js"></script>
 <script src="js/jquery-accessibleMegaMenu.js"></script>


<link href='http://fonts.googleapis.com/css?family=Bitter'
	rel='stylesheet' type='text/css'>
	
<!-- 	fontawesome.com -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">	
	
<style type="text/css">
.form-style-10 {
	width: 450px;
	padding: 30px;
	margin: 40px auto;
	background: #FFF;
	border-radius: 10px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
	-moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
	-webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
}

.form-style-10 .inner-wrap {
	padding: 30px;
	background: #F8F8F8;
	border-radius: 6px;
	margin-bottom: 15px;
}

.form-style-10 h1 {
	background: #2A88AD;
	padding: 20px 30px 15px 30px;
	margin: -30px -30px 30px -30px;
	border-radius: 10px 10px 0 0;
	-webkit-border-radius: 10px 10px 0 0;
	-moz-border-radius: 10px 10px 0 0;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
	font: normal 30px 'Bitter', serif;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	border: 1px solid #257C9E;
}

.form-style-10 h1>span {
	display: block;
	margin-top: 2px;
	font: 13px Arial, Helvetica, sans-serif;
}

.form-style-10 label {
	display: block;
	font: 13px Arial, Helvetica, sans-serif;
	color: #888;
	margin-bottom: 15px;
}

.form-style-10 input[type="text"], .form-style-10 input[type="date"],
	.form-style-10 input[type="datetime"], .form-style-10 input[type="email"],
	.form-style-10 input[type="number"], .form-style-10 input[type="search"],
	.form-style-10 input[type="time"], .form-style-10 input[type="url"],
	.form-style-10 input[type="password"], .form-style-10 textarea,
	.form-style-10 select {
	display: block;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	width: 100%;
	padding: 8px;
	border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border: 2px solid #fff;
	box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
	-moz-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
	-webkit-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
}

.form-style-10 .section {
	font: normal 20px 'Bitter', serif;
	color: #2A88AD;
	margin-bottom: 5px;
}

.form-style-10 .section span {
	background: #2A88AD;
	padding: 5px 10px 5px 10px;
	position: absolute;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border: 4px solid #fff;
	font-size: 14px;
	margin-left: -45px;
	color: #fff;
	margin-top: -3px;
}

.form-style-10 input[type="button"], .form-style-10 input[type="submit"]
	{
	background: #2A88AD;
	padding: 8px 20px 8px 20px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
	font: normal 30px 'Bitter', serif;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	border: 1px solid #257C9E;
	font-size: 15px;
}

.form-style-10 input[type="button"]:hover, .form-style-10 input[type="submit"]:hover
	{
	background: #2A6881;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
}

.form-style-10 .privacy-policy {
	float: right;
	width: 250px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #4D4D4D;
	margin-top: 10px;
	text-align: right;
}
</style>

</head>
<body>

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
									<div style="float:left"><p style="color:Black"><font size="3">您好，${visitName}</font></p></div>

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
								<a href="/ExamSystem/index.jsp" >
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
				<li class="menu_mm"><a href="/ExamSystem/index.jsp">Home</a></li>
				<li class="menu_mm"><a href="#">Appointment</a></li>
				<li class="menu_mm"><a href="#">Exam</a></li>
				<li class="menu_mm"><a href="#">Leave</a></li>
				<li class="menu_mm"><a href="#">Mail</a></li>
				<li class="menu_mm"><a href="#">Manage</a></li>
				<li class="menu_mm"><a href="contact.html">Contact</a></li>
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
								<li>Home</li>
								<li>Contact us</li>
								<!-- 這邊記得修改當前所在位置 -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>			
	</div>
<!----------------------顯示示內容開始----------------------------->
		<!----------------------顯示示內容開始----------------------------->

		<!-- 以下自己設計 -->

  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Contact info.</a></li>
    <li><a href="#tabs-2" >Send to us.</a></li>
  </ul>
  <div id="tabs-1" name="tabs-1">
  
  	<div class="container">
  		 <div class="row">
  			<div class="col-sm" >

				<h1 style="text-decoration:underline">Contact us</h1><br>
				<h3><i class="fas fa-phone fa-lg" style="color:#428BE9"></i>&nbsp;&nbsp;Phone : (02)6631-6666</h3><br>
				<h3><i class="fas fa-map-marked-alt fa-lg" style="color:#428BE9"></i>&nbsp;&nbsp;Address : 2F., No.390, Sec. 1, Fuxing S. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rd.,
				        Da’an Dist., Taipei City 106, Taiwan &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(R.O.C.)</h3><br>
				<h3><i class="fas fa-envelope fa-lg" style="color:#428BE9"></i>&nbsp;&nbsp;Email: EEIT10102@gmail.com</h3>
				
			</div>
			<div class="col-sm">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3857.9960157760725!2d121.54133803108343!3d25.025057890032397!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6c7f37e71cce4568!2z6LOH562W5pyD!5e0!3m2!1szh-TW!2stw!4v1531992594569"
					width="600" height="450" frameborder="0" style="border: 0"
					allowfullscreen></iframe>
			</div>
		</div>
	</div>
  
  </div>
  <div id="tabs-2" name="tabs-2">
  <div class="form-style-10" style="width:1000px">
			<h1>
				Contact us!<span>Thank you for your visiting!</span>
			</h1>
			<form method="GET" action="sendEmailToContactUs" id="formSendEmailToUs">
				<div class="section">
					<span>1</span>Name &amp; Email
				</div>
				
						<script>
						  (function($){
						    $(function() {
						      $("#userEmail").emailautocomplete({
						        domains: ["example.com"] //add your own domains
						      });
						    });
						  }(jQuery));
						</script>
				
				
				<div class="inner-wrap">
					<label>Name <input type="text" name="userName" required/></label> <label>Email<input type="text"
							name="userEmail" id="userEmail" required="required"></input></label>
				</div>

				<div class="section">
					<span>2</span>Email &amp; Phone
				</div>
				<div class="inner-wrap">
					<label>title<input type="text" name="contactUsViaEmailTitle" required/></label> <label>Content
						<textarea name="contactUsViaEmailContent" id="contactUsViaEmailContent"
							rows="10" cols="80">
                
            			</textarea>
            		<script>
<!-- // 						// Replace the <textarea id="editor1"> with a CKEditor -->
<!-- // 						// instance, using default configuration. -->
							CKEDITOR.replace('contactUsViaEmailContent');
					</script> 
					</label>
				</div>

				<div class="button-section">
				
					<script>
						$('#sendEmail').click(function(){
							alert("感謝您聯絡!");
							$('#formSendEmailToUs').submit();
						})
					</script>
					<input type="submit" name="sendEmail" value="Send" id="sendEmail"/>
				</div>
			</form>
		</div>
  
  </div>
</div>









		<script>
			//Google Map API
			// 	var map;
			// 	function initMap() {
			// 	  map = new google.maps.Map(document.getElementById('map'), {
			// 	    center: {lat: 25.024885, lng: 121.542040},
			// 	    zoom: 19
			// 	  });
			// 	}
		</script>
		<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQY9TXtIPWDRq_5j0ro66vg5fFC5P-f2s&callback=initMap" async defer></script> -->

		<!-- <div id="map" style="width:400px;height:400px;background:yellow"></div> -->



		






		<!----------------------顯示示內容結束----------------------------->
		<!-------------------------------Footer開始----------------------------------------->

	<footer class="footer">
		<div class="footer_background" style="background-image:url(images/footer_background.png)"></div>
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
											<div class="footer_logo_text">Exam<span>System</span></div>
										</a>
									</div>
									<div class="footer_about_text">
										<p>Only You.Official social pipeline.</p>
										
									</div>
									<div class="footer_social">
										<ul>
											<li><a href="http://taipei.iiiedu.org.tw/"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
											<li><a href="http://taipei.iiiedu.org.tw/"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
											<li><a href="http://taipei.iiiedu.org.tw/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
											<li><a href="http://taipei.iiiedu.org.tw/"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
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
											<li>Phone:  (02)6631-6666</li>
											<li>2F., No.390, Sec. 1, Fuxing S. Rd., Da’an Dist., Taipei City 106, Taiwan (R.O.C.)</li>
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
											<li><a href="/ExamSystem/index.jsp">Home</a></li>
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
										<div class="footer_image"><a href="#"><img src="images/QRCode.png" alt=""></a></div>
									</div>
								</div>
								
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="row copyright_row">
				<div class="col">
					<div class="copyright d-flex flex-lg-row flex-column align-items-center justify-content-start">
						<div class="cr_text"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
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
	

	<!-- 以上自記設計 -->
	<!-- Footer -->

	<!-- 以下保留，可再增加自己的資源 -->
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
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