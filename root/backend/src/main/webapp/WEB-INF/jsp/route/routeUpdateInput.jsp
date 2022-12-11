<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

 <div class="container mt-3">
	<div class="shadow-lg">
		<h1>路線変更</h1>
		<form:form  modelAttribute="routeForm">	
		<!-- エラーメッセージ -->
		<form:errors class="error"  path="departureStationName" element="p"/>
		<form:errors class="error" path="scheduledDepartureTime" element="p"/>
		<form:errors class="error" path="arrivalStationName" element="p"/>
		<form:errors class="error" path="scheduledArrivalTime" element="p"/>
		<form:errors class="error" path="numberPlate" element="p"/>
		<form:errors class="error" path="price" element="p"/>
		<form:errors class="error" path="operationStartDate" element="p"/>
		<form:errors class="error" path="operationEndDate" element="p"/>
		
		<!-- エラーメッセージ終わり-->
			<div class="row g-3">
				<div class="col-md-5">
			  	 	<label for="departureId" class="form-label"><spring:message code="routeForm.departureId"/>:</label> 
			   		<form:select class="form-control" path="departureId">
			   				<form:option value="${routeInfo.departureId}" label="${routeInfo.departureStationName}"/>
			   		 		<form:options items="${busStationList}" itemValue="busStationId" itemLabel="busStationName" />
			   		 </form:select>
			 	</div>
		 		<div class="col-md-5">
			   		<label for="scheduledDepartureTime" class="form-label"><spring:message code="routeForm.scheduledDepartureTime"/>:</label>
			   		<fmt:formatDate value="${routeInfo.scheduledDepartureTime}" pattern="HH:mm" var="scheduledDepartureTime"/>
			   		<form:input path="scheduledDepartureTime" class="form-control" value="${scheduledDepartureTime}"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-5">
					<label for="arrivalStationName" class="form-label"><spring:message code="routeForm.arrivalId"/>:</label> 
				   	 <form:select class="form-control" path="arrivalId">
				   	 		<form:option value="${routeInfo.arrivalId}" label="${routeInfo.arrivalStationName}"/>
			   		 		<form:options items="${busStationList}" itemValue="busStationId" itemLabel="busStationName" />
			   		 </form:select>
			 	</div>
			 	<div class="col-md-5">
				 		<fmt:formatDate value="${routeInfo.scheduledArrivalTime}" pattern="HH:mm" var="scheduledArrivalTime"/>
				   		<label for="scheduledArrivalTime" class="form-label"><spring:message code="routeForm.scheduledArrivalTime"/>:</label>
				   		<form:input path="scheduledArrivalTime" class="form-control" value="${scheduledArrivalTime}"/>
				 </div>
		 	</div>			 	
	 		<div class="row g-3">
		 		<div class="col-md-5">
			   		<label for="numberPlate" class="form-label"><spring:message code="routeForm.busId"/>:</label>
			   		<form:select class="form-control" path="busId">
			   		 		<c:set value="${numberPlate}" var="numberPlate"/>
			   		 		<form:option value="${routeInfo.busId}" label="${numberPlate}"/>
			   		 		<form:options items="${busList}" itemValue="busId" itemLabel="numberPlate"/>
			   		 </form:select>
			 	</div>
			 	<div class="col-md-5">
			   		<label for="price" class="form-label"><spring:message code="routeForm.price"/>(円):</label>
			   		<form:input path="price" class="form-control" value="${routeInfo.price}"/>
			 	</div>
			   		
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-5">
			 		<fmt:formatDate value="${routeInfo.operationStartDate}" pattern="yyyy-MM-dd" var="operationStartDate"/>
			   		<label for="operationStartDate" class="form-label"><spring:message code="routeForm.operationStartDate"/>:</label>
			   		<form:input type="text"  path="operationStartDate" class="form-control" value="${operationStartDate}"/>
			 	</div>
			 	<div class="col-md-5">
			 		<fmt:formatDate value="${routeInfo.operationEndDate}" pattern="yyyy-MM-dd" var="operationEndDate"/>
			   		<label for="operationEndDate" class="form-label"><spring:message code="routeForm.operationEndDate"/>:</label>
			   		<form:input type="text"  path="operationEndDate" class="form-control" value="${operationEndDate}"/>
			 	</div>
	 		</div>
	 		<input type="hidden" name="routeId" value="${routeInfo.routeId }"/>
		 	<input type="submit" class="btn btn-primary ms-5" value="変更" formaction="/routeUpdate/confirm"/>
		 	<input  type="submit" class="btn btn-dark" value="戻る" formaction="/routeList/index"/>
		 	
		</form:form>
	</div>
</div> 
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

