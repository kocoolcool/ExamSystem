<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>註冊或登入</title>
</head>



<body>


	<h1 style="text-align: center">註冊或登入</h1>
	<hr>
	<table border="1" style="margin: 0px auto;">


		<tr height="52" bgcolor="lightblue" align="center">
			<p align="center">
				首次註冊請選擇註冊按鈕<BR>會員請採用google登入
			</p>
			<hr>
			<td width="350"><p align="center" /><a href='register1'>註冊成會員</a><BR></td>
		</tr>


		<tr height="52" align="center">
<!-- 			我把google登入鈕的樣式改成一般的"登入"文字去顯示  實際上它做的還是google登入的流程<td width="350" class="g-signin2" data-onsuccess="onSignIn"data-theme="dark" onclick="go()"> -->
<!-- 			<td width="350" class="g-signin2" data-onsuccess="onSignIn"data-theme="dark" onclick="go()"> -->
			<td width="350" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">
<!-- 			    無反應的按鈕問題在何處??<input type="button" value="登入" data-onsuccess="onSignIn" data-theme="dark" onclick="go()"><BR> -->
			</td>
		</tr>
	</table>





	<a href='/ExamSystem' class="btn btn-default"> <span
		class="glyphicon-hand-left glyphicon"></span>到首頁
	</a>
	
	
	
	
	
	
	
	<!--把登出註解一下<a href="#" onclick="signOut();">Sign out</a> -->
	<script>
		var profile = null;
		var id_token = null;
		function onSignIn(googleUser) {
			// 客户端如果有需要的话可以通过profile来获取用户信息
			profile = googleUser.getBasicProfile();
			// 传回后台验证，并获取userid
			id_token = googleUser.getAuthResponse().id_token;
			//console.log("ID Token: " + id_token);	
		};

		function go() {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "http://localhost:8080/ExamSystem/googleVerify");
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.onload = function() {
				//           console.log('Signed in as: ' + xhr.responseText);
			};
			xhr.send('idtokenstr=' + id_token);
			//   	    location.href= "http://localhost:8080/ExamSystem/";
		};

		//把登出註解一下      
// 		      function signOut() {
// 		    	    var auth2 = gapi.auth2.getAuthInstance();
// 		    	    auth2.signOut().then(function () {
// 		    	      console.log('User signed out.');
// 		    	    });
// 		    	  }
		//把登出註解一下
	</script>
</body>


</html>