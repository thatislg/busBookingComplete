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
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

<div class="container">
	<div class="mt-3 mb-4">
		<h1>会員予約状況</h1>
	</div>
	<div class="member-infor shadow-lg ">
		<div class="mt-3 mb-4">
			<h2>会員情報</h2>
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
	</div>
	<div class="shadow-lg">
		<div class="mt-3 mb-4">
			<h2>予約情報</h2>
		</div>
		<table id="memberReservationStatus" class="table table-bordered display">
			<thead>
				<tr>
					<th>予約ID</th>
					<th>予約日</th>
					<th>路線ID</th>
					<th>バスID</th>
					<th>出発駅</th>
					<th>到着駅</th>
					<th>座席番号</th>
					<th>出発日</th>
					<th>合計料金</th>	
				</tr>
			 </thead>
			 <tbody>
				<c:forEach items="${memberReservationList}" var="memberRL">
					<tr>
						<td><c:out value="${memberRL.reserveId}"/></td>
						<fmt:formatDate value="${memberRL.reservedDate}" pattern="yyyy年MM月dd日 HH:mm" var="rDate"/>
						<td><c:out value="${rDate}"/></td>
						<td><c:out value="${memberRL.routeId}"/></td>
						<td><c:out value="${memberRL.busId}"/></td>
						<td><c:out value="${memberRL.departureName}"/></td>
						<td><c:out value="${memberRL.arrivalName}"/></td>
						<td><c:out value="${memberRL.seatNumber}"/></td>
						<fmt:formatDate value="${memberRL.departureDate}" pattern="yyyy年MM月dd日 HH:mm" var="departureDate"/>
						<td><c:out value="${departureDate}"/></td>
						<td><c:out value="${memberRL.totalPrice}円"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<form class="btn-form">
		<input class="btn btn-dark" type="submit" value="戻る" formaction="/memberList/index">
	</form>
</div>
<script>
$(document).ready(function () {
	$.extend( $.fn.dataTable.defaults, {
        language: { url: "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json" }
    });
	$('#memberReservationStatus').DataTable();
});
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

