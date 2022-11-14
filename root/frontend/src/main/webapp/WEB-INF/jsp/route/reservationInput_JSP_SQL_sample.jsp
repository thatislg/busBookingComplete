<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


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
<div>
	<table class="table table-bordered">
		<tr>
			<th>日付</th>
			<td>Chưa có nội dung</td>
		</tr>
		<tr>
			<th>出発</th>
			<td>Chưa có nội dung</td>
		</tr>
		<tr>
			<th>到着</th>
			<td>Chưa có nội dung</td>
		</tr>
	</table>
</div>
<div>
	<table class="table table-bordered">
		<tr>
			<th>1席あたりの料金</th>
			<td>Hiển thị giá tiền</td>
		</tr>
	</table>
</div>
<div>
	<div>
		予約する席を選択して、予約ボタンを押下してください。
	</div>	
<sql:setDataSource var="snapshot1" driver="org.postgresql.Driver"
     url="jdbc:postgresql://153.92.214.210:5432/bus"
     user="postgres"  password="98919891"/>
<sql:query dataSource="${snapshot1}" var="result">
		SELECT 
	S.BUS_ID
	,S.SEAT_NUMBER
	,S.RESERVE_ID
	,R.ROUTE_ID
	,R.DEPARTURE_DATE
	,RO.DEPARTURE_ID
	,RO.ARRIVAL_ID
	,RO.PRICE
FROM 
	SEAT AS S
	INNER JOIN BUS AS B
		ON S.BUS_ID = B.BUS_ID
	INNER JOIN RESERVE AS R
		ON S.RESERVE_ID = R.RESERVE_ID
	INNER JOIN ROUTE AS RO
		ON R.ROUTE_ID = RO.ROUTE_ID
GROUP BY 
	S.BUS_ID
	,S.SEAT_NUMBER
	,S.RESERVE_ID
	,R.ROUTE_ID
	,R.DEPARTURE_DATE
	,RO.DEPARTURE_ID
	,RO.ARRIVAL_ID
	,RO.PRICE
HAVING 
	R.DEPARTURE_DATE = '2015-01-12'
	AND RO.DEPARTURE_ID = 1
	AND RO.ARRIVAL_ID = 2
ORDER BY 
	S.BUS_ID;
</sql:query>
	<table class="table table-bordered">
		<tr>
		   <th>BUS_ID</th>
		   <th>SEAT_NUMBER</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
		<tr>
		   <td><c:out value="${row.bus_id}"/></td>
		   <td><c:out value="${row.seat_number}"/></td>
		</tr>
		</c:forEach>
</table>
	<table class="table table-bordered">
		<tr>
			<th colspan="4">Bản đồ đặt chỗ</th>
		</tr>
		<c:set var="totalNumberSeat" value="0"/>
		<c:forEach begin="1" end="4" step="1" var="i">
		<tr>
			<c:forEach begin="1" end="14" step="1" var="j">
				<c:set var="totalNumberSeat" value="${totalNumberSeat + 1}"/>
				<td>
					<c:out value="${totalNumberSeat}"/>
					<input type="checkbox"/>
				</td>
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