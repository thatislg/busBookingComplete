<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.semanticui.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/list.css">
<body>

 出発　${departureStation.busStationName }
到着　　${arrivalStation.busStationName }
値段　　${routeInfo.price }
出発時間　${routeInfo.scheduledDepartureTime }
到着時間　${routeInfo.scheduledArrivalTime }
日付	${currentDate}

<form action="/reservation/search">
  <label for="fname">日付: </label>
  <input type="text" id="fname" name="date"><br><br>
  <input type="submit" value="再表示">
</form>

<table id="reserveList" class="display">
		<thead>
			<tr>
				<th>予約ID</th>
				<th>会員ID</th>
				<th>路線</th>
				<th>出発日</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${reserveList}" var="reserve">
			<tr>
				<td><c:out value="${reserve.reserveId}"/></td>
				<td><c:out value="${reserve.memberId}"/></td>
				<td><c:out value="${reserve.routeId}"/></td>
				<td><c:out value="${reserve.reservedDate}"/></td>
				<td><a href="../reserve/reservationStatus?reserveId=${reserve.reserveId}"><i class='fas fa-file-contract' style='font-size:24px'></i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>