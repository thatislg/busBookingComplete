<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<link rel="stylesheet" type="text/css" href="/backend/src/main/webapp/WEB-INF/jsp/busLayout.css" />

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
h1 {
	font-size: 30px;
	font-family: "Impact";
	font-weight: 200;
	text-align: center;
}

.container {
	width: 1100px;
}

.g-3 {
	margin-top: 5px;
	margin-bottom: 20px;
}

.form {
	background-color: #F7F7F7;
	padding: 46px 39px 45px;
	margin: 0 auto 30px;
	margin-top: 55px;
	border-radius: 60px;
	border: solid 2px;
}
</style>
 <div class="container mt-3">
	<div class="form">
		<h1>バス登録</h1>
		<form:form  modelAttribute="busForm">	
			<div class="mb-3 mt-3">
		 		<form:errors path="rowNum" element="p"/>
		  	 	<label for="rowNum" class="form-label"><spring:message code="busForm.rowNum"/>:</label>
		   		<form:input path="rowNum" class="form-control" placeholder="１列あたりシート数を入力"/>
		 	</div>
		 	<div class="mb-3">
		 		<form:errors path="columnNum" element="p"/>
				<label for="columnNum" class="form-label"><spring:message code="busForm.columnNum"/>:</label>
			   	<form:input path="columnNum" class="form-control" placeholder="シート列数を入力"/>
		 	</div>
		 	<div class="row g-2">
			 	<div class="col-md-4">
			 		<form:errors path="numberPlace" element="p"/>
				  	<label for="numberPlace" class="form-label"><spring:message code="busForm.numberPlace"/>:</label>
				   	<form:input path="numberPlace" class="form-control" placeholder="地名番号を入力" />
			 	</div>
			 	<div class="col-md-4">
			 		<form:errors path="numberDivision" element="p"/>
			   		<label for="numberDivision" class="form-label"><spring:message code="busForm.numberDivision"/>:</label>
			   		<form:input path="numberDivision" class="form-control" placeholder="分類番号を入力"/>
			 	</div>
			 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<form:errors path="numberKana" element="p"/>
			   		<label for="numberKana" class="form-label"><spring:message code="busForm.numberKana"/>:</label>
			   		<form:input path="numberKana" class="form-control" placeholder="ひらがな一文字を入力"/>
			 	</div>
			 	<div class="col-md-4">
			 		<form:errors path="numberFirstHalf" element="p"/>
			   		<label for="numberFirstHalf" class="form-label"><spring:message code="busForm.numberFirstHalf"/>:</label>
			   		<form:input path="numberFirstHalf" class="form-control" placeholder="一連指定番号前半を入力"/>
			 	</div>
			 	<div class="col-md-4">
			 		<form:errors path="numberLatterHalf" element="p"/>
			   		<label for="numberLatterHalf" class="form-label"><spring:message code="busForm.numberLatterHalf"/>:</label>
			   		<form:input path="numberLatterHalf" class="form-control" placeholder="一連指定番号後半を入力"/>
			 	</div>
		 	</div>
		 	<input class="btn btn-primary" type="submit" value="登録" formaction="confirm"/> <input class="btn btn-primary" type="submit" value="戻る" formaction="/busList/index"/>
		</form:form>
	</div>
</div> 

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

