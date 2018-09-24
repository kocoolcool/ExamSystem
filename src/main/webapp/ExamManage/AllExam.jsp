<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/notifIt.css">
<link rel="stylesheet" type="text/css" href="css/123.css">

<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="js/jquery-accessibleMegaMenu.js"></script>
<script type="text/javascript" src="js/notifIt.min.js"></script>

</head>
<body>
<!-- Preloader -->
<div id="preloader">
<div id="status"><img src="images/456.gif"/></div>
<div id="loading_txt">Now Loading</div>
</div>


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
								

<!-- 系統管理者選單 選單 選單 選單 選單(qwe)-->
	<nav class="main_nav_contaner ml-auto ml-auto">
        <ul class="nav-menu" >


            <li class="nav-item">
                <a  href="http://localhost:8080/ExamSystem/index_Admin">首頁</a>
            </li>
            <li class="nav-item">
                <a href="ExamSystem/AllExam">考試系統</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="AllExam">管理考試</a></li><!-- Exam Manage -->
                        <li><a href="showAllAppBeanWhitchUnconfirm">核可考試</a></li><!-- Approve Exam -->
                        <li><a href="../examAppointment/Administrator.jsp">管理所有考試預約資料</a></li><!-- Manage ExamAppointment -->
                     </ul>
                </div> 
            </li>
              <li class="nav-item">
                <a href="ExamSystem/AllExam">請假系統</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="../FullCalendar">管理行事曆</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a href="../ShowEmailTemplates">連絡考生或寄信</a>
            </li>
            <li class="nav-item">
                <a href="ExamSystem/AllExam">後台管理的項目</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="../backManage/ShowBackstudentManage">管理學生資料</a></li>
                    </ul>
                     <ul class="sub-nav-group">
                        <li><a href="../backManage/ShowBackempManage">管理員工資料</a></li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="../CMManage">管理輪播牆</a></li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="showData2">數據分析</a></li>
                    </ul>
                </div>
            </li>
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
								<li><a href="../index_Admin">到首頁</a></li>
								<li>管理考試</li>
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
	<h1>安排考試</h1>
		<button id="showOpenExamButtion" class="btn btn-primary" >
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 顯示開放中考試
		</button>
		<button id="showFinishExamButtion" class="btn btn-primary">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 顯示已完成考試
		</button>
	
		<button id="addExamButtion" class="btn btn-primary" style=float:right data-toggle="modal" data-target="#insertExam">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增一筆考試
		</button>
		<br>
		<br>
		<br>
		<div id="showOpenData">
		<table id="dataTableTest" class="table table-striped table-bordered" style="width:100%">
			<thead>
				<tr>
				    <th width="12%" style = "display:none">序號</th>
					<th width="12%">考試編號</th>
					<th width="12%">班級</th>
					<th width="12%">科目</th>
					<th width="12%">時間</th>
					<th width="12%">主考官</th>
					<th width="12%">現在預約人數</th>
					<th width="12%">最多預約人數</th>
					<th width="12%">考試狀態</th>
					<th width="12%">動作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${exam}" var="exam" varStatus="loopCounter">
					<tr id="${exam.examId}">
					    <td style = "display:none"><c:out value="${exam.id}" /></td>
						<td><a href="<spring:url value='ExamDetail?ExamId=${exam.examId}'/>">${exam.examId}</a></td>
						<td><c:out value="${exam.classId}" /></td>
						<td><c:out value="${exam.examSubject}" /></td>
						
						<td><c:out value="${fn:substring(exam.examTime,0,16)}" /></td>		
						<td><c:out value="${exam.employeeBean.employeeName}" /></td>
						<td><c:out value="${exam.currentAppointment}" /></td>
						<td><c:out value="${exam.maxAppointment}" /></td>
						<c:choose>
    					<c:when test="${exam.status == 0}">
      				 		<td><c:out value="考試開放報名中" /></td>
    					</c:when>
    					<c:when test="${exam.status == 1}">
      				 		<td><c:out value="考試已結束" /></td>
    					</c:when>
						</c:choose>
