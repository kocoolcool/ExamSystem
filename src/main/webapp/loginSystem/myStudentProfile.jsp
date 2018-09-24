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


<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<!-- 以上保留，下面放自己的資源 -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-accessibleMegaMenu.js"></script>
<link rel="stylesheet" href="/css/bootstrap-theme.min.css"><!--使用bootstrap 掛載css的樣式-->

<script src="https://code.jquery.com/jquery.js"></script><!--使用bootstrap 掛載JS的樣式-->


<script>
	
</script>

<style>
                               <!-- 放新css 一個bootstray的實驗範例-->
@import url(//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css);
@import url(https://fonts.googleapis.com/css?family=Nothing+You+Could+Do);
.container {
  margin-top: 2rem;
}

.row > div {
  display: flex;
}

.card {
  margin-bottom: 30px;
  width: 100%;
  text-align: center;
}

.s1 .card {
  border-color: #32c5d2;
  margin-top: 3rem;
  border-radius: 0;
}

.s1 .card-icon {
  margin-top: -2rem;
}

.s1 .card-icon .fa {
  font-size: 2rem;
  height: 4rem;
  width: 4rem;
  line-height: 4rem;
  color: #fff;
  background: #32c5d2;
  border-radius: 50%;
}

.s2 .card {
  border: 0;
}

.s2 .card-icon {
  font-size: 3rem;
  color: #32c5d2;
}

.s2 .card-title:after {
  display: block;
  margin: 1rem auto;
  width: 3rem;
  height: 1px;
  background: #bbb;
  content: " ";
}

.s2 {
  margin: 0 calc(50% - 50vw) 2rem;
  padding: 2rem calc(50vw - 50%) 0;
  background: #eee;
}

.s3 .card {
  background: #32c5d2;
  color: #fff;
}

.s3 .card-icon {
  font-size: 3rem;
  margin-top: 1rem;
}

.s4 .card {
  border-radius: 0;
}

.s4 .card-img-top {
  width: 100%;
  height: 10rem;
  object-fit: cover;
}

.s5 .card {
  border: 0;
}

.s5 .card-img-top {
  margin: 0 auto;
  width: 10rem;
  height: 10rem;
  border-radius: 50%;
  object-fit: cover;
}

.s6 .card {
  border: 0;
  text-align: left;
}

.s6 .card-icon {
  position: absolute;
  left: 0;
  top: 1.25rem;
  font-size: 1.5rem;
  height: 3rem;
  width: 3rem;
  line-height: 3rem;
  color: #fff;
  background: #32c5d2;
  border-radius: 50%;
  text-align: center;
}

.s6 .card-block {
  padding-left: 5rem;
}

.s7 {
  font-family: 'Nothing You Could Do', cursive;
}

.s7 .card {
  border: solid 5px #666;
  border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
  padding: 1em 2em;
}

.s7 .card-icon {
  background: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20width%3D%22100%25%22%20height%3D%22100%25%22%20viewBox%3D%220%200%2020%2020%22%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20xml%3Aspace%3D%22preserve%22%20style%3D%22fill-rule%3A%20evenodd%3B%20clip-rule%3A%20evenodd%3B%20stroke-linejoin%3A%20round%3B%20stroke-miterlimit%3A%201.41421%3B%20#%22%20fill%3D%22#%22%3E%3Cpath%20d%3D%22M16.794%2C4.5c-7.546%2C-14.034%20-22.642%2C10.473%20-13.241%2C14.22c7.332%2C2.921%2018.308%2C-3.713%2015.372%2C-12.497c-2.83%2C-8.471%20-18.037%2C-6.816%20-18.67%2C2.264c-0.703%2C10.082%2012.738%2C14.476%2019.496%2C8.778c0.065%2C-0.054%20-0.021%2C-0.17%20-0.089%2C-0.12c-5.46%2C4.12%20-14.011%2C2.67%20-17.765%2C-3.207c-3.347%2C-5.239%200.039%2C-10.82%205.296%2C-12.396c5.422%2C-1.626%2011.487%2C1.178%2011.896%2C7.418c0.396%2C6.029%20-5.41%2C8.837%20-10.222%2C9.727c-3.077%2C0.57%20-6.818%2C0.125%20-7.744%2C-3.482c-0.701%2C-2.732%200.536%2C-5.856%201.811%2C-8.19c3.152%2C-5.772%209.616%2C-9.228%2013.753%2C-2.45c0.042%2C0.071%200.147%2C0.008%200.107%2C-0.065Z%22%20style%3D%22fill%3A%20#%3B%20fill-rule%3A%20nonzero%3B%22%2F%3E%3C%2Fsvg%3E") no-repeat center;
  height: 3.5rem;
}
                               <!-- 放新css 一個bootstray的實驗範例 -->





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

		<header class="header"> <!-- Top Bar -->
		<div class="top_bar">
			<div class="top_bar_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div
								class="top_bar_content d-flex flex-row align-items-center justify-content-start">
								<ul class="top_bar_contact_list">
									<li><div class="question">Have any questions?</div></li>
									<li><i class="fa fa-phone" aria-hidden="true"></i>
										<div>(02)6631-6666</div></li>
									<li><i class="fa fa-envelope-o" aria-hidden="true"></i>
										<div>EEIT10102@gmail.com</div></li>
								</ul>
								<!------------------------這邊填上登入頁面Google Login(asd)------------- -->
								<div class="top_bar_login ml-auto">
									<div style="float: left">
										<p></p>
									</div>
									<div style="float: left">
										<p></p>
									</div>
									<div style="float: left">
										<p style="color: Black">
											<font size="3">您好，${visitName}</font>
										</p>
									</div>

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


    <div style="height:35px; width:500px; position:absolute; top:30%; left:99%; margin:0px 0 0 517px; border:3px">
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
    </div>	
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

		<div
			class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
			<div class="menu_close_container">
				<div class="menu_close">
					<div></div>
					<div></div>
				</div>
			</div>
			<div class="search">
				<form action="#" class="header_search_form menu_mm">
					<input type="search" class="search_input menu_mm"
						placeholder="Search" required="required">
					<button
						class="header_search_button d-flex flex-column align-items-center justify-content-center menu_mm">
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
									<li><a href="index_Student.jsp">到首頁</a></li>
									<li>顯示考生個人資料</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- About -->


		<!----------------------顯示示內容開始----------------------------->
		<div align="center">


			<!--  調整距離用的div -->
			<div style="height: 15px; border: 3px; text-align: left"></div>
			<!--  調整距離用的div -->

<!--                一個bootstray的實驗範例 -->
<!-- 				<div class='container'> -->
<!-- 					<div class='row s7'> -->
<!-- 						<div class='col-md-6 col-lg-3'> -->
<!-- 							<div class='card'> -->
<!-- 								<div class='card-icon'></div> -->
<!-- 								<div class='card-block'> -->
<!-- 									<h3 class='card-title'>22222</h3> -->
<!-- 									<p class='card-text'>Morbi viverra non ante sit amet -->
<!-- 										consequat. Nam tempus elit et iaculis lobortis.</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
			<H1 style="text-align: center">
				<strong>顯示考生個人資料</strong>

				<!--  調整距離用的div -->
				<div style="height: 30px; border: 3px; text-align: left">
					<!--  調整距離用的div -->

				</div>
			</H1>

			<!--  顯示學生個人資料的表單 -->

			<div
				style="width: 300px; height: 590px; border: 3px; text-align: left">
						
						
						
						<div>
							<label for='studentId' style="float: left">學生的ID</label> <br>

							<div style="float: right">
								<img style="float: right; width: 175px;" alt=""
									src="<c:url value='/getPicture/${myStudentBean.studentId}' />">
							</div>

							<br>

							<div style="float: left">
								<p>${myStudentBean.studentId}</p>
							</div>

						</div>


						<br>


						<div>
							<br> <label for='thisIsClass'>班級</label>
							<div>
								<p>${myStudentBean.thisIsClass}</p>
							</div>
						</div>


						<!--  傳值modelAttribute="studentBean"的path="studentName"-->
						<div>
							<label for='studentName'>姓名</label>
							<div>
								<p>${myStudentBean.studentName}</p>
							</div>
						</div>


						<!--  傳值modelAttribute="studentBean"的path="gender"-->
						<div>
							<label for="gender"> 性別 </label>
							<div>
								<p>${myStudentBean.gender}</p>
							</div>
						</div>


						<div>
							<label for='address'> 地址 </label>
							<div>
								<p>${myStudentBean.address}</p>
							</div>
						</div>





						<div>
							<label for='phone'> 電話 </label>
							<div>
								<p>${myStudentBean.phone}</p>
							</div>
						</div>


						<div>
							<label for='email'> email </label>
							<div>
								<p>${myStudentBean.email}</p>
							</div>
						</div>


						<div>
							<label for="birthday"> 生日 </label>
							<div>
								<p>${myStudentBean.birthday}</p>
							</div>
						</div>


						<div>
							<label for="education"> 學歷 </label>
							<div>
								<p>${myStudentBean.education}</p>
							</div>
						</div>



						<!--  調整距離用的div -->
						<div style="height: 21px; border: 3px; text-align: left"></div>
						<!--  調整距離用的div -->


						<div>
							<a class="btn btn-primary"
								href="maintainStudentProfile?studentId=${myStudentBean.studentId}">修改</a>
							<span> </span> <a class="btn btn-primary"
								href="http://localhost:8080/ExamSystem/index_Student">回首頁</a>
						</div>


					</div>



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