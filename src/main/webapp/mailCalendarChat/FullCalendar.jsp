<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!--   <link rel="stylesheet" href="css/style.css"> -->
<!--   <script src="js/jquery-1.12.1.js"></script> -->
<!--   <script src="js/jquery-ui.min.js"></script> -->



<link href='css/fullcalendar.min.css' rel='stylesheet' type="text/css">
<link href='css/fullcalendar.print.min.css' rel='stylesheet'
	media='print' type="text/css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script src='js/jquery.min.js'></script> -->
<script src="js/jquery-3.3.1.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src='js/moment.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script type='text/javascript' src='js/gcal.min.js'></script>


<script>
	$(document).ready(function() {

		//拖曳事件
		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title : $.trim($(this).text()), // use the element's text as the event title
				stick : true
			// maintain when user navigates (see docs on the renderEvent method)
			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag
			});

		});
		
		//周末換背景顏色
// 		$('#calendar > tbody > tr > td:nth-child(-n+2)').addClass('fc-weekend');
// 		console.log( "== "+ $('#calendar > tbody > tr > td:nth-child(-n+2)'))

		//所有請假的資料
		var allLeaveDataJSON = JSON.parse('${allLeaveData}');

		//所有事件的資料(用concat合併陣列)
		$('#calendar').fullCalendar({

			header: {
		            left: 'prev,next today',
		            center: 'title' ,
		            right: 'month,agendaWeek,agendaDay'
		          },
        	buttonText: {
        		today:    '今日',
        		  month:   '月',
        		  week:    '週',
        		  day:     '日',
        		  list:    'list'
        	},
        	
			editable : true,
			droppable : true,
			eventLimit : true, // allow "more" link when too many events
			weekends : true,
			selectable : true,
			businessHours : false,
			nowIndicator :true,
			googleCalendarApiKey: 'AIzaSyCs4qXVRLXwyCehqrNreodpgHHATlFgz0A',
			
			
			eventSources : [ 

			{
				googleCalendarId: 'zh.taiwan#holiday@group.v.calendar.google.com',
				editable : false,
// 				url: 'http://www.319papago.idv.tw/holiday/2018-hr/2018_HR.html',
				startEditable: false,
				durationEditable: false,
				resourceEditable: false,
				overlap: false,
				color: 'red',
				
				
			},{
				events : allLeaveDataJSON,
// 				constraint : 'businessHours',
			},{
				googleCalendarId: 'eeit10102@gmail.com',
				editable : false,
				startEditable: false,
				durationEditable: false,
				resourceEditable: false,
				overlap: false,
			}
			],
			
			businessHours: {
				 // days of week. an array of zero-based day of week integers (0=Sunday)
				  dow: [ 0,6 ], // Monday - Thursday
				  start: '00:00', // a start time (10am in this example)
				  end: '23:59', // an end time (6pm in this example)
				},
				
			drop : function(date, jsEvent, ui, resourceId) {
				console.log("DROP : " + date);
			},
			
			eventDragStop : function(event, jsEvent, ui, view) {

			},
			
			eventDrop : function(event, delta, revertFunc, jsEvent, ui, view) {
				
				if(event.eventId > 0){
					var startString = event.start.format().toString();
					var endString = event.end.format().toString();
					
					$.get("updateLeaveBean", {
						"eventId" : event.eventId,
						"startDate" : startString,
						"endDate" : endString,
						"reason" : event.reason
					}, function(data) {

					})
				}
		
			},
			
			eventClick : function(event, jsEvent, view) {
				var confirmState = confirm("請問要刪除該筆紀錄嗎?");
				if (confirmState == true) {
					$.get("deleteLeaveBean", {
						"eventId" : event.eventId
					}, function() {
						window.location.reload();
					})
				}
			},
			select : function(start, end, jsEvent, view){
				//讀時間
// 				console.log(start._i)

					//原來end會多算一天。所以扣一天的豪秒再轉成date
					var selectedEndDate=new Date((end-86400000));
					var endDateString = (selectedEndDate.getFullYear() + "-" 
					+ ("0"+(selectedEndDate.getMonth()+1)).slice(-2) + "-" +("0"+(selectedEndDate.getDate())).slice(-2));
					
				$('#setLeaveStartDate').text(start.format());
				$('#setLeaveEndDate').text(endDateString); //原來end會多算一天。所以扣一天的豪秒再轉成date
				
// 				$.get("getAgentName",{"setLeaveStartDate":start.format().toString(), "setLeaveEndDate":endDateString},function(data){
// 					console.log("return DATA : " + data)
// 				})
				
				$('#settingLeave').modal('toggle');
		
			}

		});

	});
	
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

