<!-- 主考官月曆 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


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
<title>管理行事曆</title>
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
<link href='css/fullcalendar.min.css' rel='stylesheet' type="text/css">
<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' type="text/css">

<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='js/moment.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script type='text/javascript' src='js/gcal.min.js'></script>



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
	color: #337ab7;
	border-color: black;
	background-color: #ffa58c;
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
								<a href="/ExamSystem/index" >
									<div  class="logo_text" >Exam<span>System</span></div>
								</a>
							</div>

							
<div class="container" style="height:300px; width:300px; position:absolute; top:55%; left:95%; margin:155px 0 0 -5px; border:3px">							
<!-- 主考官選單 選單 選單 選單 選單(qwe)-->									
	<nav class="main_nav_contaner ml-auto ml-auto">
        <ul class="nav-menu" >
            <li class="nav-item">
                <a  href="http://localhost:8080/ExamSystem/index_Exami">首頁</a>
            </li>
            <li class="nav-item">
                <a href="ExamManage/showAllAppBeanWhitchUnconfirm">核可考試</a>
<!--                 <div class="sub-nav"> -->
<!--                     <ul class="sub-nav-group"> -->
<!--                         <li><a href="ExamManage/showAllAppBeanWhitchUnconfirm">核可考試</a></li>Approve Exam -->
<!--                     </ul> -->
<!--                 </div> -->
                
              <li class="nav-item">
                 <a href="FullCalendar">管理行事曆</a></li>
            </li>
            
              <li class="nav-item">
                <a href="ShowEmailTemplates">連絡考生或寄信</a>
            </li>
            <li class="nav-item">
               <a href='<c:url value="../ExamSystem/backManage/ShowBackstudentManage"/>'>管理學生的資料</a>
            </li>	
        </ul>
    </nav>
</div>   
    

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
								<li><a href="http://localhost:8080/ExamSystem/index_Exami">到首頁</a></li>
								<li>FullCalendar</li>
								<!-- 這邊記得修改當前所在位置 -->
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
				
				$("#insertLeaveEndDate").datepicker();
				$("#insertLeaveEndDate").datepicker("option", "dateFormat",
						'yy-mm-dd');
			});
		</script>

		<hr>
		<div id='wrap'>
			<div id='external-events'>
				<h4>請假申請</h4>

				<form>

				</form>

				<div class='fc-event' id="takeALeave">請假</div>
<!-- 				<div class='fc-event' id="takeALeave2">安排考試</div> -->

			</div>
			<br>
			<div style='clear: both'></div>

			<!-- 		日曆本體 -->
			<div id='calendar'></div>

			<div style='clear: both'></div>
		</div>
		
<!-- 			insert請假表單 -->		
<div class="modal fade" id="insertLeave" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="insertLeaveForm">請假申請</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div>
								請假開始日期 :&nbsp; <span id="insertLeaveStartDate"></span>
								<select id="insertLeaveTime">
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
						</select>
								
							</div>
<p>
						請假結束日期: <input type="text" id="insertLeaveEndDate"> <select
							id="insertLeaveEndTime">
							<option value="24:00">請選擇</option>
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00" selected>18:00</option>
						</select>
					</p>
							<div>
								假別 : <select id="insertleaveType">
									<option value="事假">事假</option>
									<option value="病假">病假</option>
									<option value="特休">特休</option>
								</select> 代理人: <select id="insertAgentName">

								</select>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" id="reload">關閉</button>
						<button type="button" class="btn btn-primary" id="insertLeaveEvent">確定</button>
					</div>
				</div>
			</div>
		</div>

