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
<c:out value="${errMsg}"/>
<div class="container">
	<div class="mt-3 text-center">
		<h1>バス一覧</h1>
	</div>
	<div class="mb-3 float-end" >
		<form action="/busInsert/input">
			<input class="btn btn-primary" type="submit" value="新規登録">
		</form>
	</div>		
	<table id="busList" class="display">
		<thead>
			<tr>
				<th>バスID</th>
				<th>ナンバープレート</th>
				<th>一列あたり列数</th>
				<th>シート列数</th>
				<th>削除</th>
			</tr>
		 </thead>
		 <tbody>
			<c:forEach items="${busList}" var="bus">
			<tr>
				<td><c:out value="${bus.busId}"/></td>
				<td><c:out value="${bus.numberPlace}${bus.numberDivision} ${bus.numberKana} ${bus.numberFirstHalf}-${bus.numberLatterHalf}"/></td>
				<td><c:out value="${bus.rowNum}"/></td>
				<td><c:out value="${bus.columnNum}"/></td>
				<td><a href="../busDelete/confirm?busId=${bus.busId}"><i class="fa fa-trash-o" style="font-size:24px"></i></a></td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
</div>
<script>
	$(document).ready(function () {
		$('#busList').DataTable();
	});
</script>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

