<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>檢視信件範本</title>
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
<%-- <link rel="stylesheet" href='<c:url value="css/jquery-ui-1.10.4.custom.css"/>'> --%>
<link rel="stylesheet" type="text/css" href="css/EEIT10127_AccessibleMegaMenu.css">  


<!-- Table_Highlight_Vertical_Horizontal -->
<!-- <link rel="stylesheet" type="text/css" href="css/EEIT10106_Table_Highlight_font-awesome.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="css/EEIT10106_Table_Highlight_animate.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="css/EEIT10106_Table_Highlight_select2.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="css/EEIT10106_Table_Highlight_perfect-scrollbar.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="css/EEIT10106_Table_Highlight_util.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="css/EEIT10106_Table_Highlight_main.css"> -->




<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- google hangout -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
 <link rel="canonical" href="http://www.example.com" />

<!-- datatables -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<!-- datatables -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<script src="js/jquery-accessibleMegaMenu.js"></script>

<!-- 以下為了google第三方登入加的 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="65257694703-upl97b2f58a3spn0ts8opmtefbkbgnkd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src='https://www.google.com/recaptcha/api.js'></script>




<style>
/* table{  */
/*  	border:2px solid blue;  */
/*  	border-collapse: collapse;  */
/*  		}  */
 		
/*  td{border:1px solid blue}  */
/*  th{border:1px solid blue}  */
/*  學生清單table */
 .toggler { width: 1300px; height: auto;}
  #effect { width: 1000px; height: auto; padding: 0.4em; position: relative;}
  #effect h3 { margin: 0; padding: 0.4em; text-align: center; }
  input[type="checkbox"]{
	  width: 30px; /*Desired width*/
	  height: 30px; /*Desired height*/
	  cursor: pointer;
	}
 label {
   display: block;
   margin: 30px 0 0 0;
 }
 .overflow {
   height: 200px;
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
<!------------------------這邊填上登入頁面Google Login------------- -->
	<!------------------------這邊填上登入頁面Google Login------------- -->
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
<!-- 主考官選單 選單 選單 選單 選單(qwe)-->									
	<nav class="main_nav_contaner ml-auto ml-auto">
        <ul class="nav-menu" >
            <li class="nav-item">
                <a  href="http://localhost:8080/ExamSystem/index_Exami">首頁</a>
            </li>
            <li class="nav-item">
                <a href="ExamSystem/AllExam">考試系統</a>
                <div class="sub-nav">
                    <ul class="sub-nav-group">
                        <li><a href="ExamManage/showAllAppBeanWhitchUnconfirm">核可考試</a></li><!-- Approve Exam -->
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
               <a href="backManage/ShowBackstudentManage">管理學生的資料</a>
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
								<li>EmailTemplates</li>
								<!-- 這邊記得修改當前所在位置 -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>			
	</div>
<!----------------------顯示示內容開始----------------------------->
	<!-- About -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 用來檢視信件內容 -->
<!-- <div> -->
<!-- <table> -->
<!-- <tr> -->
<!-- <td>EmailId</td> -->
<!-- <td>標題</td> -->
<!-- <td>內容</td> -->
<!-- </tr> -->
<%-- <c:forEach var='emailTemplate' items='${allEmailTemplates }'> --%>
<!-- 	<tr> -->
<%-- 	<td>${emailTemplate.emailId}</td> --%>
<%-- 	<td>${emailTemplate.title}</td> --%>
<%-- 	<td>${emailTemplate.content}</td> --%>
<!-- 	</tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->
<!-- </div> -->


<div>選擇信件 : </div>
<select id="allEmail"  class="custom-select custom-select-lg mb-3">
<option value="" selected="true" disabled="true">請選擇信件</option>
<c:forEach var='emailTemplate' items='${allEmailTemplates}'>
	<option value='${emailTemplate.emailId}'>${emailTemplate.title}</option>
</c:forEach>
</select>
<br><br>

<script>
		

		$(document).ready(function(){
			
// 			//CKEditor4
// 			CKEDITOR.replace( 'showSelectedEmailContent' );
			
			//當從下拉式選單選擇信件時
			$('#allEmail').change(function(){
				var selectedValue = $('#allEmail :selected').val();
				
				$.getJSON("getEmailTemplateById",{"id":selectedValue},function(data){
					
					$('#showSelectedEmailTitle').val(data[0]);
					$('#showSelectedEmailContent').val(data[1]);
					$('#showSelectedEmailId').val(data[2]);
				})
				
				

			})
			
			//取消 (更新/刪除) modal視窗後
			$('#cancelUpdateEmailTemplate').click(function(){

				var selectedValue = $('#allEmail :selected').val();
				$.getJSON("getEmailTemplateById",{"id":selectedValue},function(data){
					
					$('#showSelectedEmailTitle').val(data[0]);
					$('#showSelectedEmailContent').val(data[1]);
					$('#showSelectedEmailId').val(data[2]);
				})
				
			})
			
			
			//刪除信件按鈕
			$('#deleteEmailTemplate').click(function(){
				var confirmState = confirm("確定刪除嗎?");
				var deletedEmailId = $('#showSelectedEmailId').val();
				if(deletedEmailId >0 ){
					if(confirmState == true){
						
						$.get("mailCalendarChat/deleteEmailTemplate",{"id":deletedEmailId},function(data){
							window.location.reload();
						})
					}
				}
		
			})
			
			//修改信件按鈕
			$('#updateEmailTemplate').click(function(){
				var updateEmailId = $('#showSelectedEmailId').val();
				var updateEmailTitle = $('#showSelectedEmailTitle').val();
				var updateEmailContent = $('#showSelectedEmailContent').val();
				
				if(updateEmailId > 0){
					$.get("mailCalendarChat/updateEmailTemplate",
							{"id":updateEmailId, "title":updateEmailTitle, "content":updateEmailContent},function(data){
								window.location.reload();
							})
				}
				
			})
			
			//新增信件按鈕
			$('#insertEmailTemplate').click(function(){
				var insertEmailTitle = $('#insertEmailTemplateTitle').val();
				var insertEmailContent = $('#insertEmailTemplateContent').val();
				
				if(insertEmailTitle != ""){
					$.post("mailCalendarChat/createEmailTemplate",{"title":insertEmailTitle, "content":insertEmailContent, "status":1},
							function(data){
						window.location.reload();
					})
				}else{
					alert("請輸入標題");
				}
					
			})
			
			
		})	

	
</script>


<script>

$('document').ready(function(){
	$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('信件預覽')
		  modal.find('.modal-body input').val(recipient)
		})

})


