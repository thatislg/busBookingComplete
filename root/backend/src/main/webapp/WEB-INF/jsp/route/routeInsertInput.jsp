<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

 <div class="container mt-3">
	<div class="shadow-lg">
		<h1>路線登録</h1>
		<form:form  modelAttribute="routeForm">	
			<!-- Thông báo lỗi  -->
			<form:errors class="error" path="departureId" element="p"/>
			<form:errors class="error"  path="scheduledDepartureTime" element="p"/>
			<form:errors class="error" path="arrivalId" element="p"/>
			<form:errors class="error" path="busId" element="p"/>
			<form:errors class="error" path="price" element="p"/>
			<form:errors class="error" path="operationStartDate" element="p"/>
			<form:errors class="error" path="operationEndDate" element="p"/>
			<form:errors class="error" path="scheduledArrivalTime" element="p"/>
			<!-- Hết phần thông báo lỗi -->
			
			<!-- Nội dung trang nhập thông tin tuyến đường -->
			<div class="row g-3">
				<div class="col-md-5">
			  	 	<label for="departureId" class="form-label"><spring:message code="routeForm.departureId"/>:</label>
			   			 <form:select path="departureId" class="form-control" onmousedown="if(this.options.length>10){this.size=10;}"  onchange='this.size=0;' onblur="this.size=0;" >
			   		 		<option value="none" selected disabled hidden="true">出発停留所選択🔽</option>
			   		 		<form:options items="${departureStationList}" itemValue="busStationId" itemLabel="busStationName"/>
			   		  	</form:select>

			 	</div>
		 		<div class="col-md-5">
			   		<label for="scheduledDepartureTime" class="form-label"><spring:message code="routeForm.scheduledDepartureTime"/>:</label>
			   		<form:input path="scheduledDepartureTime" class="form-control" placeholder="出発時刻を入力"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-5">
					<label for="arrivalId" class="form-label"><spring:message code="routeForm.arrivalId"/>:</label>
					 <form:select class="form-control" path="arrivalId" onmousedown="if(this.options.length>10){this.size=10;}"  onchange='this.size=0;' onblur="this.size=0;">
			   		 		<option value="none" selected disabled hidden="true">到着停留所選択🔽</option>
			   		 		<form:options items="${arrivalStationList}" itemValue="busStationId" itemLabel="busStationName"/>
			   		 </form:select>
			 	</div>
			 	<div class="col-md-5">
				   		<label for="scheduledArrivalTime" class="form-label"><spring:message code="routeForm.scheduledArrivalTime"/>:</label>
				   		<form:input path="scheduledArrivalTime" class="form-control" placeholder="到着時刻を入力"/>
				 </div>
		 	</div>			 	
	 		<div class="row g-3">
		 		<div class="col-md-5">
			   		<label for="busId" class="form-label"><spring:message code="routeForm.busId"/>:</label>
			   		<form:select path="numberPlate" class="form-control" onmousedown="if(this.options.length>10){this.size=10;}"  onchange='this.size=0;' onblur="this.size=0;">
			   		 		<option value="none" selected disabled hidden="true">バスのナンバープレート選択🔽</option>
			   		 		<form:options items="${busList}" itemValue="busId" itemLabel="numberPlate"/>
			   		 </form:select>
			 	</div>
			 	<div class="col-md-5">
			   		<label for="price" class="form-label"><spring:message code="routeForm.price"/>:</label>
			   		<form:input path="price" class="form-control" placeholder="料金を入力"/>
			 	</div>
		 	</div>
		 	<div class="row g-3">
			 	<div class="col-md-5">
			   		<label for="operationStartDate" class="form-label"><spring:message code="routeForm.operationStartDate"/>:</label>
			   		<form:input type="text" onfocus="(this.type='date')" path="operationStartDate" class="form-control" placeholder="例：12/31/2022"/>
			 	</div>
			 	<div class="col-md-5">
			   		<label for="operationEndDate" class="form-label"><spring:message code="routeForm.operationEndDate"/>:</label>
			   		<form:input type="text" onfocus="(this.type='date')" path="operationEndDate" class="form-control" placeholder="例：12/31/2022"/>
			 	</div>
	 		</div>
		 	<input type="submit" class="btn btn-primary ms-5" value="登録" formaction="/routeInsert/confirm"/>
		 	<input  type="submit" class="btn btn-dark" value="戻る" formaction="/routeList/index"/>
		</form:form>
		<!-- Kết thúc trang nhập thông tin tuyến đường -->
		
	</div>
</div> 
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

