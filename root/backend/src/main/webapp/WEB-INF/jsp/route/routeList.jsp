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
	left: 52em;
}

.routelistTitle{
font-size:30px ;
font-weight: bold;
}
#form1{
position: relative;
left: 19em;
}
#form2{
position: relative;
right: 103px;
}
.updateButton{
position: relative;
left: 250px;
}
#section{
width: 1181px;
margin: 0 auto;
}
</style>
<div id="section">
	<div id="article">
		<fieldset>
			<legend class="routelistTitle">路線一覧</legend>
			<div>
			<form id="form1">
				<input class="insertButton" type="submit" value="新規登録" formaction="/routeInsert/input">
				<input class="insertButton" type="submit" value="予約状況" formaction="/reservation/index">
			</form>
			</div>
			<table id="routelistTable">
				<tr class="top">
					<th>路線ID</th>
					<th>出発</th>
					<th>到着</th>
					<th>運行開発日</th>
					<th>運行終了日</th>
					<th>料金</th>
					<th>バスID</th>
					<th>削除</th>
				</tr>
				<c:forEach items="${routeList}" var="route">
				<tr>
					<fmt:formatDate value="${route.scheduledDepartureTime}" pattern="HH:mm" var="sDTime"/>
					<fmt:formatDate value="${route.scheduledArrivalTime}" pattern="HH:mm" var="sATime"/>
					<td><c:out value="${route.routeId}"/></td>
					<td><c:out value="${route.departureId}(${sDTime})"/></td>
					<td><c:out value="${route.arrivalId}(${sATime})"/></td>
					<td><fmt:formatDate value="${route.operationStartDate}" pattern="yyyy年MM月dd日"/></td>
					<td><fmt:formatDate value="${route.operationEndDate}" pattern="yyyy年MM月dd日"/></td>
					<td><c:out value="${route.price}"/></td>
					<td><c:out value="${route.busId}"/></td>
					<td><a href="../routeDelete/confirm?routeId=${route.routeId}"><em class="fa fa-trash-o" style="font-size:24px"></em></a></td>
				</tr>
				</c:forEach>
 			</table>
			<form id="form2">
			<input class="updateButton" type="submit" value="変更" formaction="/routeUpdate/input">
			<input class="returnButton" type="submit" value="削除" formaction="/routeDelete/confirm">
			</form>
		</fieldset>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>