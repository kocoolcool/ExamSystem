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

<link rel="stylesheet" type="text/css"
	href="css/EEIT10127_AccessibleMegaMenu.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<!-- 以上保留，下面放自己的資源 -->
<!-- <script src="js/jquery-3.3.1.min.js"></script> -->
<script src="js/jquery-accessibleMegaMenu.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<!-- FormStyle8 -->
<link rel="stylesheet" type="text/css"
	href="css/EEIT10106-FormStyle8.css">
<script src="js/EEIT10106-FormStyle8.js"></script>

<!-- Sortable -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="css/style.css"> -->

<script>
	
</script>
<style>
#custom-handle {
	width: 3em;
	height: 1.6em;
	top: 50%;
	margin-top: -.8em;
	text-align: center;
	line-height: 1.6em;
}

#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: auto;
}

#sortable li {
	margin: 0 3px 3px 3px;
	padding: 0.4em;
	font-size: 1.4em;
	height: auto;
	float: left;
}

#sortable li span {
	position: absolute;
	margin-left: -1.3em;
}
</style>
</head>
<body background="images/home_slider_1.jpg">

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
						<div
							class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container">
								<a href="/ExamSystem/index.jsp">
									<div class="logo_text">
										Exam<span>System</span>
									</div>
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
                        <li><a href="ExamManage/AllExam">管理考試</a></li><!-- Exam Manage -->
                        <li><a href="ExamManage/showAllAppBeanWhitchUnconfirm">核可考試</a></li><!-- Approve Exam -->
                        <li><a href="examAppointment/Administrator.jsp">管理所有考試預約資料</a></li><!-- Manage ExamAppointment -->
                     </ul>
                </div> 
            </li>
              <li class="nav-item">
                <a href="ExamSystem/AllExam">請假系統</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="FullCalendar">管理行事曆</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a href="ShowEmailTemplates">連絡考生或寄信</a>
            </li>
            <li class="nav-item">
                <a href="ExamSystem/AllExam">後台管理的項目</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="backManage/ShowBackstudentManage">管理學生資料</a></li>
                    </ul>
                     <ul class="sub-nav-group">
                        <li><a href="backManage/ShowBackempManage">管理員工資料</a></li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="CMManage">管理輪播牆</a></li>
                    </ul>
                    <ul class="sub-nav-group">
                        <li><a href="ExamManage/showData2">數據分析</a></li>
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
									<li><a href="index_Admin">Home</a></li>
									<li>CMManage</li>
									<!-- 這邊記得修改當前所在位置 -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 背景圖案	 -->



		<script>
			$(function() {
				$("#sortable").sortable({
					start : function(event, ui) {
						//    			console.log('start: ' + ui.item.index())
						//    			console.log("id : " + ui.item.attr("id"));
					},
					update : function(event, ui) {
						//    	    	 console.log('update: '+ui.item.index())
						//    	    	console.log("id : " + ui.item.attr("id"));
// 						var sortedId = ui.item.attr("id").split("sortLi")[1];
// 						var sortedIndex = ui.item.index();
// 						$.get("updateCMManageBeanSortNumber", {
// 							"id" : sortedId,
// 							"sortNumber" : sortedIndex
// 						}, function(data) {

// 						})
					},
					stop : function(e, ui) {
						$.map($(this).find('li'), function(el) {
							el.id + ' = ' + $(el).index()

							$.get("updateCMManageBeanSortNumber", 
							{
								"id" : el.id.split("sortLi")[1],
								"sortNumber" : $(el).index()
							}, function(data) {

							})

						})
					}

				});

				$("#sortable").disableSelection();

			});
		</script>
		<div style="background-color:black ; text-align:center; height:100% ; width:100% ;" >
		<ul id="sortable" style=" display:inline-block;">
			<c:forEach var='eachCMBeanForSortable'
				items='${CMBeanForSortableList}'>
				<li class="ui-state-default" id="sortLi${eachCMBeanForSortable.id}">
				<img
					src='data:image/jpeg;base64, ${eachCMBeanForSortable.base64image}'
					width='180px' height="120px"></li>
			</c:forEach>
		</ul>
		</div>
		<br><br>


		<script>
			$(document)
					.ready(
							function() {
								$('#tableForManageCM').DataTable({
									"language" : {
											 
											 "emptyTable" : "目前無輪播廣告",
									},
									"order": [[ 1, "asc" ]],
								});

								$('button[id^="updateCMManageBeanButton"]')
										.each(function() {

											$(this).click(function() {

												var updateBeanId = $(this).attr("id").split("updateCMManageBeanButton")[1];

												document.getElementById("updateImageCMTable"+ updateBeanId).submit();
																		// 				$('#updateImageCMTable').submit();
											})

									})
							})
		</script>
		<table id='tableForManageCM'>
			<thead>
				<tr>
					<td>圖片id</td>
					<td>排序</td>
					<td>標題</td>
					<td>敘述</td>
					<td>URL</td>
					<td>圖片</td>
					<td>編輯</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='eachCMManageBeanMap' items='${allCMManageBeanMap}'>
					<tr>
						<td>${eachCMManageBeanMap.key.id}</td>
						<td>${eachCMManageBeanMap.key.sortNumber}</td>
						<td>${eachCMManageBeanMap.key.title}</td>
						<td>${eachCMManageBeanMap.key.description}</td>
						<td>${eachCMManageBeanMap.key.linkURL}</td>
						<td><img
							src='data:image/jpeg;base64, ${eachCMManageBeanMap.value}'
							width='150px'></td>
						<td><button type="button" class="btn btn-primary"
								data-toggle="modal"
								data-target="#modal${eachCMManageBeanMap.key.id}">
								<img src="images/EEIT10106-setting-button02.png" width="30px">
							</button> &nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#deleteModal${eachCMManageBeanMap.key.id}">
								<img src="images/EEIT10106-delete-button.png" width="30px">
							</button></td>
					</tr>

					<!-- Modal fot UPDATE -->
					<div class="modal fade" id="modal${eachCMManageBeanMap.key.id}"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">目前修改編號
										:&nbsp;${eachCMManageBeanMap.key.id}</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 					       	//////////////////////////// -->
									<div class="form-style-8"
										style="width: 100%; margin: 20 20 20 20">
										<!-- 					  <h2>Upload</h2> -->
										<form:form
											id="updateImageCMTable${eachCMManageBeanMap.key.id}"
											modelAttribute="uploadCMManageBean" method="POST" 
											action="updateImage" enctype='multipart/form-data'>
											<form:input type="hidden" path="id"
												value="${eachCMManageBeanMap.key.id}" />
										圖片標題&nbsp;&nbsp;&nbsp;<form:input type="text" name="title"
												path="title" required="required"
												value="${eachCMManageBeanMap.key.title}" />
											<br>
											<br>
										圖片敘述&nbsp;&nbsp;&nbsp;<form:input type="text"
												name="description" path="description"
												value="${eachCMManageBeanMap.key.description}" />
											<br>
											<br>
										圖片連結&nbsp;&nbsp;&nbsp;<form:input type="text" name="linkURL"
												path="linkURL" value="${eachCMManageBeanMap.key.linkURL}" />
											<br>
											<br>
										上傳圖片&nbsp;&nbsp;&nbsp;<form:input type="file"
												accept="image/png, image/jpeg, image/jpg" name="image"
												path="uploadImage" />
											<br>
											<br>
										排序&nbsp;&nbsp;&nbsp;<form:input type="text" name="sortNumber"
												path="sortNumber"
												value="${eachCMManageBeanMap.key.sortNumber}" />
											<br>
											<br>
											<!-- 						<button id="submitUploadNewImageCMTable" type='submit'>送出</button> -->
										</form:form>
									</div>

									<!-- 					       	///////////////////////////// -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
									<button type="button" class="btn btn-primary"
										id="updateCMManageBeanButton${eachCMManageBeanMap.key.id}">修改確認</button>
								</div>
							</div>
						</div>
					</div>

					<script>
						$(document).ready(function() {
							$('button[id^="deleteCMManageBeanButton"]').each(function() {

								$(this).click(function() {

										var deleteBeanId = $(this).attr("id").split("deleteCMManageBeanButton")[1];

										document.getElementById("deleteImageForm"+ deleteBeanId).submit();
																					// 				$('#updateImageCMTable').submit();
												})

										})
							})
					</script>
					<!-- Modal for DELETE -->
					<div class="modal fade"
						id="deleteModal${eachCMManageBeanMap.key.id}" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">目前刪除編號
										:&nbsp;${eachCMManageBeanMap.key.id}</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="deleteImageForm${eachCMManageBeanMap.key.id}"
										action="deleteImage" method="GET">

										<input type="hidden" value="${eachCMManageBeanMap.key.id}"
											name="deleteId"> <font
											style="font-family: Microsoft JhengHei; font-size: 40pt; color: red">
											確定要刪除嗎?</font>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
									<button type="submit" class="btn btn-danger"
										id="deleteCMManageBeanButton${eachCMManageBeanMap.key.id}">確定刪除</button>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</tbody>
		</table>
		<hr>

		<script>
			$(document).ready(function() {
				$('#submitUploadNewImageCMTable').click(function() {
					$('#uploadNewImageCMTable').submit();
				})

				setTimeout(function() {
					$('#errorMessage').empty();
				}, 2000);
			})
		</script>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#modalForUpload">上傳圖片</button>
		&nbsp;&nbsp;&nbsp;<span style="color: red; font-size: 20pt"
			id="errorMessage">${error}</span>
		<!-- Modal -->
		<div class="modal fade" id="modalForUpload" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="width: 100%">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Upload</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-style-8" style="width: 100%; margin: 20 20 20 20">
							<!-- 					  <h2>Upload</h2> -->
							<form:form id="uploadNewImageCMTable"
								modelAttribute="CMManageBean" method="POST"
								action="uploadNewImage" enctype='multipart/form-data'>
						圖片標題&nbsp;&nbsp;&nbsp;<form:input type="text" name="title"
									path="title" required="required" placeholder="title" />
								<br>
								<br>
						圖片敘述&nbsp;&nbsp;&nbsp;<form:input type="text" name="description"
									path="description" placeholder="description" />
								<br>
								<br>
						圖片連結&nbsp;&nbsp;&nbsp;<form:input type="text" name="linkURL"
									path="linkURL" placeholder="Link" />
								<br>
								<br>
						上傳圖片&nbsp;&nbsp;&nbsp;<form:input type="file"
									accept="image/png, image/jpeg, image/jpg" name="image"
									path="uploadImage" />
								<br>
								<br>
						排序&nbsp;&nbsp;&nbsp;<form:input type="text" name="sortNumber"
									path="sortNumber" value="0" />
								<br>
								<br>
								<!-- 						<button id="submitUploadNewImageCMTable" type='submit'>送出</button> -->
							</form:form>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">關閉</button>
						<button type="button" class="btn btn-primary"
							id="submitUploadNewImageCMTable" type='submit'>送出</button>
					</div>
				</div>
			</div>
		</div>


		<!-- <div class="form-style-8" style="width:50% ; margin: 20 20 20 20" > -->
		<!--   <h2>UploadXX</h2> -->
		<%--   <form:form id="uploadNewImageCMTable" modelAttribute="CMManageBean" method="POST" action="uploadNewImage" enctype='multipart/form-data'> --%>
		<%-- 	圖片標題&nbsp;&nbsp;&nbsp;<form:input type="text" name="title" path="title" required="required"/><br><br> --%>
		<%-- 	圖片敘述&nbsp;&nbsp;&nbsp;<form:textarea name="description" path="description"/><br><br> --%>
		<%-- 	圖片連結&nbsp;&nbsp;&nbsp;<form:input type="text" name="linkURL" path="linkURL"/><br><br> --%>
		<%-- 	上傳圖片&nbsp;&nbsp;&nbsp;<form:input type="file" accept="image/png, image/jpeg, image/jpg" name="image" path="uploadImage"/><br><br> --%>
		<%-- 	排序&nbsp;&nbsp;&nbsp;<form:input type="text" name="sortNumber" path="sortNumber" value="1"/><br><br> --%>
		<!-- 	<button id="submitUploadNewImageCMTable" type='submit'>送出</button> -->
		<%-- </form:form> --%>
		<!-- </div> -->















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