<%-- 						<td><c:out value="${exam.status}" /></td> --%>
<!--------------------------暫時還不用XML,JSO檔 ---------------------->
<%-- 			<td><a href="<spring:url value='ExamDetail.xml?ExamId=${exam.examId}'/>">XML</a> </td> --%>
<%-- 			<td><a href="<spring:url value='ExamDetail.json?ExamId=${exam.examId}'/>">JSON</a> </td> --%>

				<td><nobr>
				<button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#selectExam">更新</button>
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
				
				<button  type="button" class="btn btn-danger" >刪除</button>
				
				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>	
				</nobr></td>
						
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div id="showFinishData">
		<table id="dataTableTest1" class="table table-striped table-bordered" style="width:100%">
			<thead>
				<tr>
				    <th width="12%" style = "display:none">序號</th>
					<th width="12%">考試編號</th>
					<th width="12%">班級</th>
					<th width="12%">科目</th>
					<th width="12%">時間</th>
					<th width="12%">主考官</th>
					<th width="12%">現在預約人數</th>
					<th width="12%">最多預約人數</th>
					<th width="12%">考試狀態</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${exam1}" var="exam1" varStatus="loopCounter">
					<tr>
					    <td style = "display:none"><c:out value="${exam1.id}" /></td>
						<td><a href="<spring:url value='ExamDetail?ExamId=${exam1.examId}'/>">${exam1.examId}</a></td>
						<td><c:out value="${exam1.classId}" /></td>
						<td><c:out value="${exam1.examSubject}" /></td>
						
						<td><c:out value="${fn:substring(exam1.examTime,0,16)}" /></td>		
						<td><c:out value="${exam1.employeeBean.employeeName}" /></td>
						<td><c:out value="${exam1.currentAppointment}" /></td>
						<td><c:out value="${exam1.maxAppointment}" /></td>
						<c:choose>
    					<c:when test="${exam1.status == 0}">
      				 		<td><c:out value="考試開放報名中" /></td>
    					</c:when>
    					<c:when test="${exam1.status == 1}">
      				 		<td><c:out value="考試已結束" /></td>
    					</c:when>
						</c:choose>
						
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
	</div>


<!-- 更新按鈕的modal開始	 -->
<div class="modal fade" id="selectExam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="width:500px" >
      <div class="modal-header" >
        <h5 class="modal-title" id="exampleModalLabel">Exam</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
<!---------------------------更新按鈕的modal BODY開始------------------------------>
			<form>
				<textarea id="showSelectedExamId" style="display:none;"></textarea>
				考試班級 :
				<br>
				<textarea id="showSelectedExamClass" style="resize:none" cols="30" rows="1"></textarea>
				<br>
				考試時間 :
				<div>
				<input type="text" id="showSelectedExamDate">
						<select id="showSelectedExamTime">
							<option value="00:00">請選擇</option>
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
				考試科目 :
				<br>
				<textarea id="showSelectedExamSubject" style="resize:none" cols="30" rows="1"></textarea>
				<br>
				允許考試人數 :
				<br>
				<textarea id="showSelectedExamAppointmen" style="resize:none" cols="30" rows="1"></textarea>
				<br>
				主考官 :
				<br>
				<select id="showSelectedExamEmployee" style="resize:none" cols="60" rows="1">
					<c:forEach var="employee" items="${employeeList}">
					<option value="${employee.key}" >${employee.value}</option>
       				</c:forEach>
				</select>
			</form>
<!---------------------------更新按鈕的modal BODY結束------------------------------>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelUpdateExamBuittion">關閉</button>
        <button type="button" class="btn btn-primary" id="updateCheckButtion">更新確認</button>
      </div>
    </div>
  </div>
</div>
<!---------------------------更新按鈕的modal結束------------------------------>

<!---------------------------新增按鈕的modal開始------------------------------>
<div class="modal fade" id="insertExam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="width:500px" >
      <div class="modal-header" >
        <h5 class="modal-title" id="exampleModalLabel">Exam</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
<!---------------------------新增按鈕的modal BODY------------------------------>
			<form>
				<textarea id="addSelectedExamId" style="display:none;"></textarea>
				考試班級 :
				<br>
				<textarea id="addSelectedExamClass" style="resize:none" cols="30" rows="1"></textarea>
				<br>
				考試時間 :
				<div>
				<input type="text" id="addSelectedExamDate">
						<select id="addSelectedExamTime">
							<option value="00:00">請選擇</option>
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
				<br>
				考試科目 :
				<br>
				<textarea id="addSelectedExamSubject" style="resize:none" cols="30" rows="1"></textarea>
				<br>
				允許考試人數 :
				<br>
				<textarea id="addSelectedExamAppointmen" style="resize:none" cols="30" rows="1"></textarea>
				<br>
				主考官 :
				<br>	
				<select id="addSelectedExamEmployee" style="resize:none" cols="60" rows="1">
						<c:forEach var="employee" items="${employeeList}">
							<option value="${employee.key}" >${employee.value}</option>
       					</c:forEach>
				</select>
				
			</form>
<!---------------------------新增按鈕的modal BODY------------------------------>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="canceAddExamButtion">關閉</button>
        <button type="button" class="btn btn-primary" id="addCheckButtion">新增確認</button>
      </div>
    </div>
  </div>
</div>
<!-------------------------------新增按鈕的modal結束------------------------------>	

