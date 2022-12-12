<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:out value="/css/style.css"/>"/>
	<div class="routeSearch flex" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>予約完了</h1>
				<h2>この度、ご予約いただきありがとうございます。<br>
				この画面をご印刷いただきご発車当日チケットと一緒にご持参ください。</h2>	
			</div>
			<div class = "confirm-form">
				<table class="insert seat-info-table">
					<tr>
						<th>予約ID</th>
						<td>${reserveInfo.reserveId}</td>
					</tr>
					<tr>
						<th>日付</th>
						<fmt:formatDate value="${reserveInfo.departureDate}" pattern="yyyy-MM-dd"  var="rDDate"/>
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
						<th>予約席</th>
						<td>
							<c:out value="${strSeatListInfo}" />
						</td>
					</tr>
					<tr class="total-price">
						<th>小計</th>
						<td>¥${totalAmount}</td>
					</tr>	
				</table>
				<div class="btn-form">	
					<form:form>
						<input type="submit" class="reserve-btn" value="完了" formaction="../reservation/index"/>
						<input type="submit" onclick="window.print()" class="return-btn" value="印刷" formaction="/reservation/input"/>
					</form:form>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>