<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
.okButton{
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
			<fieldset>
			<legend class="insertTitle">路線登録確認</legend>
			<ul>
				<li><spring:message code="routeForm.departureId"/>:<c:out value="${routeForm.departureId}"/></li>
				<li><spring:message code="routeForm.arrivalId"/>:<c:out value="${routeForm.arrivalId}"/></li>
				<li><spring:message code="routeForm.busId"/>:<c:out value="${routeForm.busId}"/></li>
				<li><spring:message code="routeForm.price"/>:<c:out value="${routeForm.price}"/></li>
				<li><spring:message code="routeForm.operationStartDate"/>:<fmt:formatDate value="${routeForm.operationStartDate}" pattern="yyyy年MM月dd日"/></li>
				<li><spring:message code="routeForm.operationEndDate"/>:<fmt:formatDate value="${routeForm.operationEndDate}" pattern="yyyy年MM月dd日"/></li>
				<li><spring:message code="routeForm.scheduledDepartureTime"/>:<fmt:formatDate value="${routeForm.scheduledDepartureTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/></li>	
				<li><spring:message code="routeForm.scheduledArrivalTime"/>:<fmt:formatDate value="${routeForm.scheduledArrivalTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/></li>			
			</ul>
			</fieldset>
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
		<input class="okButton" type="submit" value="ＯＫ" formaction="/routeInsert/insert">
		<input class="returnButton" type="submit" value="戻る" formaction="/routeInsert/input">
	</form:form>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
