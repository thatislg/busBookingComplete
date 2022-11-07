<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

<div class="container mt-3">
	<div class="shadow-lg">
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
	 		<div class="row g-3">
		 		<div class="col-md-4">
			   			<spring:message code="routeForm.busId"/>:<c:out value="${routeForm.busId}"/>		   		
			 	</div>
			 	<div class="col-md-4">
			 			<spring:message code="routeForm.price"/>:<c:out value="${routeForm.price}"/>
			 	</div>
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
				<input class="btn btn-primary ms-5" type="submit" value="ＯＫ" formaction="/routeInsert/insert">
				<input class="btn btn-dark" type="submit" value="戻る" formaction="/routeInsert/input">
			</form:form>
	</div>
</div> 

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
