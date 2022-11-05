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
			  	 	<spring:message code="routeForm.departureId"/>: <c:out value="${routeInfo1.departureStationName}"/>
			 	</div>
		 		<div class="col-md-4">
			   		<fmt:formatDate value="${routeInfo.scheduledDepartureTime}" pattern="yyyy-mm-dd HH:mm" var="sDTime"/>
			   		<spring:message code="routeForm.scheduledDepartureTime"/>: <c:out value="${sDTime}"/>			   		
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
					<spring:message code="routeForm.arrivalId"/>: <c:out value="${routeInfo1.arrivalStationName}"/>
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
			 	<input class="btn btn-dark" type="submit" value="ＯＫ" formaction="/routeDelete/delete">
			 &nbsp;
				<input class="btn btn-dark" type="submit" value="戻る" formaction="/routeList/index">
			</form>
	</div>
</div> 

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>