<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="./css/style.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/material-components-web/4.0.0/material-components-web.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.material.min.css"/>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/dataTables.material.min.js"></script>

	<header class = "flex" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus9.jpg) center/cover no-repeat;">
		<div class="container">	
			<div class="title">
				<h1>予約一覧</h1>
				<p><c:out value="${message}"/></p>
				<p class="errMessage"><c:out value="${errMessage}"/></p>
			</div>
			<div class = "data-table-form">
				<table id="reservationList" class="list-table">
					<thead>
						<tr>
							<th>予約ID</th>
							<th>出発名</th>
							<th>到着名</th>
							<th>座席番号</th>
							<th>料金</th>
							<th>出発日</th>
							<th>予約日</th>
							<th>キャンセル</th>
						</tr>
					 </thead>
					 <tbody>
						<c:forEach items="${reservationList}" var="reserve">
							<c:choose>
							<c:when test="${today > reserve.departureDate}">
							<tr class="departured-reserve">
								<td><c:out value="${reserve.reserveId}"/></td>							
								<fmt:formatDate value="${reserve.scheduledDepartureTime}" pattern="HH:mm" var="scheduledDepartureTime" />
								<td><c:out value="${reserve.departureName}(${scheduledDepartureTime })"/></td>
								<fmt:formatDate value="${reserve.scheduledArrivalTime }" pattern="HH:mm" var="scheduledArrivalTime" />
								<td><c:out value="${reserve.arrivalName}(${scheduledArrivalTime })"/></td>
								<td><c:out value="${reserve.seatNumber}"/></td>
								<td><c:out value="${reserve.totalPrice}円"/></td>
								<fmt:formatDate value="${reserve.departureDate}" pattern="yyyy年MM月dd日" var="departureDate" />
								<td><c:out value="${departureDate}"/></td>
								<fmt:formatDate value="${reserve.reservedDate}" pattern="yyyy年MM月dd日" var="reservedDate" />
								<td><c:out value="${reservedDate}"/></td>
								<td><a class="departured">出発済</a></td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>						
								<td><c:out value="${reserve.reserveId}"/></td>
								<fmt:formatDate value="${reserve.scheduledDepartureTime}" pattern="HH:mm" var="scheduledDepartureTime" />
								<td><c:out value="${reserve.departureName}(${scheduledDepartureTime })"/></td>
								<fmt:formatDate value="${reserve.scheduledArrivalTime }" pattern="HH:mm" var="scheduledArrivalTime" />
								<td><c:out value="${reserve.arrivalName}(${scheduledArrivalTime })"/></td>
								<td><c:out value="${reserve.seatNumber}"/></td>
								<td><c:out value="${reserve.totalPrice}円"/></td>
								<fmt:formatDate value="${reserve.departureDate}" pattern="yyyy年MM月dd日" var="departureDate" />
								<td><c:out value="${departureDate}"/></td>
								<fmt:formatDate value="${reserve.reservedDate}" pattern="yyyy年MM月dd日" var="reservedDate" />
								<td><c:out value="${reservedDate}"/></td>
								<td><a href="../reservation/cancelConfirm?reserveId=${reserve.reserveId}"><i class="fa-solid fa-rectangle-xmark"></i></a></td>
							</tr>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</header>
	</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>