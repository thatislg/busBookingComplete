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
			<label for="fname">日付: </label> <input type="date" id="fname"
				name="dateStr">   <input type="submit" value="再表示">
		</form>
		</div>
		<br>
		
		
		<div class="reserveData">
			<table class="table table-bordered">
				<tr>
					<th>出発日</th>
					<fmt:formatDate value="${date}" pattern="yyyy年MM月dd日" var="rDate" />
					<td>${rDate}</td>
				</tr>
				
				<tr>
					<th>出発駅・出発時間</th>
					<fmt:formatDate value="${routeInfo.scheduledDepartureTime }" pattern="HH:mm" var="departureTime" />
					<td>${routeInfo.departureStationName}(${departureTime })</td>
				</tr>
				<tr>
					<th>到着駅・到着時間</th>
					<fmt:formatDate value="${routeInfo.scheduledArrivalTime }" pattern="HH:mm" var="arrivalTime" />
					<td>${routeInfo.arrivalStationName }(${arrivalTime})</td>
				</tr>
				<tr>
					<th>1席料金</th>
					<td>${routeInfo.price }円</td>
				</tr>
			</table>
		</div>
		
		<br>
		<br>
	
		<h2>予約状況</h2>
		<div>
		<table class="table table-bordered">
			<c:set var="totalNumberSeat" value="0"/>
			<c:forEach items="${rowSeatList}" var="rowseat">
				<tr>
					<c:forEach items="${rowseat}" var="seat">
						<c:choose>
							<c:when test="${not empty seat}">
								<c:set var="totalNumberSeat" value="${totalNumberSeat + 1}"/>
								<td><b><c:out value="${seat.seatNumber}"/></b>    <c:out value="${seat.memberName}"/></td>
							</c:when>
							<c:when test="${empty seat}">
								<c:set var="totalNumberSeat" value="${totalNumberSeat + 1}"/>
								<td><b><c:out value="${totalNumberSeat}"/></b>    空席</td>
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