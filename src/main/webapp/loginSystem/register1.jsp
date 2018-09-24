<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--判斷登入者身分的程式碼(aaa)-->
<%
	session = request.getSession(false);
	if (session.getAttribute("LoginOK") != null) {
		if ((String.valueOf(session.getAttribute("WhichIdentity"))).equals(String.valueOf(2)) == true) {
%>
<c:set var="visitName" value="${LoginOK.studentName}" scope="session" />
<%
	}
	}
	if (session.getAttribute("LoginOK") != null) {
		if ((String.valueOf(session.getAttribute("WhichIdentity"))).equals(String.valueOf(1)) == true) {
%>
<c:set var="visitName" value="${LoginOK.employeeName}" scope="session" />
<%
	}
	}
	if (session.getAttribute("LoginOK") != null) {
		if ((String.valueOf(session.getAttribute("WhichIdentity"))).equals(String.valueOf(0)) == true) {
%>
<c:set var="visitName" value="${LoginOK.employeeName}" scope="session" />
<%
	}
	} else {
%>
<c:set var="visitName" value="訪客" scope="session" />
<%
	}
%>
<!--判斷登入者身分的程式碼-->


<title>ExamSystem</title>
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
<link rel="stylesheet"
	href='<c:url value="css/jquery-ui-1.10.4.custom.css"/>'>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="css/EEIT10127_AccessibleMegaMenu.css">


<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<!-- 以上保留，下面放自己的資源 -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-accessibleMegaMenu.js"></script>


<script>
	
</script>

<style>
table {
	border: 2px solid blue;
	border-collapse: collapse;
}

