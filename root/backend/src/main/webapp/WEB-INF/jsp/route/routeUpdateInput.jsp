<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

 <div class="container mt-3">
	<div class="shadow-lg">
		<h1>路線変更</h1>
		<form:form  modelAttribute="routeInfo">	
			<div class="row g-3">
				<div class="col-md-4">
			 		<form:errors path="departureId" element="p"/>
			  	 	<label for="departureId" class="form-label"><spring:message code="routeForm.departureId"/>:</label>
			   		<form:input path="departureId" class="form-control" placeholder="${routeInfo.departureId}"/>
			 	</div>
		 		<div class="col-md-4">
			 		<form:errors path="scheduledDepartureTime" element="p"/>
			   		<label for="scheduledDepartureTime" class="form-label"><spring:message code="routeForm.scheduledDepartureTime"/>:</label>
			   		<fmt:formatDate value="${routeInfo.scheduledDepartureTime}" pattern="yyyy-MM-dd HH:mm:ss" var="sDTime"/>
			   		<form:input path="scheduledDepartureTime" class="form-control" value="${sDTime}"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<form:errors path="arrivalId" element="p"/>
					<label for="arrivalId" class="form-label"><spring:message code="routeForm.arrivalId"/>:</label>
				   	<form:input path="arrivalId" class="form-control" value="${routeInfo.arrivalId}"/>
			 	</div>
			 	<div class="col-md-4">
				 		<form:errors path="scheduledArrivalTime" element="p"/>
				 		<fmt:formatDate value="${routeInfo.scheduledArrivalTime}" pattern="yyyy-MM-dd HH:mm:ss" var="sATime"/>
				   		<label for="scheduledArrivalTime" class="form-label"><spring:message code="routeForm.scheduledArrivalTime"/>:</label>
				   		<form:input path="scheduledArrivalTime" class="form-control" value="${sATime}"/>
				 </div>
		 	</div>			 	
	 		<div class="mb-3 mt-3">
		 		<form:errors path="busId" element="p"/>
		   		<label for="busId" class="form-label"><spring:message code="routeForm.busId"/>:</label>
		   		<form:input path="busId" class="form-control" value="${routeInfo.busId}"/>
		 	</div>
		 	<div class="mb-3 mt-3">
		 		<form:errors path="price" element="p"/>
		   		<label for="price" class="form-label"><spring:message code="routeForm.price"/>:</label>
		   		<form:input path="price" class="form-control" value="${routeInfo.price}"/>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<form:errors path="operationStartDate" element="p"/>
			 		<fmt:formatDate value="${routeInfo.operationStartDate}" pattern="yyyy-MM-dd" var="oSDate"/>
			   		<label for="operationStartDate" class="form-label"><spring:message code="routeForm.operationStartDate"/>:</label>
			   		<form:input path="operationStartDate" class="form-control" value="${oSDate}"/>
			 	</div>
			 	<div class="col-md-4">
			 		<form:errors path="operationEndDate" element="p"/>
			 		<fmt:formatDate value="${routeInfo.operationEndDate}" pattern="yyyy-MM-dd" var="oEDate"/>
			   		<label for="operationEndDate" class="form-label"><spring:message code="routeForm.operationEndDate"/>:</label>
			   		<form:input path="operationEndDate" class="form-control" value="${oEDate}"/>
			 	</div>
	 		</div>
		 	<input type="submit" class="btn btn-dark" value="変更" formaction="confirm?routeId=${routeInfo.routeId}"/>
		 	<input  type="submit" class="btn btn-dark" value="戻る" formaction="/routeList/index"/>
		</form:form>
	</div>
</div> 
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

