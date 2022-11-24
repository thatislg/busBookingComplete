<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	  rel="stylesheet">
<body>
<div>
	<h1>予約確認</h1>
	<div>
	<table class="table table-bordered">
		<tr style="max-width:800px;">
			<th style="width:100px;">日付</th>
			<fmt:formatDate value="${reservedDepartureDate}" pattern="yyyy-MM-dd" var="rDDate"/>
			<td style="width:500px;">${rDDate}</td>
		</tr>
		<tr>
			<th>出発</th>
			<td>${departureStationName.busStationName}</td>
		</tr>
		<tr>
			<th>到着</th>
			<td>${arrivalStationName.busStationName}</td>
		</tr>
	</table>
	</div>
</div>
<div>
	<table class="table table-bordered">
		<tr style="max-width:800px;">
			<th style="width:200px;">1席あたりの料金</th>
			<td>¥${routeInfo.price}</td>
		</tr>
	</table>
	<hr>
</div>
<div>
	<table class="table table-bordered">
		<tr style="max-width:800px;">
			<th style="width:200px;">予約席</th>
			<td>
				<c:out value="${strInputedCurrentReservedSeat}" />
			</td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<th style="width:200px;">小計</th>
			<c:set var="totalPrice" value="${routeInfo.price * fn:length(inputedCurrentReservedSeat)}"/>
			<td>¥${totalPrice}</td>
		</tr>
	</table>
	<hr>
	<div>
		上記で予約します。よろしいでしょうか。
	</div>
<div>
	<form:form method="POST">
		<input type="hidden" name="currentReservedSeat" value="${insertSeatInfo}"/>
		<input type="hidden" name="departureDate" value="${rDDate}"/>
		<input type="hidden" name="routeId" value="${routeInfo.routeId}"/>
		<input type="hidden" name="busId" value="${busInfo.busId}"/>
		<input type="submit" value="OK" formaction="/reservation/insert"/>
	</form:form>
	<form:form method="POST">
		<input type="submit" value="戻る" formaction=""/>
	</form:form>
</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