<script>
	$(document).ready(function() {

		$('#reload').click(function(){
			
			window.location.reload();
		})
		
		//拖曳事件
		$('#takeALeave').each(function() {

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
        
        //insertLeaveEvent
        $('#insertLeaveEvent').click(function(){
			var s = $('#insertLeaveStartDate').text()+" "+$('#insertLeaveTime').val()+":00"
			var e = $('#insertLeaveEndDate').val()+" "+$('#insertLeaveEndTime').val()+":00"
			var r = $('#insertleaveType').find(":selected").text();
			var a = $('#insertAgentName').find(":selected").text();
			console.log(r+"----"+a)
        	
			$.post("createLeaveBean",{"Start":s,"End":e,"Agent":a,"Reason":r},function(){
				window.location.reload();
				console.log("success??")
			})
        })
        
        //觸發符合條件代理人
        $('#insertLeaveEndDate').change(function(){
        	
			var s = $('#insertLeaveStartDate').text()+" "+$('#insertLeaveTime').val()+":00"
			var e = $('#insertLeaveEndDate').val()+" "+$('#insertLeaveEndTime').val()+":00"

			$.getJSON("getAgentName",{"LeaveStartDate":s, "LeaveEndDate":e},function(data){
		    
// 			array=data.substr(1).slice(0,-1).trim().split(",");
			console.log(data)
		    console.log(typeof(data))
			$('#insertAgentName>option').remove();				
			$.each(data,function(index, value){
				console.log(index+"----"+value.employeeId+"----"+value.agentName)
				
				$('#insertAgentName').append("<option value="+value.employeeId+">"+value.agentName+"</option>")
			})
			
			})
        })
        
        console.log("這是主考官月曆")
        var a = '${allLeaveData}'
        var b = '${allLeaveData2}'
        var c = '${allExamData}'//所有考試資料
        var d = '${ExamDataByEmpId}'//主考官個人考試資料
		//所有請假的資料
		if(a!=""){
		var allLeaveDataJSON = JSON.parse('${allLeaveData}');			
		}
        
        if(b!=""){
    	var allLeaveDataJSON2 = JSON.parse('${allLeaveData2}');			
    	}
        
        if(c!=""){
        	var allExamDataJSON = JSON.parse('${allExamData}');			
        	}
        
        if(d!=""){
        	var ExamDataByEmpidJSON = JSON.parse('${ExamDataByEmpId}');			
        	}

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
        	
			editable : false,
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
//	 				url: 'http://www.319papago.idv.tw/holiday/2018-hr/2018_HR.html',
					startEditable: false,
					durationEditable: false,
					resourceEditable: false,
					overlap: false,
					color: 'red',						
				},
				{
				   events : allLeaveDataJSON,

			    },
				{
					events : allLeaveDataJSON2,

				},
				{
					events : allExamDataJSON,

				},
				{
					events : ExamDataByEmpidJSON,

				},
			    {
				googleCalendarId: 'eeit10102@gmail.com',
				editable : false,
				startEditable: false,
				durationEditable: false,
				resourceEditable: false,
				overlap: false,
			    } 
			],
			
			drop : function(date, jsEvent, ui, resourceId) {
				console.log("DROP : " + date.format());
				console.log(jsEvent.target.id);
				
				if(jsEvent.target.id=="takeALeave"){
				var Today=new Date();
				console.log(date);
				
				if(date>=Today){
					
				$('#insertLeave').modal('toggle');
				$('#insertLeaveStartDate').text(date.format());  //insert

				var a = $('#insertLeaveStartDate').text()+" "+$('#insertLeaveTime').val()+":00";
				var b = $('#insertLeaveEndDate').val()+" "+$('#insertLeaveEndTime').val()+":00";
							
				console.log(a+"----"+b)
				}else{
					alert("請假日期須大於今日")
					window.location.reload();
				}
				
				}else{
					//--------------------------------金昌----------------------------------------------------
					alert("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
					//---------------------------------------------------------------------------------------
				}
				
				
			},//LeaveStartDate
			
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
				console.log(typeof(event.eventId))
				if(typeof(event.eventId)==typeof(0)){
					
				var confirmState = confirm("請問要刪除該筆紀錄嗎?");
				if (confirmState == true) {
					$.get("deleteLeaveBean", {
						"eventId" : event.eventId
					}, function() {
						window.location.reload();
					})
				}
				}else{
					//------------------------------------------金昌------------------------------------------
                alert("標頭: "+event.title+"\n"+"時間: "+event.start._i);	                
					//---------------------------------------------------------------------------------------
				}
			},

			select : function(start, end, jsEvent, view){
				//讀時間
// 				console.log(start._i)

					//原來end會多算一天。所以扣一天的豪秒再轉成date
					var selectedEndDate=new Date((end-86400000));
					var endDateString = (selectedEndDate.getFullYear() + "-" 
					+ ("0"+(selectedEndDate.getMonth()+1)).slice(-2) + "-" +("0"+(selectedEndDate.getDate())).slice(-2));
					console.log(selectedEndDate);
					console.log(endDateString);
					
				$('#setLeaveStartDate').text(start.format());
			}
           
		});

	});
</script>

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