</script>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewEmailModal">
  預覽信件
</button>

<!-- Modal -->
<div class="modal fade" id="viewEmailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="width:500px" >
      <div class="modal-header" >
        <h5 class="modal-title" id="exampleModalLabel">Email</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
<!--         !!!!內容!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			<form>
				<textarea id="showSelectedEmailId" style="display:none;"></textarea>
				信件標題 :
				<br>
				<textarea id="showSelectedEmailTitle" style="resize:none" cols="40" rows="1"></textarea>
				<br><br>
				<div>信件內容 : <br><textarea id="showSelectedEmailContent" cols="40" rows="20"></textarea></div>
			</form>
<!--         !!!!!!!!!!!!!!!!內容 !!!!!!!!!!!!!!!!!-->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelUpdateEmailTemplate">關閉</button>
        <button type="button" class="btn btn-primary" id="updateEmailTemplate">修改確認</button>
		<button type="button" class="btn btn-danger" id="deleteEmailTemplate">刪除確認</button>
        
      </div>
    </div>
  </div>
</div>





<script>
//新增信件
$('document').ready(function(){
	$('#exampleModal2').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('新增信件')
		  modal.find('.modal-body input').val(recipient)
		})
		
})


</script>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertMailModal">
  新增信件
</button>

<!-- Modal -->
<div class="modal fade" id="insertMailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" >
    <div class="modal-content" style="width:500px">
      <div class="modal-header" >
        <h5 class="modal-title" id="exampleModalLabel">Email</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
<!--         !!!!內容!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
        		<form id="createEmailTemplate" method="post">
        		
				信件標題 : <br><textarea name="title" id="insertEmailTemplateTitle" cols="40"></textarea>
				<br><br>
				信件內容 : <br><textarea name="content" id="insertEmailTemplateContent" cols="40" rows="20"> </textarea>
				<br>
				</form>
