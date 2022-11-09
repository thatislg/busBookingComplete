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

<div class="container">
	<div class="mt-3 mb-4">
		<h1>会員予約状況</h1>
	</div>
	<table id="member" class="table table-bordered">
		 <tbody>
		 	<tr>
				<th scope="row">会員ID</th>
				<td><c:out value="${member.memberId}"/></td>
			</tr>
			<tr>
				<th scope="row">ログインID</th>
				<td><c:out value="${member.loginId}"/></td>
			</tr>
			<tr>
				<th scope="row">氏名</th>
				<td><c:out value="${member.memberName}"/></td>
			</tr>
			<tr>
				<th scope="row">電話番号</th>
				<td><c:out value="${member.phoneNumber}"/></td>
			<tr>
				<th scope="row">メールアドレス</th>
				<td><c:out value="${member.mailAddress}"/></td>	
			</tr>
		</tbody>
	</table>
	<hr>
	
	<table id="memberReservationStatus" class="table table-bordered display">
		<thead>
			<tr>
				<th>日付</th>
				<th>路線ID</th>
				<th>出発</th>
				<th>到着</th>
				<th>料金</th>
				<th>バスID</th>
			</tr>
		 </thead>
		 <tbody>
		 	<c:choose>
		 		<c:when test="${not empty memberReservationList}">
					<c:forEach items="${memberReservationList}" var="memberRL">
					<tr>
						<fmt:formatDate value="${memberRL.reservedDate}" pattern="yyyy-mm-dd HH:mm" var="rDate"/>
						<td><c:out value="${rDate}"/></td>
						<td><c:out value="${memberRL.routeId}"/></td>
						<td><c:out value="${memberRL.departureId}"/></td>
						<td><c:out value="${memberRL.arrivalId}"/></td>
						<td><c:out value="${memberRL.price}"/></td>
						<td><c:out value="${memberRL.busId}"/></td>
					</tr>
				</c:forEach>
				</c:when>
				<c:when test="${empty memberReservationList}">
		 				<tr><td class="align-middle" colspan="6">このメンバーの予約がございません。</td></tr>
		 		</c:when>
			</c:choose>
		</tbody>
	</table>
</div>
<script>
	$(document).ready(function () {
		$('#memberList').DataTable();
	});
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

