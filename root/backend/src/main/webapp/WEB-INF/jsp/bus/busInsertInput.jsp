<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

 <div class="container mt-3">
	<div class="shadow-lg">
		<h1>バス登録</h1>
		<form:form  modelAttribute="busForm">
		<!-- Hiển thị lỗi nếu có -->
			<div class="error">
				<form:errors path="rowNum" element="p"/>
				<form:errors path="columnNum" element="p"/>
				<form:errors path="numberPlace" element="p"/>
				<form:errors path="numberDivision" element="p"/>
				<form:errors path="numberKana" element="p"/>
				<form:errors path="numberFirstHalf" element="p"/>
				<form:errors path="numberLatterHalf" element="p"/>
			</div>	
		<!-- Kết thúc hiển thị lỗi -->
		
			<div class="row g-3">
				<div class="col-md-4">
			  	 	<label for="rowNum" class="form-label"><spring:message code="busForm.rowNum"/>:</label>
			   		<form:input path="rowNum" class="form-control" placeholder="１列あたりシート数を入力"/>
			 	</div>
			 	<div class="col-md-4">
					<label for="columnNum" class="form-label"><spring:message code="busForm.columnNum"/>:</label>
				   	<form:input path="columnNum" class="form-control" placeholder="シート列数を入力"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
				  	<label for="numberPlace" class="form-label"><spring:message code="busForm.numberPlace"/>:</label>
				   	<form:input path="numberPlace" class="form-control" placeholder="地名番号を入力" />
			 	</div>
			 	<div class="col-md-4">
			   		<label for="numberDivision" class="form-label"><spring:message code="busForm.numberDivision"/>:</label>
			   		<form:input path="numberDivision" class="form-control" placeholder="分類番号を入力"/>
			 	</div>
			 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			   		<label for="numberKana" class="form-label"><spring:message code="busForm.numberKana"/>:</label>
			   		<form:input path="numberKana" class="form-control" placeholder="ひらがな一文字を入力"/>
			 	</div>
			 	<div class="col-md-4">
			   		<label for="numberFirstHalf" class="form-label"><spring:message code="busForm.numberFirstHalf"/>:</label>
			   		<form:input path="numberFirstHalf" class="form-control" placeholder="一連指定番号前半を入力"/>
			 	</div>
			 	<div class="col-md-4">
			   		<label for="numberLatterHalf" class="form-label"><spring:message code="busForm.numberLatterHalf"/>:</label>
			   		<form:input path="numberLatterHalf" class="form-control" placeholder="一連指定番号後半を入力"/>
			 	</div>
		 	</div>
		 	<input class="btn btn-primary" type="submit" value="登録" formaction="confirm"/> <input class="btn btn-primary" type="submit" value="戻る" formaction="/busList/index"/>
		</form:form>
	</div>
</div> 

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

