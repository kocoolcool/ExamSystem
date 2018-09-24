<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>Products</title>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">書籍資料維護</h1>
		</div>
	</section>
	<hr width='3'>
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="studentBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<legend>
					<spring:message code='spring.addProduct.form.addProductData.label' />
				</legend>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for='title'>
						<spring:message code='spring.addProduct.form.title.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="title" path="studentName" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for='author'>
						<spring:message code='spring.addProduct.form.author.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="author" path="gender" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for='author'>
						<spring:message code='spring.addProduct.form.author.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="author" path="address" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for='author'>
						<spring:message code='spring.addProduct.form.author.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="author" path="phone" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for='author'>
						<spring:message code='spring.addProduct.form.author.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="author" path="email" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for='author'>
						<spring:message code='spring.addProduct.form.author.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="author" path="education" type='text'
							class='form:input-large' />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for='author'>
						<spring:message code='spring.addProduct.form.author.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="author" path="salary" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				
				
				
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						<spring:message code='spring.addProduct.form.category.label' />
					</label>
					<div class='col-lg-10'>
						<form:select path="category">
							<form:option value="-1" label="請挑選" />
							<form:options items="${categoryList}" />
						</form:select>
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						<spring:message code='spring.addProduct.form.category.label' />
					</label>
					<div class='col-lg-10'>
						<form:select path="category">
							<form:option value="-1" label="請挑選" />
							<form:options items="${categoryList}" />
						</form:select>
					</div>
				</div>
				<!--測試用的庫存輸入欄
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="stock">
						庫存 </label>
					<div class='col-lg-10'>
						<form:input id="stock" path="category" type="text"
						 class='form:input-large' />							
					</div>
				</div>-->


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						<spring:message code='spring.addProduct.form.price.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="price" path="price" type='text'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="bookNo">
						<spring:message code='spring.addProduct.form.bookNo.label' />
					</label>
					<div class='col-lg-10'>
						<form:input id="bookNo" path="bookNo" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="companyId">
						<spring:message code='spring.addProduct.form.bookCompany.label' />
					</label>
					<div class='col-lg-10'>
						<form:select path="companyId">
							<form:option value="-1" label="請挑選" />
							<form:options items="${companyList}" />
						</form:select>
					</div>
				</div>

				<!-- lab09  測試傳入某些欄位的更改值-->
				<!-- 				<div class="form-group"> -->
				<!-- 					<label class='control-label col-lg-2 col-lg-2' for="stock"> -->
				<!-- 					     庫存</label> -->
				<!-- 					<div class='col-lg-10'> -->
				<%-- 					     <form:input id="stock" path="stock" type='text' --%>
				<%-- 					          class='form:input-large' /> --%>
				<!-- 					</div> -->
				<!-- 				</div> -->


				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="<spring:message code='spring.addProduct.form.submit.label' />" />
					</div>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						<spring:message code='spring.addProduct.form.image.label' />
					</label>
					<form:input id="productImage" path="productImage" type='file'
						class='form:input-large' />
				</div>


			</fieldset>
		</form:form>
	</section>
</body>
</html>