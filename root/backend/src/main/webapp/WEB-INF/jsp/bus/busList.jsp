<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
tr.top {
	background-color: lightblue;
}

table, th, td {
	margin: 24px;
	border: 2px solid darkblue;
	border-collapse: collapse;
	padding: 15px;
}

.insertButton {
	position: relative;
	left: 65em;
}

.buslistTitle{
font-size:30px ;
font-weight: bold;
}
#section{
width: 960px;
margin: 0 auto;
}
#buslistTable{
text-align: center;
position: relative;
left: 150px;
}
/* input:checked {
  height: 50px;
  width: 50px;
} */
</style>
<div id="section">
	<div id="article">
		<fieldset>
			<legend class="buslistTitle">バス一覧</legend>
			<form action="/busInsert/input">
				<input class="insertButton" type="submit" value="新規登録">
			</form>
			<table id="buslistTable">
				<tr class="top">
					<th>ID</th>
					<th>ナンバープレート</th>
					<th><spring:message code="busForm.rowNum"/></th>
					<th><spring:message code="busForm.columnNum"/></th>
					<th>削除</th>
				</tr>
				<c:forEach items="${busList}" var="bus">
				<tr>
					<td><c:out value="${bus.busId}"/></td>
					<td><c:out value="${bus.numberPlace}${bus.numberDivision} ${bus.numberKana} ${bus.numberFirstHalf}-${bus.numberLatterHalf}"/></td>
					<td><c:out value="${bus.rowNum}"/></td>
					<td><c:out value="${bus.columnNum}"/></td>
					<td><a href="../busDelete/confirm?busId=${bus.busId}">削除</a></td>
				</tr>
				</c:forEach>
 			</table>
		</fieldset>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

