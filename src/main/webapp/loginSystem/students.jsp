<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Students</title>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>學生清單</h1>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var='student' items='${students}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<img width='100' height='150'
							src="<c:url value='/getPicture/${student.studentId}' />" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${student.studentName}</b>
							</p>
							<p>${student.studentId}</p>
							<p>${student.gender}</p>
							<p>班級: ${student.thisIsClass}班</p>
							<p>
								<a href="<spring:url value='student?studentId=${student.studentId}'/>"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>詳細資料
								</a>
								
								
								 <a href="<spring:url value='student.xml?id=${student.studentId}'/>"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>XML
								</a>
								
								
								 <a href="<spring:url value='student.json?id=${student.studentId}'/>"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>JSON
								</a>
								
								
								 <a href="<spring:url value='updateStudent?studentId=${student.studentId}'/>"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>修改
								</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>


			<a href="<spring:url value='addStudent'/>" class="btn btn-primary">
				<span class="glyphicon-info-sigh glyphicon"></span>新增
			</a>

		</div>
	</section>
</body>
</html>