#wrap {
	width: 1100px;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 300px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

.fc-weekend { 
	color:#337ab7;  
	border-color: black;  
	background-color: #ffa58c; 
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
										<div>001-1234-88888</div></li>
									<li><i class="fa fa-envelope-o" aria-hidden="true"></i>
										<div>info.deercreative@gmail.com</div></li>
								</ul>
								<div class="top_bar_login ml-auto">
									<div class="login_button">
										<a href="#">Register or Login</a>
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
						<div
							class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container">
								<a href="index.jsp">
									<div class="logo_text">
										Exam<span>System</span>
									</div>
								</a>
							</div>
							<nav class="main_nav_contaner ml-auto">
							<ul class="main_nav">
								<li><a href="index.html">Home</a></li>
								<li><a href="about.html">About</a></li>
								<li><a href="courses.html">Courses</a></li>
								<li><a href="blog.html">Blog</a></li>
								<li><a href="#">Page</a></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
							<div class="search_button">
								<i class="fa fa-search" aria-hidden="true"></i>
							</div>

							<!-- Hamburger -->

							<div class="shopping_cart">
								<i class="fa fa-shopping-cart" aria-hidden="true"></i>
							</div>
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
				<li class="menu_mm"><a href="index.html">Home</a></li>
				<li class="menu_mm"><a href="#">About</a></li>
				<li class="menu_mm"><a href="#">Courses</a></li>
				<li class="menu_mm"><a href="#">Blog</a></li>
				<li class="menu_mm"><a href="#">Page</a></li>
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
									<li><a href="index.html">Home</a></li>
									<li>About</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- About -->











		<script>
			$(function() {
				$("#datepickerStart").datepicker();
				$("#datepickerStart").datepicker("option", "dateFormat",
						'yy-mm-dd');

				$("#datepickerEnd").datepicker();
				$("#datepickerEnd").datepicker("option", "dateFormat",
						'yy-mm-dd');

			});
		</script>



		<hr>
		<div id='wrap' >
			<div id='external-events'>
				<h4>Draggable Events</h4>

				<form>
					<p>
						請假開始日期: <input type="text" id="datepickerStart"> <select
							id="leaveTimeStart">
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
						</select>

					</p>



					<p>
						請假結束日期: <input type="text" id="datepickerEnd"> <select
							id="leaveTimeEnd">
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00" selected>18:00</option>
						</select>
					</p>
					<p>
						假別 : 
						<select id="leaveType">
							<option value="事假">事假</option>
							<option value="病假">病假</option>
							<option value="特休">特休</option>
						</select> 
						代理人: 
						<select id="agentName">
							<option value="錢夫人">錢夫人</option>
						</select>
					</p>

				</form>

				<div class='fc-event'>請假</div>
				<div class='fc-event'>安排考試</div>

			</div>
			<br>
			<div style='clear: both'></div>

			<!-- 		日曆本體 -->
			<div id='calendar'></div>

			<div style='clear: both'></div>
		</div>




<!-- 用來設定請假細節 -->
<div class="modal fade" id="settingLeave" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">設定請假</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		<form>
					<div>請假開始日期 :&nbsp; <span id="setLeaveStartDate"></span></div>
				
					<div>請假結束日期 :&nbsp; <span id="setLeaveEndDate"></span></div>
					
					

					<div>
						開始時間: 
						<select id="setLeaveTimeStartInModal">
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
						</select>
					</div>
					<div>
						結束時間:  
						<select id="setLeaveTimeStartInEnd">
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00" selected>18:00</option>
						</select>
					</div>

					<div>
						假別 : 
						<select id="leaveType">
							<option value="事假">事假</option>
							<option value="病假">病假</option>
							<option value="特休">特休</option>
						</select> 
						代理人: 
						<select id="agentName">
							
						</select>
					</div>

				</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary">確定</button>
      </div>
    </div>
  </div>
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