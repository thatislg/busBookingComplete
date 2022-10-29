<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
	<div id="article">
		<form action="/busInsert/input">
			<input type="submit" value="新規登録">
		</form>
		<table>
			<tr>
				<th>ID</th>
				<th>ナンバープレート</th>
				<th><spring:message code="busForm.rowNum"/></th>
				<th><spring:message code="busForm.columnNum"/></th>
			</tr>
		<c:forEach items="${busList}" var="bus">
			<tr>
				<td><c:out value="${bus.busId}"/></td>
				<td><c:out value="${bus.numberPlace}${bus.numberDivision} ${bus.numberKana} ${bus.numberFirstHalf}-${bus.numberLatterHalf}"/></td>
				<td><c:out value="${bus.rowNum}"/></td>
				<td><c:out value="${bus.columnNum}"/></td>
			</tr>
		</c:forEach>
		</form>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
