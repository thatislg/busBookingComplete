<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
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
		<tr>
			<th>1席あたりの料金</th>
			<td>${routeInfo.price}</td>
		</tr>
	</table>
</div>
<c:forEach items="${inputedCurrentReservedSeat}" var="seat">
	<c:out value="${seat}"/>
</c:forEach>
</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>