<!--         !!!!!!!!!!!!!!!!內容 !!!!!!!!!!!!!!!!!-->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary" id="insertEmailTemplate">送出</button>

      </div>
    </div>
  </div>
</div>



<hr>

<!-- 選擇班級後出現學生table清單 -->
<script>
//Google hangout
window.onLoadCallback = function(){
	  gapi.auth2.init({
	      client_id: 'filler_text_for_client_id.apps.googleusercontent.com'
	    });
	}
	
	
window.___gcfg = {
  lang: 'zh-TW',
  parsetags: 'onload'
};

function renderButtons(studentDivId , studentEmail){
    gapi.hangout.render(studentDivId, {
        'render': 'createhangout',
        'invites': "[{ 'id' : "+studentEmail+", 'invite_type' : 'EMAIL' }]",
        'topic' : '偉康考試系統',
        'hangout_typ':'normal',
        'widget_size':150,
      });
  }
////////////////////////////////

$(document).ready(function(){


	
	//動態產生學生清單
	   	$('#selectStudentByClass').change(function(){
	   		//選取班級後隱藏所有學生table
	   		$('#divShowAllStudents').css("display","none");
	   		//顯示動態產生的table
// 	   		$('#showStudentsTable').css("display","inline")
	   		//先隱藏動態產生的table
	   		$( "#effect" ).hide();
	   		//清空選取後的學生table
	   		$('#divForShowStudentsTable').empty();
// 	   		$('#showStudentsTableTbody').empty();
	   		
			var selectedClassId= $('#selectStudentByClass :selected').val();
			$.getJSON("getStudentsByClassId",{"classId":selectedClassId},function(data){
// 				console.log(data)
				var docFragment = $(document.createDocumentFragment());
				var tableCell = $('<table id="showStudentsTable">'  //class="table table-hover"
				+'<thead><tr><th><input type="checkbox" id="toggleAllStudents"></th>'
				+'<th>預約者Id</th>'
				+'<th>姓名</th>'
				+'<th>班級</th>'
				+'<th>電話</th>'
				+'<th>email</th>'
				+'<th>Hangouts</th>'
				+'</tr></thead>'
				+'</table>');
				
				var showStudentTBody = $('<tbody></tbody>');
				
				$.each(data,function(outerIndex,studentArray){
					var checkboxCell = $('<td></td>')
						checkboxCell.html('<input type="checkbox">');
					var idCell =$('<td></td>').text(studentArray[0]);
					var nameCell = $('<td></td>').text(studentArray[1]);
					var classCell = $('<td></td>').text(studentArray[2]);
					var phoneCell = $('<td></td>').text(studentArray[3]);
					var emailCell = $('<td></td>').text(studentArray[4]);
					var hangoutCell = $('<td></td>');
					    var divForHangoutWithStudentCell = $('<div></div>')
					    divForHangoutWithStudentCell.attr("id","divForHangoutWithStudent" + outerIndex);
					hangoutCell.append(divForHangoutWithStudentCell);
					var row = $('<tr></tr>').append([checkboxCell,idCell,nameCell,classCell,phoneCell,emailCell,hangoutCell]);
// 					showStudentTBody.append(row);
					showStudentTBody.append(row)
// 					docFragment.append(row)
					
					
				})
				tableCell.append(showStudentTBody);
				docFragment.append(tableCell);
// 				$('#showStudentsTableTbody').append(docFragment);
// 				docFragment.append($('#showStudentsTable').append(showStudentTBody));
				
				docFragment.append("<a href='javascript: return false;' id='sendEmailViaClass'><img src='images/EEIT10106-mail-send.png' alt='照片施工中!' width='100'></a>"
				+"<img src='images/EEIT10106-mail-send-loop3.gif' alt='照片施工中!' width='100px' id='sendEmailViaClassLoading' style='display:none'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id='spanSendStatusInClass' style='font-size:40px ;font-weight:bold'></span>");
				
				$('#divForShowStudentsTable').append(docFragment);
				
				

				$('#divForShowStudentsTable').css("display","block");
				runEffect();
				

				//toggle被選取的學生
				$('#toggleAllStudents').change(function(){
					var toggleCheckedStatus= $(this).prop('checked');
					$('#divForShowStudentsTable').find(":checkbox").prop('checked',toggleCheckedStatus)
				})
				
				//從row點擊就可勾選
// 				$('#divForShowStudentsTable').find("tbody tr").click(function(){
// 					var eachSelectedStudent = $(this).find(":checkbox").prop('checked');
// 					$(this).find(":checkbox").prop('checked', !eachSelectedStudent);
// 				})
				
				//針對每個學的生mail做hangout 按鈕
				var allhangoutWithStudentTd = $('#divForShowStudentsTable tbody').find('div');
				$.each(allhangoutWithStudentTd,function(){
					//找到個學生的email
					var eachStudentEmail =$(this).parent('td').parent('tr').find('td:eq(5)').text();
					var divForHangoutWithStudent = $(this).attr('id');
					
					renderButtons(divForHangoutWithStudent, eachStudentEmail);
	
				})
					
					
					
					
					
					

				//將選擇後產生的tale渲染成DataTable
				$('#showStudentsTable').DataTable();
				
			})
		})
	

	

		    // run the currently selected effect
		    function runEffect() {
		      // get effect type from
		      var selectedEffect = "scale";
		 
		      // Most effect types need no options passed by default
		      var options = {};
		      // some effects have required parameters
		      if ( selectedEffect === "scale" ) {
		        options = { percent: 50 };
		      } else if ( selectedEffect === "size" ) {
		        options = { to: { width: 280, height: 185 } };
		      }
		 
		      // Run the effect
		      $( "#effect" ).show( selectedEffect, options, 500 );
		    };
		 
		    //callback function to bring a hidden box back
// 		    function callback() {
// 		      setTimeout(function() {
// 		        $( "#effect:visible" ).removeAttr( "style" ).fadeOut();
// 		      }, 1000 );
// 		    };
		 
		    // Set effect from select menu value
		 
		    //剛ready時就先隱藏起來
		    $( "#effect" ).hide();
		    
		    //
 
			
			//on繫節動態產生的email寄信按鈕的click動作
			$('#divForShowStudentsTable').on('click','a[id="sendEmailViaClass"]',function(){
				
				//找出選擇要發信的信件title
// 				var selectedTitle = $('#showSelectedEmailTitle').html();
				var selectedTitle = $('#allEmail :selected').html();
				console.log("title : " + selectedTitle);
				//找出選擇要發信的信件Content
				var selectedContent = $('#showSelectedEmailContent').val();
				console.log("content : " + selectedContent);
				//判斷是不是有先選擇信件
				if( selectedTitle!="" && selectedTitle!=null && selectedTitle!="請選擇信件"){
				
					//將選出的email和姓名組成字串傳出
					var selectedEmailList="";
					var selectedNameList="";
					//選擇器找到被勾選的學生的email<td>標籤
					var selectedEmailArray = $('#divForShowStudentsTable table td input:checked').parent('td').parent('tr').find('td:eq(5)')
					var selectedNameArray = $('#divForShowStudentsTable table td input:checked').parent('td').parent('tr').find('td:eq(2)')
					
					
					if(selectedEmailArray.length>0){
						for(var i=0 ; i<selectedEmailArray.length ; i++){
							
							//得到每個email的text值
							var emailTemp = $(selectedEmailArray[i]).text();
							var nameTemp = $(selectedNameArray[i]).text();
							
							if(i==selectedEmailArray.length-1){
								selectedEmailList= selectedEmailList + emailTemp;
								selectedNameList= selectedNameList + nameTemp;
							}else{
								selectedEmailList= selectedEmailList + emailTemp + ",";
								selectedNameList= selectedNameList + nameTemp + ",";
							}
								
						}
						//通知Controller發信
						
						var confirmSend = confirm("確定發信嗎?");
						if(confirmSend==true){
							$('#spanSendStatusInClass').empty(); 
							$('#sendEmailViaClassLoading').css("display","inline");
							$('#sendEmailViaClass').hide();
							
							setTimeout(function(){ 
								
								$.get('sendEmailToStudentWithTemplate',
										{"selectedEmailList":selectedEmailList, "selectedNameList":selectedNameList ,
										 "selectedTitle":selectedTitle, "selectedContent":selectedContent},function(data){
										
										$('#sendEmailViaClassLoading').css("display","none");
										$('#sendEmailViaClass').show();
										//alert("發信成功");
										$('#spanSendStatusInClass').css('color','green').text("寄信成功!");
//	 									$('#spanSendStatusInClass').append("<img src='images/EEIT10106-mail-send-loop4.gif' width='200px'>");
										setTimeout(function(){ $('#spanSendStatusInClass').empty(); }, 1500);
								})
								
							}, 2000);
							
							
							
						}
						
						
					}else{
// 						alert("請選擇收件人!");
						$('#spanSendStatusInClass').css('color','red').text('請選擇收件人!!');
					}
					
				
				}else{
// 					alert("請先選擇信件在發送!!");
					$('#spanSendStatusInClass').css('color','red').text('請先選擇信件在發送!!');
				}
				
				
			
				 
			})
					
	
	
})

