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
<title>後台員工資料管理</title>
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
<link rel="stylesheet" href='<c:url value="css/jquery-ui-1.10.4.custom.css"/>'>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="css/EEIT10127_AccessibleMegaMenu.css">  



<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
 <script src="js/jquery-accessibleMegaMenu.js"></script>


<style>
table{ 
 	border:2px solid blue; 
 	border-collapse: collapse; 
 		} 
 td{border:1px solid blue} 


th {
	text-align: left
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
                        <li><a href="../ExamManage/AllExam">管理考試</a></li><!-- Exam Manage -->
                        <li><a href="../ExamManage/showAllAppBeanWhitchUnconfirm">核可考試</a></li><!-- Approve Exam -->
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
                        <li><a href="ShowBackstudentManage">管理學生資料</a></li>
                    </ul>
                     <ul class="sub-nav-group">
                        <li><a href="ShowBackempManage">管理員工資料</a></li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="../CMManage">管理輪播牆</a></li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="../ExamManage/showData2">數據分析</a></li>
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
									<li>後台員工資料管理</li>
									<!-- 這邊記得修改當前所在位置 -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- About -->
<div style="width: 95%; margin: 0 auto;">
	
		
<!-- 	<h1>List Of back</h1> -->

		<br>
		<br>
					<h2>員工資料</h2>

	<table id="dataTableTest" class="table table-striped table-bordered">

			<thead>
				<tr>
					<th width="12%">員工ID</th>
					<th width="12%">員工姓名</th>
					<th width="12%">職稱</th>
					<th width="12%">信箱</th>
					<th width="12%">住址</th>
					<th width="12%">電話</th>
<!-- 					<th width="12%">照片</th> -->
					<th width="12%">權限</th>
					<th width="12%"></th>
				</tr>
			<tbody>
				<c:forEach items="${employee}" var="employee" varStatus="loopCounter">
					<tr>
<%-- 					<td><a href="<spring:url value='ExamDetail?ExamId=${exam.examId}'/>">${exam.examId}</a></td> --%>
					    <td><c:out value="${employee.employeeId}" /></td>
						<td><c:out value="${employee.employeeName}" /></td>
						<td><c:out value="${employee.position}" /></td>
						<td><c:out value="${employee.email}" /></td>
						<td><c:out value="${employee.address}" /></td>
						<td><c:out value="${employee.phone}" /></td>
<!-- 				        <td><img src ="images/emp1.jpg" height="40" width="50" /></td> -->
					   
					    <c:choose>
                         <c:when test="${employee.whichIdentity=='1'}">     
                       <td> <c:out value="主考官"/></td>
                        </c:when>
                        <c:otherwise>  
                        <td><c:out value="管理員"/></td>
                        </c:otherwise>
                        </c:choose>
                       
<%-- 					     <td><c:out value="${employee.whichIdentity}" /> </td> --%>
					   
				<td><nobr>
				<button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#selectExam">Edit</button>
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
				
				<button  type="button" class="btn btn-danger" >Delete</button>
				
				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>	
				</nobr></td>
						
				</tr>
				</c:forEach>
			</tbody>
		</table>			
	</div>	
	
<!--EDIT的彈跳視窗 -->
<div class="modal fade" id="selectExam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="width:500px" >
      <div class="modal-header" >
        <h5 class="modal-title" id="exampleModalLabel">員工資料維護</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
<!---------------------------BODY----------------------------->
			<form>
				<textarea id="showSelectedExamId" style="display:none;"></textarea>
				員工姓名 :
				<br>
				<textarea id="showSelectedExamClass" style="resize:none" cols="60" rows="1"></textarea>
				<br>
				職稱 :
				<br>
				<textarea id="showSelectedExamTime" style="resize:none" cols="60" rows="1"></textarea>
				<br>
				信箱 :
				<br>
				<textarea id="showSelectedExamSubject" style="resize:none" cols="60" rows="1"></textarea>
				<br>
				住址 :
				<br>
				<textarea id="showSelectedExamAppointmen" style="resize:none" cols="60" rows="1"></textarea>
				<br>
				電話 :
				<br>
				<textarea id="showSelectedExamEmployee" style="resize:none" cols="60" rows="1"></textarea>
				<br>
				權限 :
				<br>
<!-- 				<textarea id="showSelectedStudentEducation" style="resize:none" cols="60" rows="1"></textarea> -->
				<select  id="showSelectedStudentEducation">
				<option value=0>管理員</option>
				<option value=1>主考官</option>
				</select>
				
				
<!-- 				<select id="showSelectedStudentEducation" style="resize:none"> -->
<%-- 				<c:forEach var="employee" items="${employeeIdentityList}"> --%>
<%-- 				<option value="${employee.key}">${employee.value}</option> --%>
<%-- 				</c:forEach> --%>
<%--                         <c:choose> --%>
<%--                          <c:when test="${employee.whichIdentity=='1'}">      --%>
<%--                        <option> <c:out value="管理員"/></option> --%>
<%--                        <option><c:out value="主考官"/></option> --%>
<%--                         </c:when> --%>
<%--                         <c:otherwise>   --%>
<%--                         <option><c:out value="主考官"/></option> --%>
<%--                         <option> <c:out value="管理員"/></option> --%>
<%--                         </c:otherwise> --%>
<%--                         </c:choose> --%>
<!-- 				</select> -->
				<br>
<!-- 隱藏ID: -->
				<div style='visibility: hidden;'><textarea id="showEmpId" style="resize:none" cols="60" rows="1"></textarea></div>
				<br>
				<br>
				
			</form>
<!---------------------------BODY----------------------------->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelUpdateExamBuittion">關閉</button>
        <button type="button" class="btn btn-primary" id="updateCheckButtion">更新確認</button>
<!-- 		<button type="button" class="btn btn-danger" id="deleteEmailTemplate">刪除確認</button> -->
        
      </div>
    </div>
  </div>
</div>
<!-- 更新按鈕的modal結束	 -->

<script>
$(document).ready(function(){
	 $('#dataTableTest').DataTable();
	//按下表單更新按鈕後
	$('table tbody tr button:even').each(function(){$(this).click(function(){
// 		console.log($(this).parents('tr').find('td:nth-child(1)').text());
		var selectedValue =$(this).parents('tr').find('td:nth-child(1)').text();
        console.log(selectedValue)
		console.log(selectedValue+"1111111111111");
		$.getJSON("updateEmp",{"updateEmp":selectedValue},function(data){
			console.log(typeof(data))
// 			console.log(data)
 			                    $('#showEmpId').val(data[0]); //員工ID
			 					$('#showSelectedExamClass').val(data[1]); //員工姓名
			 					$('#showSelectedExamTime').val(data[2]);  //職稱
			 					$('#showSelectedExamSubject').val(data[3]); //信箱
								$('#showSelectedExamAppointmen').val(data[4]);  //住址
			 					$('#showSelectedExamEmployee').val(data[5]); //電話
			 					$('#showSelectedStudentEducation').val(data[6]); //權限
			 					                                          //員工ID找人用
			 					console.log($('#showEmpId').val())
		})
	})})
	
	//按下Modal更新按鈕後
	$('#updateCheckButtion').click(function(){
		var empname=$('#showSelectedExamClass').val()
		
//			var b=$('#showSelectedExamTime').val()
		var position=$('#showSelectedExamTime').val()
		
		var	email=$('#showSelectedExamSubject').val();
		
		var address=$('#showSelectedExamAppointmen').val();
		
		var phone=$('#showSelectedExamEmployee').val();
		
// 		var whichIdentity=$('#showSelectedStudentEducation').val();
		var whichIdentity=$('#showSelectedStudentEducation').find(":selected").val();

		var selectedValue=$('#showEmpId').val();
		
		console.log(selectedValue);
		
		$.get("updateEmpbyId",
				{"empname":empname,
				 "position":position,
				 "email":email,
				 "address":address,
				 "phone":phone,
				 "whichIdentity":whichIdentity,
				 "showEmpId":selectedValue
				},
		function(){
			window.location.reload();
		})
		})
	})
	//按下表單刪除按鈕後
// 				$('table tbody tr button:odd').each(function(){$(this).click(function(){
// 					var selectedValue =$(this).parents('tr').find('td:nth-child(1)').text()
// 					var r = confirm("Are you sure want to delete this student?");
// 					if(r==true){
// 									$.get("delete",
// 									{"examId":selectedValue
// 										},
// 							function(){
// 								window.location.reload();
// 							})
// 							}
// 					})
// 				})
	//按下modal新增按鈕後
				$('#addCheckButtion').click(function(){
					console.log("AAAAAAAAAAA")
		var name=$('#showSelectedExamClass').val()
		
		var gender=$('#showSelectedExamTime').val()
		
		var	phone=$('#showSelectedExamSubject').val();
		
		var address=$('#showSelectedExamAppointmen').val();
		
		var birthday=$('#showSelectedExamEmployee').val();
		
		var level=$('#showSelectedStudentEducation').val();
		
		var money=$('#showSelectedStudentSalary').val();
		
		var workday=$('#showSelectedStudentStartday').val();

		var selectedValue=$('#showStudentId').val();
		
					$.get("insert",
							{"name":name,
							 "gender":gender,
							 "phone":phone,
							 "address":address,
							 "birthday":birthday,
							 "level":level,
							 "money":money,
							 "workday":workday,
							 "selectedValue":selectedValue
							},
					function(){
						window.location.reload();
				})
				
		})
			
	
</script> 
			<!-- Footer -->


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