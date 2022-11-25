<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	  rel="stylesheet">
<!-- BEGIN  -->

<div>
	<h1>予約完了</h1>
	<br>
	予約者ID :<c:out value="${currentLoginId}"/>
　　<br>
	
	<div>
	<table class="table table-bordered">
		<tr style="max-width:800px;">
			<th style="width:100px;">日付</th>
			<fmt:formatDate value="${reservedDepartureDate}" pattern="yyyy-MM-dd" var="rDDate"/>
			<td style="width:500px;">${rDDate}</td>
		</tr>
		<tr>
			<th>出発</th>
			<td>${departureStationName.busStationName}</td>
		</tr>
		<tr>
			<th>到着</th>
			<td>${arrivalStationName.busStationName}</td>
		</tr>
		<tr style="max-width:800px;">
			<th style="width:200px;">予約席</th>
			<td>
				<c:out value="${strInputedCurrentReservedSeat}" />
			</td>
		</tr>
		<tr>
			<th style="width:200px;">小計</th>
			<c:set var="totalPrice" value="${routeInfo.price * fn:length(inputedCurrentReservedSeat)}"/>
			<td>¥${totalPrice}</td>
		</tr>

		
	</table>
	<br>
	<div>
		予約が完了しました。この画面を印刷して当日持参してください。
	</div>	
	<form:form>
		<input type="submit" value="OK" formaction="../reservation/index"/>
	</form:form>
	</div>
</div>
<!-- END  -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>