</script>
<!-- 依照班級產生該班級的學生名單 -->
<div>
	請選擇班級 : 
	<select id='selectStudentByClass'  class="custom-select custom-select-lg mb-3">
		<option value="" selected="true" disabled="true" id="defaultOptionForSelectStudentByClass">請選擇班級</option>
			<c:forEach var='allClassList' items='${allClass}'>
				<option value='${allClassList.classId}'>${allClassList.classId} : ${allClassList.className}
					<c:if test='${allClassList.address != null}'>(${allClassList.address})</c:if>
				</option>
			</c:forEach>
	</select>
	&nbsp;&nbsp;&nbsp;
	<input type="button" value="檢視所有學生" class="btn btn-success" id="buttonToShowAllStudentsTable">
</div>

<script>
	$('#buttonToShowAllStudentsTable').click(function(){
		$('#divForShowStudentsTable').css("display","none");
		$( "#effect" ).hide();
		$('#divShowAllStudents').css("display","inline");
		$('#defaultOptionForSelectStudentByClass').prop("selected","selected");
	})
</script>


<!-- Explode特效的區塊 -->
<div class="toggler" style="width:100% ">
  <div id="effect" class="ui-widget-content ui-corner-all" style="width:100%">
    <h3 class="ui-widget-header ui-corner-all">學生資料</h3>
		<div class="table100 ver1 m-b-110" style="width:100%">
			<div id="divForShowStudentsTable" style="width:100%">
			</div>
			
		</div>
  </div>
