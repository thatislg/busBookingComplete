<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:out value="/css/style.css"/>"/>
	<div class="routeSearch flex" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus9.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>予約削除確認</h1>
				<h2>下記の内容で削除します。よろしいでしょうか?</h2>
			</div>
			<div class = "confirm-form">
				<table class="seat-info-table">
					<tr>
						<th>予約ID</th>
						<td><c:out value="${reservationInfor.reserveId}"/></td>
					</tr>
					<tr>
						<th>出発名</th>
						<fmt:formatDate value="${reservationInfor.scheduledDepartureTime}" pattern="HH:mm" var="scheduledDepartureTime" />
						<td><c:out value="${reservationInfor.departureName}(${scheduledDepartureTime})"/></td>
					</tr>
					<tr>
						<th>到着名</th>
						<fmt:formatDate value="${reservationInfor.scheduledArrivalTime}" pattern="HH:mm" var="scheduledArrivalTime" />
						<td><c:out value="${reservationInfor.arrivalName}(${scheduledArrivalTime })"/></td>
					</tr>
					<tr>
						<th>座席番号</th>
						<td><c:out value="${seatInfor}"></c:out></td>	
					</tr>
					<tr>
						<th>出発日</th>
						<fmt:formatDate value="${reservationInfor.departureDate}" pattern="yyyy年MM月dd日" var="departureDate" />
						<td><c:out value="${departureDate}"/></td>
					</tr>
					<tr>
						<th>予約日</th>
						<fmt:formatDate value="${reservationInfor.reservedDate}" pattern="yyyy年MM月dd日" var="reservedDate" />
						<td><c:out value="${reservedDate}"/></td>
					</tr>
					<tr class="total-price">
						<th>料金</th>
						<td><c:out value="${totalPrice}円"/></td>
					</tr>
				</table>
				<div class="btn-form">
					<form:form method="POST">
						<input type="hidden" name="reserveId" value="${reservationInfor.reserveId}"/>
						<input type="hidden" name="seatId" value="${reservationInfor.seatId}"/>
						<input type="submit" class="reserve-btn" value="削除" formaction="/reservation/cancel"/>
						<input type="submit" class="return-btn" value="戻る" formaction="/reservation/index"/>
					</form:form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
