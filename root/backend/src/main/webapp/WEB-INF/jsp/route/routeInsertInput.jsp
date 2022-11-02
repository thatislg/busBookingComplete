<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<style>
.insertButton{
margin-top: 20px;
}
.insertTitle{
font-size:30px ;
font-weight: bold;
}
#section{
width: 960px;
margin: 0 auto;
}
</style>
<div id="section">
	<div id="article">
		<form:form modelAttribute="routeForm">	
			<fieldset>
			<legend class="insertTitle">路線登録</legend>
			<ul>
				<form:errors path="departureId" element="p"/>
				<li><spring:message code="routeForm.departureId"/>:<form:input path="departureId"/></li>
				<form:errors path="arrivalId" element="p"/>
				<li><spring:message code="routeForm.arrivalId"/>:<form:input path="arrivalId"/></li>
				<form:errors path="busId" element="p"/>
				<li><spring:message code="routeForm.busId"/>:<form:input path="busId"/></li>
				<form:errors path="price" element="p"/>
				<li><spring:message code="routeForm.price"/>:<form:input path="price"/></li>
				<form:errors path="operationStartDate" element="p"/>
				<li><spring:message code="routeForm.operationStartDate"/>:<form:input path="operationStartDate"/></li>
				<form:errors path="operationEndDate" element="p"/>
				<li><spring:message code="routeForm.operationEndDate"/>:<form:input path="operationEndDate"/></li>
				<form:errors path="scheduledDepartureTime" element="p"/>
				<li><spring:message code="routeForm.scheduledDepartureTime"/>:<form:input path="scheduledDepartureTime"/></li>	
				<form:errors path="scheduledArrivalTime" element="p"/>
				<li><spring:message code="routeForm.scheduledArrivalTime"/>:<form:input path="scheduledArrivalTime"/></li>			
			</ul>
			</fieldset>
			<input class="insertButton" type="submit" value="登録" formaction="/routeInsert/confirm">
			<input class="returnButton" type="submit" value="戻る" formaction="/routeList/index">
		</form:form>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

