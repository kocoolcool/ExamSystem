<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
		  <img width='100' height='150' 
		  src="<c:url value='/getPicture/${oneStudent.photo}' />" />
			<div class="col-md-5">
				<h3>${oneStudent.studentId}</h3>
				<p>班級: ${oneStudent.thisIsClass}</p>
				<p>姓名: ${oneStudent.studentName}</p>
<%-- 				<c:choose> --%>
<%-- 					<c:when test='${product.discount != 1.0 }'> --%>
<!-- 						<p> -->
<%-- 							折扣: ${product.discountStr} &nbsp;&nbsp; 實售: <font color='red'>${product.price*product.discount}元</font> --%>
<!-- 						</p> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<p>&nbsp;</p> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
				<p>性別: ${oneStudent.gender}</p>
				<p>電話: ${oneStudent.phone}</p>
<!-- 				<p> -->
<!-- 					<strong>地址: </strong> <span class='label label-warning'> -->
<%-- 						${product.address} </span> --%>
<!-- 				</p> -->
				<p>地址: ${oneStudent.address}</p>
				<p>信箱: ${oneStudent.email}</p>
				<p>身分判別: ${oneStudent.whichIdentity}</p>
				<p>生日: ${oneStudent.birthday}</p>
				<p>教育之程度: ${oneStudent.education}</p>
				<p>照片名稱: ${oneStudent.photoName}</p>
				<p>期望之薪資: ${oneStudent.salary}</p>
<%-- 				<p>電話: ${oneStudent.startWorkDay}</p> --%>
				<p>classId: ${oneStudent.classID}</p>			
				
				
				<p>
					<a href="<spring:url value='/selectStudents'/>" class="btn btn-default"> 
						<span class="glyphicon-hand-left glyphicon"></span>返回學生群資料
					</a>
					
					
			        </a> <a href='#' class='btn btn-warning btn-large'> <span
						class='glyphicon-shopping-cart glyphicon'></span> 目前為保留按鈕
					</a>
				</p>
			</div>
		</div>
	</section>
</body>
</html>
