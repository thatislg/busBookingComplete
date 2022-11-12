<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/dataTables.semanticui.min.css">
<script type="text/javascript" charset="utf8"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/dataTables.semanticui.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.8/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/css/list.css">

<body>
<div class="container">
<div class="mt-3">
	<h1>日別予約状況</h1>
</div>
<div class="reserveData" >
<table class="table table-bordered">
 <tr>
    <th>日付</th>
    <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" var="rDate"/>
    <td>${rDate}</td>
 </tr>
  <tr>
    <th>日付</th>
    <td>${date}</td>
 </tr>
  <tr>
    <th>出発駅・出発時間</th>
    <td>${departureStation.busStationName }</td>
 </tr>
  <tr>
    <th>到着駅・到着時間</th>
    <td>${arrivalStation.busStationName }</td>
 </tr>
  <tr>
    <th>1席料金</th>
    <td>${routeInfo.price }</td>
 </tr>
</table>
</div>
	<form action="/reservation/search">
		<label for="fname">日付: </label> <input type="text" id="fname"
			name="dateStr"><br> <input type="submit" value="再表示">
	</form>

	<table id="reserveList" class="display">
		<thead>
			<tr>
				<th>予約ID</th>
				<th>会員ID</th>
				<th>路線</th>
				<th>予約日</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reserveList}" var="reserve">
				<tr>
					<td><c:out value="${reserve.reserveId}" /></td>
					<td><c:out value="${reserve.memberId}" /></td>
					<td><c:out value="${reserve.routeId}" /></td>
					<td><c:out value="${reserve.reservedDate}" /></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

		<form:form modelAttribute="bus" var="bus">
			<table class="table table-bordered">
			<tr>
			<th>No</th>
			<c:forEach begin="1" end="${bus.columnNum}" step="1" var="j">
					<th><c:out value="${j}"/></th>
			</c:forEach>
			
				<c:forEach begin="1" end="${bus.rowNum}" step="1" var="i">
					<tr>
						<td><c:out value="${i}"/></td>
						<td><button type="button" class="btn btn-primary" ></button> </td>
						<td><button type="button" class="btn btn-success">空席</button> </td>
						<td><button type="button" class="btn btn-primary">空席</button> </td>
						<td><button type="button" class="btn btn-success">空席</button> </td>
					</tr>
				</c:forEach>
			</table>
		</form:form>
		
		<form:form modelAttribute="bus" var="bus">
			<table class="table table-bordered">
				<c:forEach begin="0" end="${bus.rowNum}" step="1" var="i">
				<tr>
					<c:forEach begin="1" end="${bus.columnNum}" step="1" var="j">	
							<td><button type="button" class="btn btn-primary" ><c:out value="${i + j}" /></button> </td>
					</c:forEach>
				</tr>
				</c:forEach>
			</table>
			
			<table class="table table-bordered">
				<c:set var="endNum" value="${bus.rowNum*bus.columnNum}"/>
				<c:forEach begin="0" end="${endNum}" step="4" var="i">
				<tr>
			
							<td><button type="button" class="btn btn-primary" ><c:out value="${i + 1}" /></button> </td>
							<td><button type="button" class="btn btn-primary" ><c:out value="${i +2}" /></button> </td>
							<td><button type="button" class="btn btn-primary" ><c:out value="${i +3}" /></button> </td>
							<td><button type="button" class="btn btn-primary" ><c:out value="${i +4}" /></button> </td>
					
				</tr>
				</c:forEach>
			</table>
		</form:form>
		<script>
	$(document).ready(function () {
		$('#reserveList').DataTable();
	});
	</script>
</div>
</body>
</html>