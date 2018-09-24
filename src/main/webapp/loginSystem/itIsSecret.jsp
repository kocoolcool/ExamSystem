<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- 暫時沒用到    -->
<%-- <c:if test="${empty LoginOK}"> --%>
<%--   <c:set var="target" value="${requestScope['javax.servlet.forward.servlet_path']}"/> --%>
<%--   <c:redirect url="/loginnn" /> --%>
<%-- </c:if> --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>itIsSecret網頁</title>
</head>
<body>
<h1>通過學生身分的帳號(登入EEIT10102才能進來這個頁面</h1>
<div><a href="/ExamSystem/logouttt" ><b>登出</b></a></div>

</body>
</html>