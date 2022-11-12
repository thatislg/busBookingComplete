<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/dataTables.semanticui.min.css">
<script type="text/javascript" charset="utf8"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/list.css">

<body>
	<div class="container">
		<div class="mt-3">
			<h1>日別予約状況</h1>
		</div>
		<br>
		<br>
		<div>
		<form action="/reservation/search">
			<label for="fname">日付: </label> <input type="text" id="fname"
				name="dateStr">   <input type="submit" value="再表示">
		</form>
		</div>
		<br>
		
		
		<div class="reserveData">
			<table class="table table-bordered">
				<tr>
					<th>日付</th>
					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" var="rDate" />
					<td>${rDate}</td>
				</tr>
				
				<tr>
					<th>出発駅・出発時間</th>
					<td>${departureStation.busStationName }</td>
				</tr>
				<tr>
					<th>到着駅・到着時間</th>
					<td>${arrivalStation.busStationName }</td>
				</tr>
				<tr>
					<th>1席料金</th>
					<td>${routeInfo.price }</td>
				</tr>
			</table>
		</div>
		
		<br>
		<br>
		<h2>予約リスト</h2>
		<div>
		<table id="reserveList" class="display">
			<thead>
				<tr>
					<th>予約ID</th>
					<th>会員ID</th>
					<th>路線</th>
					<th>予約日</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reserveList}" var="reserve">
					<tr>
						<td><c:out value="${reserve.reserveId}" /></td>
						<td><c:out value="${reserve.memberId}" /></td>
						<td><c:out value="${reserve.routeId}" /></td>
						<fmt:formatDate value="${reserve.reservedDate}" pattern="yyyy-MM-dd" var="date" />
						<td><c:out value="${date}" /></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		</div>
		<br>
		<h2>予約状況</h2>
		<div>
		<table class="table table-bordered">
			<c:forEach items="${rowSeatList}" var="rowseat">
				<tr>
					<c:forEach items="${rowseat}" var="seat">
						<c:choose>
							<c:when test="${not empty seat}">
								<td><c:out value="${seat.memberName}"/><c:out value=":${seat.seatNumber}"></c:out></td>
							</c:when>
							<c:when test="${empty seat}">
								<td>空席</td>
							</c:when>
						</c:choose>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		
		
		<table class="table table-bordered">
			<c:forEach items="${rowSeatList}" var="rowseat">
				<tr>
					<c:forEach items="${rowseat}" var="seat">
						<c:choose>
							<c:when test="${not empty seat}">
								<td><c:out value="${seat.memberName}"/><c:out value=":${seat.seatNumber}"></c:out></td>
							</c:when>
							<c:when test="${empty seat}">
								<td>空席</td>
							</c:when>
						</c:choose>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		
		
		
		</div>
		<script>
			$(document).ready(function() {
				$('#reserveList').DataTable();
			});
		</script>

	</div>
</body>
</html>