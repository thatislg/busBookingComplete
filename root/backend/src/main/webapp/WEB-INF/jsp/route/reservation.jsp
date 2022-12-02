<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<body>
	<div class="container">
		<div class="mt-3">
			<h1>日別予約状況</h1>
		</div>
		<br> <br>
		<div>
			<form action="/reservation/search">
				<label for="fname">日付: </label> <input type="text"
					onfocus="(this.type='date')" id="fname" name="dateStr"
					placeholder="例：12/31/2022"> <input type="submit"
					value="再表示">
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
		<br>
		<h2>予約状況</h2>
		<div>
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
			<form>
			<input class="btn btn-dark" type="submit" value="戻る" style="float: right"
				formaction="/routeList/index">
			</form>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>