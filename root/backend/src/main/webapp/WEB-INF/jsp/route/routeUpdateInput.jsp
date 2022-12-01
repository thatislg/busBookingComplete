<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

 <div class="container mt-3">
	<div class="shadow-lg">
		<h1>路線変更</h1>
		<form:form  modelAttribute="routeInfo">	
		<!-- Thông báo lỗi  -->
		<form:errors class="error"  path="departureId" element="p"/>
		<form:errors class="error" path="scheduledDepartureTime" element="p"/>
		<form:errors class="error" path="arrivalId" element="p"/>
		<form:errors class="error" path="scheduledArrivalTime" element="p"/>
		<form:errors class="error" path="busId" element="p"/>
		<form:errors class="error" path="price" element="p"/>
		<form:errors class="error" path="operationStartDate" element="p"/>
		<form:errors class="error" path="operationEndDate" element="p"/>
		
		<!-- Hết phần thông báo lỗi -->
		
			<div class="row g-3">
				<div class="col-md-5">
			  	 	<label for="departureId" class="form-label"><spring:message code="routeForm.departureId"/>:</label>
			  	 	<!--
			   		<form:input path="departureId" class="form-control" placeholder="${routeInfo.departureId}"/>
			   		  -->
			   		<form:select path="departureId" onmousedown="if(this.options.length>10){this.size=10;}"  onchange='this.size=0;' onblur="this.size=0;" >
			   		 		<option value="none" selected disabled hidden="true">出発停留所を選択してください。</option>
			   		 		<form:options items="${departureStationList}" itemValue="busStationId" itemLabel="busStationName"/>
			   		 </form:select>
			 	</div>
		 		<div class="col-md-5">
			   		<label for="scheduledDepartureTime" class="form-label"><spring:message code="routeForm.scheduledDepartureTime"/>:</label>
			   		<fmt:formatDate value="${routeInfo.scheduledDepartureTime}" pattern="yyyy-MM-dd HH:mm:ss" var="sDTime"/>
			   		<form:input path="scheduledDepartureTime" class="form-control" value="${sDTime}"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-5">
					<label for="arrivalId" class="form-label"><spring:message code="routeForm.arrivalId"/>:</label>
					<!-- 
				   	<form:input path="arrivalId" class="form-control" value="${routeInfo.arrivalId}"/>
				     -->
				   	 <form:select path="arrivalId" onmousedown="if(this.options.length>10){this.size=10;}"  onchange='this.size=0;' onblur="this.size=0;">
			   		 		<option value="none" selected disabled hidden="true">到着停留所を選択してください。</option>
			   		 		<form:options items="${arrivalStationList}" itemValue="busStationId" itemLabel="busStationName"/>
			   		 </form:select>
			 	</div>
			 	<div class="col-md-5">
				 		<fmt:formatDate value="${routeInfo.scheduledArrivalTime}" pattern="yyyy-MM-dd HH:mm:ss" var="sATime"/>
				   		<label for="scheduledArrivalTime" class="form-label"><spring:message code="routeForm.scheduledArrivalTime"/>:</label>
				   		<form:input path="scheduledArrivalTime" class="form-control" placeholder="${sATime}"/>
				 </div>
		 	</div>			 	
	 		<div class="row g-3">
		 		<div class="col-md-5">
			   		<label for="busId" class="form-label"><spring:message code="routeForm.busId"/>:</label>
			   		<!-- 
			   		<form:input path="busId" class="form-control" value="${routeInfo.busId}"/>
			   		 -->
			   		<form:select path="busId" onmousedown="if(this.options.length>10){this.size=10;}"  onchange='this.size=0;' onblur="this.size=0;">
			   		 		<option value="none" selected disabled hidden="true">バスIDを選択してください。</option>
			   		 		<form:options items="${busList}" itemValue="busId" itemLabel="busId"/>
			   		 </form:select>
			 	</div>
			 	<div class="col-md-5">
			   		<label for="price" class="form-label"><spring:message code="routeForm.price"/>:</label>
			   		<form:input path="price" class="form-control" placeholder="${routeInfo.price}"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-5">
			 		<fmt:formatDate value="${routeInfo.operationStartDate}" pattern="yyyy-MM-dd" var="oSDate"/>
			   		<label for="operationStartDate" class="form-label"><spring:message code="routeForm.operationStartDate"/>:</label>
			   		<form:input path="operationStartDate" class="form-control" placeholder="${oSDate}"/>
			 	</div>
			 	<div class="col-md-5">
			 		<fmt:formatDate value="${routeInfo.operationEndDate}" pattern="yyyy-MM-dd" var="oEDate"/>
			   		<label for="operationEndDate" class="form-label"><spring:message code="routeForm.operationEndDate"/>:</label>
			   		<form:input path="operationEndDate" class="form-control" placeholder="${oEDate}"/>
			 	</div>
	 		</div>
		 	<input type="submit" class="btn btn-primary ms-5" value="変更" formaction="confirm?routeId=${routeInfo.routeId}"/>
		 	<input  type="submit" class="btn btn-dark" value="戻る" formaction="/routeList/index"/>
		</form:form>
	</div>
</div> 
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

