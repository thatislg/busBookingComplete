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
		<h1>路線削除確認</h1>
			<div class="row g-3">
				<div class="col-md-4">
			  	 	<spring:message code="routeForm.departureId"/>:<c:out value="${routeInfo.departureId}"/>
			 	</div>
		 		<div class="col-md-4">
			   		<fmt:formatDate value="${routeInfo.scheduledDepartureTime}" pattern="yyyy-mm-dd HH:mm" var="sDTime"/>
			   		<spring:message code="routeForm.scheduledDepartureTime"/>:<c:out value="${sDTime}"/>			   		
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
					<spring:message code="routeForm.arrivalId"/>:<c:out value="${routeInfo.arrivalId}"/>
			 	</div>
			 	<div class="col-md-4">
				   	<fmt:formatDate value="${routeInfo.scheduledArrivalTime}" pattern="yyyy-mm-dd HH:mm" var="sATime"/>	
				   	<spring:message code="routeForm.scheduledArrivalTime"/>:<c:out value="${sATime}"/>
				 </div>
		 	</div>			 	
	 		<div class="mb-3 mt-3">
		   			<spring:message code="routeForm.busId"/>:<c:out value="${routeInfo.busId}"/>		   		
		 	</div>
		 	<div class="mb-3 mt-3">
		 			<spring:message code="routeForm.price"/>:<c:out value="${routeInfo.price}"/>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<spring:message code="routeForm.operationStartDate"/>:<fmt:formatDate value="${routeInfo.operationStartDate}" pattern="yyyy年MM月dd日"/>
			 	</div>
			 	<div class="col-md-4">
			   		<spring:message code="routeForm.operationEndDate"/>:<fmt:formatDate value="${routeInfo.operationEndDate}" pattern="yyyy年MM月dd日"/>
			 	</div>
	 		</div>
		 	<form>
			 	<input type="hidden" name="routeId" value="${routeInfo.routeId}">
			 	<input class="btn btn-primary" type="submit" value="ＯＫ" formaction="/routeDelete/delete">
			 &nbsp;
				<input class="btn btn-primary" type="submit" value="戻る" formaction="/routeList/index">
			</form>
	</div>
</div> 

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>