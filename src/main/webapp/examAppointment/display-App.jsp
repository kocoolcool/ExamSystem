<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<title>display-App</title>
</head>
<script>
function f1(){
	
// 	alert("Thank you for your appointmnet," + 
// 			"your appointment was successful,"	+	
// 			"we would inform you of approval result soon via e-mail")
}

</script>

<body>

<h3>Select Appointment Table Result : ${fn:length(select)} row(s) selected</h3>
<c:if test="${not empty select}">
<table>
	<thead>
	<tr>
		<th>Studentid</th>
		<th>Examid</th>
		<th>Applicationdate</th>
		<th>StatusCFM</th>
		<th>Score</th>
	</tr>
	</thead>
	<tbody>
	
	<c:forEach var="row" items="${select}">
		<c:url value="/examAppointment/Appointment.jsp" var="path">
			<c:param name="studentid" value="${row.studentid}" />
			<c:param name="examid" value="${row.examid}" />
			<c:param name="applicationdate" value="${row.applicationdate}" />
			<c:param name="statusCFM" value="${row.statusCFM}" />
			<c:param name="score" value="${row.score}" />
		</c:url>
	<tr>
		<td><a href="${path}">${row.studentid}</a></td>
		<td>${row.examid}</td>
		<td>${row.applicationdate}</td>
		<td>${row.statusCFM}</td>
		<td>${row.score}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</c:if>
<!-- <input type="button" value="Confirm" onclick="f1()"> -->

<h3><a href="<c:url value="/examAppointment/Appointment.jsp" />">Appointment Management System</a></h3>

 <a  href="/ExamSystem/index.jsp">Home</a>
</body>
</html>