<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
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

.form {
	background-color: #F7F7F7;
	padding: 46px 39px 45px;
	margin: 0 auto 30px;
	margin-top: 55px;
	border-radius: 60px;
	border: solid 2px;
}
.g-3 {
	margin-top: 5px;
	margin-bottom: 20px;
}
</style>
<div class="container mt-3">
	<div class="form">
		<h1>バス削除確認</h1>
		<div>
			<div class="mb-3 mt-3">
				<spring:message code="busForm.rowNum"/>:<c:out value="${busInfo.rowNum}"/>
			</div>
			<div class="mb-3">	
				<spring:message code="busForm.columnNum"/>:<c:out value="${busInfo.columnNum}"/>
			</div>
			<div class="row g-2">
		 		<div class="col-md-4">
					<spring:message code="busForm.numberPlace"/>:<c:out value="${busInfo.numberPlace}"/>
				</div>
				<div class="col-md-4">
					<spring:message code="busForm.numberDivision"/>:<c:out value="${busInfo.numberDivision}"/>
				</div>
			</div>
			<div class="row g-3">
				<div class="col-md-4">
					<spring:message code="busForm.numberKana"/>:<c:out value="${busInfo.numberKana}"/>
				</div>
				<div class="col-md-4">
					<spring:message code="busForm.numberFirstHalf"/>:<c:out value="${busInfo.numberFirstHalf}"/>
				</div>
				<div class="col-md-4">
					<spring:message code="busForm.numberLatterHalf"/>:<c:out value="${busInfo.numberLatterHalf}"/>
				</div>	
			</div>
			<form>
			 	<input type="hidden" name="busId" value="${busInfo.busId}">
				<input class="btn btn-primary" type="submit" value="ＯＫ" formaction="/busDelete/delete">
	 			&nbsp;
	 			<input class="btn btn-primary" type="submit" value="戻る" formaction="/busList/index">	
			</form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>