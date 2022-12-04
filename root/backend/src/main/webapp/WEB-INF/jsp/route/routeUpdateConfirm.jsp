<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

<div class="container mt-3">
	<div class="shadow-lg">
		<h1>路線変更確認</h1>
			<div class="row g-3">
				<div class="col-md-4">
			  	 	<spring:message code="routeForm.departureStationName"/>:<c:out value="${routeForm.departureStationName}"/> 
			 	</div>
		 		<div class="col-md-4">
			   		<fmt:formatDate value="${routeForm.scheduledDepartureTime}" pattern="HH:mm" var="scheduledDepartureTime"/>
			   		<spring:message code="routeForm.scheduledDepartureTime"/>: <c:out value="${scheduledDepartureTime}"/>			   		
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
					<spring:message code="routeForm.arrivalStationName"/>: <c:out value="${routeForm.arrivalStationName}"/>
			 	</div>
			 	<div class="col-md-4">
				   	<fmt:formatDate value="${routeForm.scheduledArrivalTime}" pattern="HH:mm" var="scheduledArrivalTime"/>	
				   	<spring:message code="routeForm.scheduledArrivalTime"/>:<c:out value="${scheduledArrivalTime}"/>
				 </div>
		 	</div>			 	
	 		<div class="row g-3">
		 		<div class="col-md-4">
			   			<spring:message code="routeForm.numberPlate"/>:<c:out value="${routeForm.numberPlate}"/>		   		
			 	</div>
			 	<div class="col-md-4">
			 			<spring:message code="routeForm.price"/>(円):<c:out value="${routeForm.price}"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<spring:message code="routeForm.operationStartDate"/>:<fmt:formatDate value="${routeForm.operationStartDate}" pattern="yyyy年MM月dd日" var="operationStartDate"/>
			 		<c:out value="${operationStartDate}"/>
			 	</div>
			 	<div class="col-md-4">
			   		<spring:message code="routeForm.operationEndDate"/>:<fmt:formatDate value="${routeForm.operationEndDate}" pattern="yyyy年MM月dd日" var="operationEndDate"/>
			 		<c:out value="${operationEndDate}"/>
			 	</div>
	 		</div>
	 	<form:form modelAttribute="routeForm">
	 		<form:hidden path="routeId"/>
	 		<form:hidden path="arrivalId"/>
	 		<form:hidden path="departureId"/>
	 		<form:hidden path="price"/>
	 		<form:hidden path="busId"/>
	 		<form:hidden path="operationStartDate"/>
	 		<form:hidden path="operationEndDate"/>
	 		<form:hidden path="scheduledDepartureTime"/>
	 		<form:hidden path="scheduledArrivalTime"/>
	 		<input class="btn btn-primary ms-5" type="submit" value="変更" formaction="update"/>
			 &nbsp;
			<input class="btn btn-dark" type="submit" value="戻る" formaction="input"/>
	 	</form:form>
	</div>
</div> 

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>