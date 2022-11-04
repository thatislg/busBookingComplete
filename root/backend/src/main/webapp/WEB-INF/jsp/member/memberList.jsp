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


<style>
h1 {
	font-size: 30px;
	font-family: "Impact";
	font-weight: 200;
}
.container {
	width: 1100px;
}
</style>
<div class="container">
	<div class="mt-3 mb-4">
		<h1>会員一覧</h1>
	</div>
	<table id="memberList" class="display">
		<thead>
			<tr>
				<th>会員ID</th>
				<th>ログインID</th>
				<th>氏名</th>
				<th>電話番号</th>
				<th>メールアドレス</th>
				<th>予約状況</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${memberList}" var="member">
			<tr>
				<td><c:out value="${member.memberId}"/></td>
				<td><c:out value="${member.loginId}"/></td>
				<td><c:out value="${member.memberName}"/></td>
				<td><c:out value="${member.phoneNumber}"/></td>
				<td><c:out value="${member.mailAddress}"/></td>
				<td><a href="../memberDelete/confirm?memberId=${member.memberId}"><i class='fas fa-file-contract' style='font-size:24px'></i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
	$(document).ready(function () {
		$('#memberList').DataTable();
	});
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

