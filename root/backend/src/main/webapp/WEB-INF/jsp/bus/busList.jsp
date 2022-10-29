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

body {
	background-image:
		url("https://cdn.cloudflare.steamstatic.com/steam/apps/491540/capsule_616x353.jpg?t=1655303686")
		no-repeat;
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
					<th>選択</th>
					<th>ID</th>
					<th>ナンバープレート</th>
					<th><spring:message code="busForm.rowNum"/></th>
					<th><spring:message code="busForm.columnNum"/></th>
				</tr>
				<c:forEach items="${busList}" var="bus">
				<tr>
					<td>◯</td>
					<td><c:out value="${bus.busId}"/></td>
					<td><c:out value="${bus.numberPlace}${bus.numberDivision} ${bus.numberKana} ${bus.numberFirstHalf}-${bus.numberLatterHalf}"/></td>
					<td><c:out value="${bus.rowNum}"/></td>
					<td><c:out value="${bus.columnNum}"/></td>
				</tr>
				</c:forEach>
 			</table>
			<form action="/busInsert/deleteConfirm">
			<input class="deleteButton" type="submit" value="削除">
		</form>
		</fieldset>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

