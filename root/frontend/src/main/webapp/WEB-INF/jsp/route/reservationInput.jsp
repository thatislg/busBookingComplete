<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<body>
<form:form modelAttributes="seatMap">
<div>
	<table class="table table-bordered">
		<tr>
			<th>日付</th>
			<fmt:formatDate value="${reservedDepartureDate}" pattern="yyyy-MM-dd" var="rDDate"/>
			<td>${rDDate}</td>
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
</form:form>
<div>
	<table class="table table-bordered">
		<tr>
			<th>1席あたりの料金</th>
			<td>${routeInfo.price}</td>
		</tr>
	</table>
</div>
<div>
	<div>
		予約する席を選択して、予約ボタンを押下してください。
	</div>	
	<table class="table table-bordered">
		<tr>
			<th colspan="4">Bản đồ đặt chỗ</th>
		</tr>
		<c:set var="totalNumberSeat" value="0"/>
		<c:forEach begin="1" end="${busInfo.columnNum}" step="1" var="i">
		<tr>
			<c:forEach begin="1" end="${busInfo.rowNum}" step="1" var="j">
				<c:set var="totalNumberSeat" value="${totalNumberSeat + 1}"/>
				<c:set var="flag" value="${0}"/>
				<c:forEach items="${seatList}" var="seat">
					<c:choose>
							<c:when test="${seat.seatNumber == totalNumberSeat}">
								<c:set var="flag" value="${flag + 1}"/>
							</c:when>
							<c:when test="${seat.seatNumber != totalNumberSeat}">
								<c:set var="flag" value="${flag + 0}"/>
							</c:when>
					</c:choose>
				</c:forEach>
				<c:choose>
							<c:when test="${flag == 0}">
								<td><b><c:out value="${totalNumberSeat}"/></b>   空席 <input type="checkbox"></td>
							</c:when>
							<c:when test="${flag != 0}">
								<td><b><c:out value="${totalNumberSeat}"/> <u>予約済</u> </b>  </td>
							</c:when>
				</c:choose>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>
</div>
<script>
	$(document).ready(function () {
		$('#reserveList').DataTable();
	});
</script>
</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>