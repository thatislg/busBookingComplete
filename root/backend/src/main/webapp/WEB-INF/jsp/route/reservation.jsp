<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<body>
	<div class="container">
		<div class="mt-3">
			<h1>日別予約状況</h1>
		</div>
		<div class="reservation-infor shadow-lg ">
			<div class="reserveData">
				<table class="table table-bordered">
					<tr>
						<th>出発日</th>
						<td>
							<form action="/reservation/search">
								<fmt:formatDate value="${date}" pattern="yyyy年MM月dd日" var="rDate" />
								<input type="text" onfocus="(this.type='date')" id="fname" name="dateStr" value="${rDate}"/> 
								<input type="submit"value="再表示"/>
							</form>
						</td>
					</tr>
					<tr>
						<th>出発駅・出発時間</th>
						<fmt:formatDate value="${routeInfo.scheduledDepartureTime }"
							pattern="HH:mm" var="departureTime" />
						<td>${routeInfo.departureStationName}(${departureTime })</td>
					</tr>
					<tr>
						<th>到着駅・到着時間</th>
						<fmt:formatDate value="${routeInfo.scheduledArrivalTime }"
							pattern="HH:mm" var="arrivalTime" />
						<td>${routeInfo.arrivalStationName }(${arrivalTime})</td>
					</tr>
					<tr>
						<th>1席料金</th>
						<td>${routeInfo.price }円</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="shadow-lg">
			<h2>予約状況</h2>
			<table class="table table-bordered">
				<c:set var="totalNumberSeat" value="0" />
				<c:forEach items="${rowSeatList}" var="rowseat">
					<tr>
						<c:forEach items="${rowseat}" var="seat">
							<c:choose>
								<c:when test="${not empty seat}">
									<c:set var="totalNumberSeat" value="${totalNumberSeat + 1}" />
									<td><b><c:out value="${seat.seatNumber}" /></b> <c:out
											value="${seat.memberName}" /></td>
								</c:when>
								<c:when test="${empty seat}">
									<c:set var="totalNumberSeat" value="${totalNumberSeat + 1}" />
									<td><b><c:out value="${totalNumberSeat}" /></b> 空席</td>
								</c:when>
							</c:choose>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</div>
		<form class="btn-form">
			<button onclick="window.print()" class="btn btn-primary">印刷</button>	
			<input class="btn btn-dark" type="submit" value="戻る"  formaction="/routeList/index"/>
		</form>
	</div>
	<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>