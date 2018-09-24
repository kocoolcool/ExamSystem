<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Only You Exam System</title>
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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="css/EEIT10127_AccessibleMegaMenu.css">  
<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">  
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="js/jquery-accessibleMegaMenu.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>

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
<!------------------------這邊填上登入頁面Google Login------------- -->
								<div class="top_bar_login ml-auto">
									<div class="login_button"><a href="/ExamSystem/selectStudents">Register or Login</a></div>
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
								
		<nav class="main_nav_contaner ml-auto ml-auto">
        <ul class="nav-menu" >
            <li class="nav-item">
                <a  href="/ExamSystem/index.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a  href="#">Appointment</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="?movie&genre=0">AppointmentA</a></li>
                        <li><a href="?movie&genre=2">Children &amp; Family</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?movie&genre=7">AppointmentB</a></li>
                        <li><a href="?movie&genre=9">Foreign</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?movie&genre=14">AppointmentC</a></li>
                        <li><a href="?movie&genre=15">Romance</a></li>
                        <li>&#8230;</li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a href="ExamSystem/AllExam">Exam</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="AllExam">Exam List</a></li>
                        <li><a href="?tv&genre=21">FullCalendar</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=27">Reality TV</a></li>
                        <li><a href="?tv&genre=30">TV Action</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=33">TV Dramas</a></li>
                        <li><a href="?tv&genre=34">TV Horror</a></li>
                        <li>&#8230;</li>
                    </ul>
                </div>
            </li>
              <li class="nav-item">
                <a href="ExamSystem/AllExam">Leave</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="AllExam">A</a></li>
                        <li><a href="?tv&genre=21">B</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=27">C</a></li>
                        <li><a href="?tv&genre=30">D</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=33">E</a></li>
                        <li><a href="?tv&genre=34">F</a></li>
                        <li>&#8230;</li>
                    </ul>
                </div>
            </li>
             </li>
              <li class="nav-item">
                <a href="ExamSystem/AllExam">Mail</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="AllExam">A</a></li>
                        <li><a href="?tv&genre=21">B</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=27">C</a></li>
                        <li><a href="?tv&genre=30">D</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=33">E</a></li>
                        <li><a href="?tv&genre=34">F</a></li>
                        <li>&#8230;</li>
                    </ul>
                </div>
            </li>
             </li>
              <li class="nav-item">
                <a href="ExamSystem/AllExam">Manage</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="AllExam">A</a></li>
                        <li><a href="?tv&genre=21">B</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=27">C</a></li>
                        <li><a href="?tv&genre=30">D</a></li>
                        <li>&#8230;</li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="?tv&genre=33">E</a></li>
                        <li><a href="?tv&genre=34">F</a></li>
                        <li>&#8230;</li>
                    </ul>
                </div>
            </li>
               <li class="nav-item">
                <a href="ExamSystem/AllExam">Contact</a>
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
								<li><a href="/ExamSystem/index.jsp">Home</a></li>
								<li>Exam</li>
								<!-- 這邊記得修改當前所在位置 -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>			
	</div>
<!----------------------顯示內容開始----------------------------->
<!-- About -->	
	<div style="width: 95%; margin: 0 auto;">
	<h1>Exam Detail</h1>
		<br>
		<br>
		<br>
		<table id="dataTableTest" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th width="12%">照片</th>
					<th width="12%">姓名</th>
					<th width="12%">性別</th>
					<th width="12%">班級</th>
					<th width="12%">申請時間</th>
<!-- 					<th width="12%"></th> -->
<!-- 					<th width="12%"></th> -->
				</tr>
			</thead>
			<tbody>		
					<c:forEach var="exam" items="${examMap}" varStatus="vsOuter">
					<tr>
						<td ><img width="70px" src="data:image/jpg;base64, ${exam.photo}"></td>
						<td ><c:out value="${exam.name}" /></td>
						<td><c:out value="${exam.gendar}" /></td>
						<td><c:out value="${exam.studentClass}" /></td>
						<td><c:out value="${fn:substring(exam.date,0,10)}" /></td>
<%-- 						<td><a href="<spring:url value='ExamDetail.xml?ExamId=${exam.examId}'/>">XML</a> </td> --%>
<%-- 						<td><a href="<spring:url value='ExamDetail.json?ExamId=${exam.examId}'/>">JSON</a> </td> --%>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		<a href="<spring:url value='/ExamManage/AllExam'/>">Back
	<i class="far fa-hand-point-left" aria-hidden="true"></i>
	</a>
	</div>
	
	
<!-------------------------------顯示內容結束---------------------------------------->



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
<!-------------------------------網頁樣板所使用的js檔開始----------------------------------->

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
<!-------------------------------網頁樣板所使用的js檔結束----------------------------------->
</body>
</html>