</div>

<script>
	$(document).ready(function(){
// 	$(document).one('click',function(){	
		
		
		
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		//現在出現BUG，需要繫節綁定Datatable內的所有event
// 		$('#TableShowAllStudents').on('mousemove',function(){
// 			全選所有學生
			$('#toggleAllStudentsInAllStudentsTable').change(function(){
				var checkStatus = $(this).prop("checked");
// 				$(this).parent("td").parent("tr").parent("thead").parent("table").css("background-color","red")
// 				     find('tbody input[id^="TableShowAllStudentsCheckBoxId"]').prop("checked",checkStatus);
				$('#TableShowAllStudents tbody :checkbox').prop("checked",checkStatus);
// 				$('#TableShowAllStudents tbody input[id^="TableShowAllStudentsCheckBoxId"]').prop("checked",checkStatus);
			})

			//找到所有被選取的學生
			$('#sendEmailInAllStudentsTable').click(function(){
				
				if($('#TableShowAllStudents tbody :checked').length > 0) {
					
					var confirmSend = confirm("確定發信嗎?");
					
					$('#TableShowAllStudents tbody :checked').each(function(){
						
						var selectedStudentName = $(this).parent('td').parent('tr').find('td:eq(2)').text();
						var selectedStudentEmail = $(this).parent('td').parent('tr').find('td:eq(5)').text()

						//找出選擇要發信的信件title
//		 				var selectedTitle = $('#showSelectedEmailTitle').html();
						var selectedTitle = $('#allEmail :selected').html();
//		 				console.log("title : " + selectedTitle);
						//找出選擇要發信的信件Content
						var selectedContent = $('#showSelectedEmailContent').val();
//		 				console.log("content : " + selectedContent);
						//判斷是不是有先選擇信件
						if( selectedTitle!="" && selectedTitle!=null && selectedTitle!="請選擇信件"){

// 							var confirmSend = confirm("確定發信嗎?");
							if(confirmSend==true){
								$('#sendEmailStatus').empty();
								$('#sendEmailInAllStudentsTable').hide();
								$('#sendEmailInAllStudentsTableLoading').css("display","inline");
								
								setTimeout(function(){ 
								
									$.get("sendEmailToStudentWithTemplate",
											{"selectedEmailList":selectedStudentEmail,
											 "selectedNameList":selectedStudentName,
											 "selectedTitle":selectedTitle,
											 "selectedContent":selectedContent
										},function(){
//		 									alert("寄信成功!")
											$('#sendEmailInAllStudentsTableLoading').css("display","none");
											$('#sendEmailInAllStudentsTable').show();
											$('#sendEmailStatus').css('color','green').text("寄信成功!");
//	 										$('#sendEmailStatus').append("<img src='images/EEIT10106-mail-send-loop5.gif' width='200px'>");
											setTimeout(function(){ $('#sendEmailStatus').empty(); }, 1700);
										})
									
									
								}, 2000);
								
							}
							
						}else{
// 							alert("請先選擇信件在發送!!");
							$('#sendEmailStatus').css('color','red').text("請先選擇信件在發送!!");
						}
					})
				}else{
// 					alert("請選擇收件人!");
					$('#sendEmailStatus').css('color','red').text('請選擇收件人!');
				}
				
						
			})
			
			//點擊tr即可選取學生
// 			$('#TableShowAllStudents tbody tr td').each(function(){
// 				$(this).click(function(){
// 					var checkStatus = $(this).parent('tr').find('td:eq(0)').find("input").prop("checked")
// 					$(this).parent('tr').find('td:eq(0)').find("input").prop("checked",!checkStatus)
// 				})
// 			})
			
			
			//將所有學生table中的hangout DIV渲染成hangouts
// 			$('#TableShowAllStudents tbody div[id^="allStudentsHangoutsid"]').each(function(){
// 				    var allStudentsTableDivId= $(this).attr("id")
// 					var allStudentsTableEmail=$(this).parent('td').parent('tr').find('td:eq(5)').text()
					
// 					renderButtons(allStudentsTableDivId,allStudentsTableEmail);
// 			})

// 		})
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////

// 			  列出所有學生清單，並表格渲染成DataTables
			$('#TableShowAllStudents').DataTable();
			
// 			$('#TableShowAllStudents').one( 'init.dt', function () {
				
// 				$('#toggleAllStudentsInAllStudentsTable').change(function(){
// 					var checkStatus = $(this).prop("checked");
// //	 				$(this).parent("td").parent("tr").parent("thead").parent("table").css("background-color","red")
// //	 				     find('tbody input[id^="TableShowAllStudentsCheckBoxId"]').prop("checked",checkStatus);
// 					$('#TableShowAllStudents tbody :checkbox').prop("checked",checkStatus);
// //	 				$('#TableShowAllStudents tbody input[id^="TableShowAllStudentsCheckBoxId"]').prop("checked",checkStatus);
// 				})

// 				//找到所有被選取的學生
// 				$('#sendEmailInAllStudentsTable').click(function(){
					
// 					if($('#TableShowAllStudents tbody :checked').length > 0) {
// 						$('#TableShowAllStudents tbody :checked').each(function(){
							
// 							var selectedStudentName = $(this).parent('td').parent('tr').find('td:eq(2)').text();
// 							var selectedStudentEmail = $(this).parent('td').parent('tr').find('td:eq(5)').text()

// 							//找出選擇要發信的信件title
// //			 				var selectedTitle = $('#showSelectedEmailTitle').html();
// 							var selectedTitle = $('#allEmail :selected').html();
// //			 				console.log("title : " + selectedTitle);
// 							//找出選擇要發信的信件Content
// 							var selectedContent = $('#showSelectedEmailContent').val();
// //			 				console.log("content : " + selectedContent);
// 							//判斷是不是有先選擇信件
// 							if( selectedTitle!="" && selectedTitle!=null && selectedTitle!="請選擇信件"){
// 								$.get("sendEmailToStudentWithTemplate",
// 										{"selectedEmailList":selectedStudentEmail,
// 										 "selectedNameList":selectedStudentName,
// 										 "selectedTitle":selectedTitle,
// 										 "selectedContent":selectedContent
// 									},function(){
// 										alert("寄信成功!")
// 									})
							
// 							}else{
// 								alert("請先選擇信件在發送!!");
// 							}
// 						})
// 					}else{
// 						alert("請選擇收件人!");
// 					}
					
							
// 				})
				
// 				//點擊tr即可選取學生
// 				$('#TableShowAllStudents tbody tr td').each(function(){
// 					$(this).click(function(){
// 						var checkStatus = $(this).parent('tr').find('td:eq(0)').find("input").prop("checked")
// 						$(this).parent('tr').find('td:eq(0)').find("input").prop("checked",!checkStatus)
// 					})
// 				})
				
// 				//將所有學生table中的hangout DIV渲染成hangouts
// 				$('#TableShowAllStudents tbody div[id^="allStudentsHangoutsid"]').each(function(){
// 					    var allStudentsTableDivId= $(this).attr("id")
// 						var allStudentsTableEmail=$(this).parent('td').parent('tr').find('td:eq(5)').text()
						
// 						renderButtons(allStudentsTableDivId,allStudentsTableEmail);


// 				})
				
// 			})

	})
	
	$(document).on("click",'#TableShowAllStudents tbody div[id^="allStudentsHangoutsid"]',function(){
// 		將所有學生table中的hangout DIV渲染成hangouts
		$('#TableShowAllStudents tbody div[id^="allStudentsHangoutsid"]').each(function(){
			    var allStudentsTableDivId= $(this).attr("id")
				var allStudentsTableEmail=$(this).parent('td').parent('tr').find('td:eq(5)').text()
				
				renderButtons(allStudentsTableDivId,allStudentsTableEmail);
		})
	})

