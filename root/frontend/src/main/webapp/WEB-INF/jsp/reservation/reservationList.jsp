<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/list.css">

<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.css">

<header class = "flex">
<div class="container">	
	<div class="header-title">
		<h1>予約一覧</h1>
	</div>
	<div class = "list">
	<table id="reservationList" class="display" style="color:black;text-align:left ">
		<thead>
			<tr>
				<th>予約ID</th>
				<th>路線ID</th>
				<th>出発名</th>
				<th>到着名</th>
				<th>出発日</th>
				<th>予約日</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${reservationList}" var="reserve">
			<tr>
				<td><c:out value="${reserve.reserveId}"/></td>
				<td><c:out value="${reserve.routeId}"/></td>
				<td><c:out value="${reserve.departureName}"/></td>
				<td><c:out value="${reserve.arrivalName}"/></td>
				<fmt:formatDate value="${reserve.departureDate}" pattern="yyyy年MM月dd日" var="departureDate" />
				<td><c:out value="${departureDate}"/></td>
				<fmt:formatDate value="${reserve.reservedDate}" pattern="yyyy年MM月dd日" var="reservedDate" />
				<td><c:out value="${reservedDate}"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</header>
<script>
	$(document).ready(function () {
		$('#reservationList').DataTable();
	});
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>