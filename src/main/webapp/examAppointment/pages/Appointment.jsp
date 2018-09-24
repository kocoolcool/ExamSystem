<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/main.css" />

<title>Appointment</title>
<script type="text/javascript">
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
}
</script>
</head>
<body>

<h3>Welcome ${user.email}</h3>

<h3>Appointment Table</h3>

<form action="<c:url value="appointment" />" method="POST">
<table>
	<tr>
		<td>Studentid : </td>
		<td><input type="text" name="studentid" value="${param.studentid}"></td>
		<td><span class="error">${errors.studentid}</span></td>
	</tr>
	<tr>
		<td>Examid : </td>
		<td><input type="text" name="examid" value="${param.examid}"></td>
		<td></td>
	</tr>

	<tr>
		<td>Applicationdate : </td>
		<td><input type="text" name="applicationdate" value="${param.applicationdate}"></td>
		<td><span class="error">${errors.applicationdate}</span></td>
	</tr>
	<tr>
		<td>StatusCFM : </td>
		<td><input type="text" name="statusCFM" value="${param.statusCFM}"></td>
		<td><span class="error">${errors.statusCFM}</span></td>
	</tr>
	<tr>
		<td>Score : </td>
		<td><input type="text" name="score" value="${param.score}"></td>
		<td><span class="error">${errors.score}</span></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="appointment" value="Insert">
			<input type="submit" name="appointment" value="Update">
		</td>
		<td>
			<input type="submit" name="appointment" value="Delete">
			<input type="submit" name="appointment" value="Select">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>

</form>

<h3><span class="error">${errors.action}</span></h3>

<c:if test="${not empty delete}">
<h3>Delete Appointment Table Success : ${delete} row deleted</h3>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty insert}">
<h3>Insert Appointment Table Success</h3>
<table border="1">
	<tr><td>Studentid</td><td>${insert.studentid}</td></tr>
	<tr><td>Examid</td><td>${insert.examid}</td></tr>
	<tr><td>Applicationdate</td><td>${insert.applicationdate}</td></tr>
	<tr><td>StatusCFM</td><td>${insert.statusCFM}</td></tr>
	<tr><td>Score</td><td>${insert.score}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty update}">
<h3>Update Appointment Table Success</h3>
<table border="1">
	<tr><td>Studentid</td><td>${update.studentid}</td></tr>
	<tr><td>Examid</td><td>${update.examid}</td></tr>
	<tr><td>Applicationdate</td><td>${update.applicationdate}</td></tr>
	<tr><td>StatusCFM</td><td>${update.statusCFM}</td></tr>
	<tr><td>Score</td><td>${update.score}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

  <a  href="/ExamSystem/index.jsp">Home</a>
</body>
</html>