<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

 <div class="container mt-3">
	<div class="shadow-lg">
		<h1>路線登録</h1>
		<form:form  modelAttribute="routeForm">	
			<div class="row g-3">
				<div class="col-md-4">
			 		<form:errors path="departureId" element="p"/>
			  	 	<label for="departureId" class="form-label"><spring:message code="routeForm.departureId"/>:</label>
			   		<form:input path="departureId" class="form-control" placeholder="出発停留所を入力"/>
			 	</div>
		 		<div class="col-md-4">
			 		<form:errors path="scheduledDepartureTime" element="p"/>
			   		<label for="scheduledDepartureTime" class="form-label"><spring:message code="routeForm.scheduledDepartureTime"/>:</label>
			   		<form:input path="scheduledDepartureTime" class="form-control" placeholder="出発時刻を入力"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<form:errors path="arrivalId" element="p"/>
					<label for="arrivalId" class="form-label"><spring:message code="routeForm.arrivalId"/>:</label>
				   	<form:input path="arrivalId" class="form-control" placeholder="到着停留所を入力"/>
			 	</div>
			 	<div class="col-md-4">
				 		<form:errors path="scheduledArrivalTime" element="p"/>
				   		<label for="scheduledArrivalTime" class="form-label"><spring:message code="routeForm.scheduledArrivalTime"/>:</label>
				   		<form:input path="scheduledArrivalTime" class="form-control" placeholder="到着時刻を入力"/>
				 </div>
		 	</div>			 	
	 		<div class="row g-3">
		 		<div class="col-md-4">
			 		<form:errors path="busId" element="p"/>
			   		<label for="busId" class="form-label"><spring:message code="routeForm.busId"/>:</label>
			   		<form:input path="busId" class="form-control" placeholder="バスIDを入力"/>
			 	</div>
			 	<div class="col-md-4">
			 		<form:errors path="price" element="p"/>
			   		<label for="price" class="form-label"><spring:message code="routeForm.price"/>:</label>
			   		<form:input path="price" class="form-control" placeholder="料金を入力"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-4">
			 		<form:errors path="operationStartDate" element="p"/>
			   		<label for="operationStartDate" class="form-label"><spring:message code="routeForm.operationStartDate"/>:</label>
			   		<form:input path="operationStartDate" class="form-control" placeholder="運用開始日を入力"/>
			 	</div>
			 	<div class="col-md-4">
			 		<form:errors path="operationEndDate" element="p"/>
			   		<label for="operationEndDate" class="form-label"><spring:message code="routeForm.operationEndDate"/>:</label>
			   		<form:input path="operationEndDate" class="form-control" placeholder="運用終了日を入力"/>
			 	</div>
	 		</div>
		 	<input type="submit" class="btn btn-primary ms-5" value="登録" formaction="/routeInsert/confirm"/>
		 	<input  type="submit" class="btn btn-dark" value="戻る" formaction="/routeList/index"/>
		</form:form>
	</div>
</div> 
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

