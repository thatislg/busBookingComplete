<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
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
		<h1>路線登録確認</h1>
			<div class="row g-3">
				<div class="col-md-4">
			  	 	<spring:message code="routeForm.departureId"/>:<c:out value="${routeForm.departureId}"/>
			 	</div>
		 		<div class="col-md-4">
		 			<fmt:formatDate value="${routeForm.scheduledDepartureTime}" pattern="yyyy-mm-dd HH:mm" var="sDTime"/>
			   		<spring:message code="routeForm.scheduledDepartureTime"/>:<c:out value="${sDTime}"/>			   		
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
					<spring:message code="routeForm.arrivalId"/>:<c:out value="${routeForm.arrivalId}"/>
			 	</div>
			 	<div class="col-md-4">
			 		<fmt:formatDate value="${routeForm.scheduledArrivalTime}" pattern="yyyy-mm-dd HH:mm" var="sATime"/>	
				   	<spring:message code="routeForm.scheduledArrivalTime"/>:<c:out value="${sATime}"/>
				 </div>
		 	</div>			 	
	 		<div class="mb-3 mt-3">
		   			<spring:message code="routeForm.busId"/>:<c:out value="${routeForm.busId}"/>		   		
		 	</div>
		 	<div class="mb-3 mt-3">
		 			<spring:message code="routeForm.price"/>:<c:out value="${routeForm.price}"/>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<spring:message code="routeForm.operationStartDate"/>:<fmt:formatDate value="${routeForm.operationStartDate}" pattern="yyyy年MM月dd日"/>
			 	</div>
			 	<div class="col-md-4">
			   		<spring:message code="routeForm.operationEndDate"/>:<fmt:formatDate value="${routeForm.operationEndDate}" pattern="yyyy年MM月dd日"/>
			 	</div>
	 		</div>
		 	<form:form modelAttribute="routeForm">
				<form:hidden path="departureId"/>
				<form:hidden path="arrivalId"/>
				<form:hidden path="busId"/>
				<form:hidden path="price"/>
				<form:hidden path="operationStartDate"/>
				<form:hidden path="operationEndDate"/>
				<form:hidden path="scheduledDepartureTime"/>
				<form:hidden path="scheduledArrivalTime"/>
				<input class="btn btn-primary" type="submit" value="ＯＫ" formaction="/routeInsert/insert">
				<input class="btn btn-primary" type="submit" value="戻る" formaction="/routeInsert/input">
			</form:form>
	</div>
</div> 

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