</script>

<div id="divShowAllStudents">
<table id="TableShowAllStudents" class="display">
    <thead>
        <tr>
            <th><input type="checkbox" id="toggleAllStudentsInAllStudentsTable"></th>
            <th>預約者id</th>
            <th>姓名</th>
            <th>班級</th>
            <th>電話</th>
            <th>Email</th>
            <th>Hangouts</th>
        </tr>
    </thead>
    <tbody>
		<c:forEach var='eachStudent' items='${allStudents}' varStatus='vs'>
			<tr>
				<td align='center'><input type='checkbox' id="TableShowAllStudentsCheckBoxId${vs.index}"></td>
				<td>${eachStudent.studentId}</td>
				<td>${eachStudent.studentName}</td>
				<td>${eachStudent.thisIsClass}</td>
				<td>${eachStudent.phone}</td>
				<td>${eachStudent.email}</td>
				<td><div id="allStudentsHangoutsid${vs.index}"><img src="images/EEIT10106-HANGOUTS.PNG"></div></td>
			</tr>
		</c:forEach>
    </tbody>
    <td colspan="7">
   		 <a href='javascript: return false;' >
   		 	<img src='images/EEIT10106-mail-send.png' alt='照片施工中!' width="100px" id="sendEmailInAllStudentsTable">

   		 	<img src='images/EEIT10106-mail-send-loop3.gif' alt='照片施工中!' width="100px" id="sendEmailInAllStudentsTableLoading" style="display:none">
   		 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   		<span id="sendEmailStatus" style="font-size:40px ;font-weight:bold"></span>
   	</td>
</table>
</div>








			
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<!-- Footer -->


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
<!-------------------------------網頁樣板所使用的js檔開始----------------------------------->

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
<script src="js/EEIT10127_AccessibleMegaMenu.js"></script>
<!-- Table_Highlight_Vertical_Horizontal -->
<script src="js/EEIT10106_Table_Highlight_select2.min.js"></script>
<script src="js/EEIT10106_Table_Highlight_main.js"></script>

</body>
</html>