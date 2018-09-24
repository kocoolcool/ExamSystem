<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
	
	
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


<!-- <meta name="google-signin-scope" content="profile email"> -->
<!-- <meta name="google-signin-client_id" -->
<!-- 	content="65257694703-upl97b2f58a3spn0ts8opmtefbkbgnkd.apps.googleusercontent.com"> -->
<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<!-- <script src='https://www.google.com/recaptcha/api.js'></script> -->
<!-- 以上為了google第三方登入加的 -->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring</title>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
</head>


<!-- 路徑連向的網頁 -->
<!-- loginnn.jsp	登入系統 -->
<!-- google登入鈕	          直接google帳號的登入 -->
<!-- Template       看看金昌做的頁面 -->
<!-- itIsSecret     測試是否會重新導向登入頁 -->
<!-- forTest        測試getStudentBeanByEmail()能不能正確執行 -->
<!-- students       連向students之網頁(群體之資料) -->
<!-- student        連向student之網頁(單一筆資料) -->


<body>
    <div style="width:500px; position:absolute; top:8%; left:51%; margin:0px 0 0 -320px; border:3px">
	  <h1 style="color:grey; text-align: center"></h1><!-- 可以放文字 -->
    </div>
	<!-- <hr> -->
	<!-- 背景圖 -->
	<body background="images/home_slider_2.jpg">
	
	<table border="1" style="margin: 0px auto;">
	
			<div align="center" style="width:320px; position:absolute; top:38%; left:88%; margin:-150px 0 0 -300px; border:3px">
			  <p>登入或註冊請點擊下方google帳號登入鈕</p>
			  <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"  id="test"></div>
			  <BR>
			</div>
		
	</table>
	
	
 
      
           
</body>
</html>