<script>
$(document).on("click",'#dataTableTest tbody button:even',function(){
	//按下表單更新按鈕後
// 	$('table tbody tr button:even').each(function(){$(this).click(function(){
		var selectedValue =$(this).parents('tr').find('td:nth-child(2)').text()
		$.getJSON("getExamById",{"examId":selectedValue},function(data){
			$('#showSelectedExamClass').val(data[0]);
			$('#showSelectedExamDate').val(data[1]);
			$('#showSelectedExamTime').val(data[2]);
			$('#showSelectedExamSubject').val(data[3]);
			$('#showSelectedExamAppointmen').val(data[4]);
			$('#showSelectedExamEmployee').val(data[5]);
			$('#showSelectedExamId').val(data[6]);
		})
// 	})})
})	
	$(document).on("click",'#dataTableTest tbody button:odd',function(){
	//按下表單刪除按鈕後
// 	$('table tbody tr button:odd').each(function(){$(this).click(function(){
		var selectedValue =$(this).parents('tr').find('td:nth-child(2)').text()
		var r = confirm("Are you sure want to delete this exam?");
		if(r==true){
		$.get("deleteTo0",{"examId":selectedValue},function(){
			 	notDelete()	
				setTimeout("window.location.reload();", 1500 )	 
		})
		}
// 		})})
})	


		$(document).ready(function(){
			//連結前跑Loading畫面
			  $("#status").fadeOut();
		        $("#loading_txt").fadeOut();
		     $("#preloader").delay(350).fadeOut("slow");
			
		     //預設先隱藏完成考試Table
			$('#showFinishData').hide();
			
			//dataTable使用
			 $('#dataTableTest').DataTable(
					 {"order": [[ 0, "desc" ]]
					 ,"language": {
					        "emptyTable": "目前無安排考試"
					      }
					 
					 }
					 
			 );
			 $('#dataTableTest1').DataTable(
					 {"order": [[ 0, "desc" ]]}
			 );
			//檢視已結束考試的按鈕
			 $('#showFinishExamButtion').click(function(){
					$('#showOpenData').hide();
					$('#showFinishData').show();
				})
			 
			//檢視開放中考試的按鈕
			 $('#showOpenExamButtion').click(function(){
					$('#showFinishData').hide();
					$('#showOpenData').show();
				})	
			 
			 
			//updateDatepicker使用
			 	$("#showSelectedExamDate").datepicker();
				$("#showSelectedExamDate").datepicker("option", "dateFormat",
						'yy-mm-dd');
			//insertDatepicker使用
			 	$("#addSelectedExamDate").datepicker();
				$("#addSelectedExamDate").datepicker("option", "dateFormat",
						'yy-mm-dd');
		
			//按下Modal更新按鈕後
			$('#updateCheckButtion').click(function(){
				var a=$('#showSelectedExamClass').val()
				
				var b=$('#showSelectedExamDate').val()+" "+$('#showSelectedExamTime').val()+":00"
				
				var	c=$('#showSelectedExamSubject').val();
				
				var d=$('#showSelectedExamAppointmen').val();
				
				var e=$('#showSelectedExamEmployee').val();
				
				var f=$('#showSelectedExamId').val();
				$.get("update",
						{"classId":a,
						 "examTime":b,
						 "examSubject":c,
						 "maxAppointment":d,
						 "employeeId":e,
						 "examId":f},
				function(){
							 notUpdate()	
						setTimeout("window.location.reload();", 1500 )	 
				})
				
			})
				
				//按下modal新增按鈕後
				$('#addCheckButtion').click(function(){
					var a=$('#addSelectedExamClass').val()
					
					var b=$('#addSelectedExamDate').val()+" "+$('#addSelectedExamTime').val()+":00"
	 				
					var	c=$('#addSelectedExamSubject').val();
					
					var d=$('#addSelectedExamAppointmen').val();
					
					var e=$('#addSelectedExamEmployee').val();
					
					var f="1";
					$.get("insert",
							{"classId":a,
							 "examTime":b,
							 "examSubject":c,
							 "maxAppointment":d,
							 "employeeId":e,
							 "examId":f},
					function(){
								notInsert()	
								setTimeout("window.location.reload();", 1500 )	 
				})
		})
	})
		
</script>
<!-------------------------------更新按鈕的modal事件開始------------------------------>		
<script>
$('document').ready(function(){
	$('#selectExam').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('更新考試')
		  modal.find('.modal-body input').val(recipient)
		})

})	
</script>
<!-------------------------------更新按鈕的modal事件結束------------------------------>
<!-------------------------------新增按鈕的modal事件 開始------------------------------>
<script>
$('document').ready(function(){
	$('#insertExam').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('新增考試')
		  modal.find('.modal-body input').val(recipient)
		})

})	
</script>




<!-- 測試成功回傳訊息 -->
<script>

function notUpdate(){

	notif({
		  type: "warning",
		  msg: "修改成功!",
		  position: "center",
		  opacity: 0.8
		});

}


function notInsert(){

	notif({
		  type: "warning",
		  msg: "新增成功!",
		  position: "center",
		  opacity: 0.8
		});

}

function notDelete(){

	notif({
		  type: "warning",
		  msg: "刪除成功!",
		  position: "center",
		  opacity: 0.8
		});

}




</script>


<!-------------------------------新增按鈕的modal事件結束------------------------------>
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