td {
	border: 1px solid blue
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
								    <div style="float:left"><p>　　</p></div>								    
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
								<a href="/ExamSystem/index" >
									<div  class="logo_text" >Exam<span>System</span></div>
								</a>
							</div>
							
							
<!-- 選單 選單 選單 選單 選單(qwe)-->					
<!-- 		<nav class="main_nav_contaner ml-auto ml-auto"> -->
		
		
<!--         <ul class="nav-menu" > -->
        
<!--             <li class="nav-item"> -->
<!--                 <a  href="/ExamSystem/index">首頁</a> -->
<!--             </li> -->
            
            
<!--             <li class="nav-item"> -->
<!--                 <a  href="#">預約考試</a> -->
<!--                 <div class="sub-nav"> -->
<!--                     <ul class="sub-nav-group"> -->
<!--                         <li><a href="?movie&genre=0">AppointmentA</a></li> -->
<!--                         <li><a href="?movie&genre=2">Children &amp; Family</a></li> -->
<!--                         <li>&#8230;</li> -->
<!--                     </ul> -->
<!--                     <ul class="sub-nav-group"> -->
<!--                         <li><a href="?movie&genre=7">AppointmentB</a></li> -->
<!--                         <li><a href="?movie&genre=9">Foreign</a></li> -->
<!--                         <li>&#8230;</li> -->
<!--                     </ul> -->
<!--                     <ul class="sub-nav-group"> -->
<!--                         <li><a href="?movie&genre=14">AppointmentC</a></li> -->
<!--                         <li><a href="?movie&genre=15">Romance</a></li> -->
<!--                         <li>&#8230;</li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--             </li> -->
            
            
<!--             <li class="nav-item"> -->
<!--                 <a href="ExamSystem/AllExam">維護考生個人資料</a> -->
<!--                 <div class="sub-nav"> -->
<!--                     <ul class="sub-nav-group"> -->
<!--                         <li><a href="ExamManage"></a></li> -->
<!--                    </ul> -->
<!--                 </div> -->
<!--             </li> -->
            
<!--             </ul> -->
<!--                 </div> -->
<!--             </li> -->
            
     
        
        
<!--     </nav> -->
<!-- 選單 選單 選單 選單 選單(qwe)-->
    
    
    
<!-- 								<nav class="main_nav_contaner ml-auto"> -->
<!------------------------------搜尋按鈕------------------------ --> 
<!--  								<div class="search_button"><i class="fa fa-search" aria-hidden="true"></i></div>  -->
<!------------------------------購物車按鈕------------------------ -->
<!-- 								<div class="shopping_cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div>  -->
								
                           <!-- Hamburger -->

<!-- 							<div class="shopping_cart"> -->
<!-- 								<i class="fa fa-shopping-cart" aria-hidden="true"></i> -->
<!-- 							</div> -->
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
						<div
							class="header_search_content d-flex flex-row align-items-center justify-content-end">
							<form action="#" class="header_search_form">
								<input type="search" class="search_input" placeholder="Search"
									required="required">
								<button
									class="header_search_button d-flex flex-column align-items-center justify-content-center">
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
									<li><a href="/ExamSystem/index">Home</a></li>
									<li>請註冊</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- About -->
		<!-- About -->		
		

		<!----------------------顯示示內容開始----------------------------->
		<div align="center">
		
		
			<H1 style="text-align: center">
				<strong>考試系統註冊頁</strong>
			</H1>
			
			<!--  註冊的表單 -->
			<form:form method="POST" modelAttribute="studentBean" enctype= "multipart/form-data"><!-- action="updateExam"-->
			
			
				<fieldset>
					<legend style="text-align: center">新增考試資料</legend>



					<div style="width: 300px; height: 598px; border: 3px; text-align: left">
					
					    <!--  傳值modelAttribute="studentBean"的path="studentName"-->
						<div>      
							<label for='studentName'>姓名</label>
							<div>
								<form:input id="studentName" path="studentName" type='text' required="required"/>
							</div>
						</div>

                        <!--  傳值modelAttribute="studentBean"的path="gender"-->
						<div>
							<label for="gender"> 性別 </label>
							<div>
								<form:radiobutton path="gender" value="男" required="required"/>
								男
								<form:radiobutton path="gender" value="女" required="required"/>
								女
							</div>
						</div>


						<div>
							<label for='address'> 地址 </label>
							<div>
								<form:input id="address" path="address" type="text" required="required"/>
							</div>
						</div>


						<div>
							<label for='phone'> 電話 </label>
							<div>
								<form:input id="phone" path="phone" type="text" required="required"/>
							</div>
						</div>


						<div>
							<label for='email'> email </label>
							<div>
								<form:input id="email" path="email" type="text" value="@gmail.com" required="required"/>
							</div>
						</div>


 						<div> 
 							<label for="birthday"> 生日 </label> 
							<div>
 								<form:input id="birthday" path="birthday" type="date" required="required"/>
							</div> 
 						</div> 


						<div>
							<label for="education"> 學歷 </label>
							<div>
								<form:input id="education" path="education" type="text" required="required"/>
							</div>
						</div>


 						<div> 
 							<label for="photo"> 照片檔 </label>
 							<div> 
 								<form:input type="file" id="photo" path="studentImage" /> 
 							</div> 
 						</div> 


						<BR>


						<div>
							<input id="btnAdd" type="submit" value="送出" />
						</div>
						
						
					</div>
					
					
				</fieldset>
			</form:form>


		</div>
		<!----------------------顯示示內容結束----------------------------->







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

								<!-- Footer About -->
								<div class="footer_section footer_about">
									<div class="footer_logo_container">
										<a href="#">
											<div class="footer_logo_text">
												Unic<span>at</span>
											</div>
										</a>
									</div>
									<div class="footer_about_text">
										<p>Lorem ipsum dolor sit ametium, consectetur adipiscing
											elit.</p>
									</div>
									<div class="footer_social">
										<ul>
											<li><a href="#"><i class="fa fa-facebook"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-google-plus"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-instagram"
													aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter"
													aria-hidden="true"></i></a></li>
										</ul>
									</div>
								</div>

							</div>

							<div class="col-lg-3 footer_col">

								<!-- Footer Contact -->
								<div class="footer_section footer_contact">
									<div class="footer_title">Contact Us</div>
									<div class="footer_contact_info">
										<ul>
											<li>Email: Info.deercreative@gmail.com</li>
											<li>Phone: +(88) 111 555 666</li>
											<li>40 Baria Sreet 133/2 New York City, United States</li>
										</ul>
									</div>
								</div>

							</div>

							<div class="col-lg-3 footer_col">

								<!-- Footer links -->
								<div class="footer_section footer_links">
									<div class="footer_title">Contact Us</div>
									<div class="footer_links_container">
										<ul>
											<li><a href="index.html">Home</a></li>
											<li><a href="about.html">About</a></li>
											<li><a href="contact.html">Contact</a></li>
											<li><a href="#">Features</a></li>
											<li><a href="courses.html">Courses</a></li>
											<li><a href="#">Events</a></li>
											<li><a href="#">Gallery</a></li>
											<li><a href="#">FAQs</a></li>
										</ul>
									</div>
								</div>

							</div>

							<div class="col-lg-3 footer_col clearfix">

								<!-- Footer links -->
								<div class="footer_section footer_mobile">
									<div class="footer_title">Mobile</div>
									<div class="footer_mobile_content">
										<div class="footer_image">
											<a href="#"><img src="images/mobile_1.png" alt=""></a>
										</div>
										<div class="footer_image">
											<a href="#"><img src="images/mobile_2.png" alt=""></a>
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

	<!-- <script src="js/jquery-3.2.1.min.js"></script> -->
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

</body>
</html>