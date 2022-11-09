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

<c:out value="${errMsg}"/>
<div class="container">
	<div class="mt-3">
		<h1>路線一覧</h1>
	</div>
	<div class="mb-3 float-end" >
		<form>
			<input class="btn btn-primary" type="submit" value="新規登録" formaction="/routeInsert/input">
			
		<%--	<input class="btn btn-primary" type="submit" value="予約状況" formaction="/reservation/index"> --%>
		
		</form>
	</div>		
	<table id="routList" class="display shadow-lg">
		<thead>
			<tr>
				<th>路線ID</th>
				<th>出発</th>
				<th>到着</th>
				<th>運行開発日</th>
				<th>運行終了日</th>
				<th>料金</th>
				<th>バスID</th>
				<th>削除</th>
				<th>変更</th>
				<th>予約状況</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${routeList}" var="route">
				<tr>
					<fmt:formatDate value="${route.scheduledDepartureTime}" pattern="HH:mm" var="sDTime"/>
					<fmt:formatDate value="${route.scheduledArrivalTime}" pattern="HH:mm" var="sATime"/>
					<td><c:out value="${route.routeId}"/></td>
					<!--  <td><c:out value="${route.departureId}(${sDTime})"/></td>-->
					<td><c:out value="${route.departureStationName}(${sDTime})"/></td>
					<!-- <td><c:out value="${route.arrivalId}(${sATime})"/></td> -->
					<td><c:out value="${route.arrivalStationName}(${sATime})"/></td>
					<td><fmt:formatDate value="${route.operationStartDate}" pattern="yyyy年MM月dd日"/></td>
					<td><fmt:formatDate value="${route.operationEndDate}" pattern="yyyy年MM月dd日"/></td>
					<td><c:out value="${route.price}"/></td>
					<td><c:out value="${route.busId}"/></td>
					<td><a href="../routeDelete/confirm?routeId=${route.routeId}"><em class="fa fa-trash-o" style="font-size:24px"></em></a></td>
					<td><a href="../routeUpdate/input?routeId=${route.routeId}"><em class="fa-solid fa-pen-to-square" style="font-size:24px"></em></a></td>
					<td><a href="../reservation/index?routeId=${route.routeId}"><em class="fa-calendar-check-o" style="font-size:24px"></em></a></td>
				</tr>
				</c:forEach>
		</tbody>
	</table>
</div>
<script>
	$(document).ready(function () {
		$('#routList').DataTable();
	});
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>