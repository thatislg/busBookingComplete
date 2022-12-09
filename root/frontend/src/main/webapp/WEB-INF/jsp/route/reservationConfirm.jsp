<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"> 
	<div class="routeSearch flex" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>予約確認</h1>
				<h2>下記の内容で予約します。よろしいでしょうか?</h2>
			</div>
			<div class = "confirm-form">
				<table class="seat-info-table">
					<tr>
						<th>日付</th>
						<fmt:formatDate value="${searchResultForm.departureDate}" pattern="yyyy-MM-dd" var="rDDate"/>
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
					<tr>
						<th>1席あたりの料金</th>
						<td>¥${routeInfo.price}</td>
					</tr>
					<tr>
						<th>予約席</th>
						<td><c:out value="${strInputedCurrentReservedSeat}" /></td>
					</tr>
					<tr>
						<th>小計</th>
						<c:set var="totalPrice" value="${routeInfo.price * fn:length(inputedCurrentReservedSeat)}"/>
						<td>¥${totalPrice}</td>
					</tr>
				</table>
				<div class="btn-form">
					<form:form method="POST">
						<input type="hidden" name="currentReservedSeat" value="${insertSeatInfo}"/>
						<input type="submit" class="reserve-btn" value="予約" formaction="/reservation/insert"/>
					</form:form>
					<form:form method="POST">
						<input type="hidden" name="departureDate" value="${rDDate}"/>
						<input type="hidden" name="routeId" value="${searchResultForm.routeId}"/>
						<input type="hidden" name="busId" value="${searchResultForm.busId}"/>
						<input type="hidden" name="searchedDepartureName" value="${searchResultForm.searchedDepartureName}"/>
						<input type="hidden" name="searchedArrivalName" value="${searchResultForm.searchedArrivalName}"/>
						<input type="submit" class="return-btn" value="戻る" formaction="/reservation/input"/>
					</form:form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
