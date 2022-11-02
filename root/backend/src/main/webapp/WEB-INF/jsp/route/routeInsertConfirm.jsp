<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
.okButton{
margin-top: 20px;
}
.insertTitle{
font-size:30px ;
font-weight: bold;
}
#section{
width: 960px;
margin: 0 auto;
}
</style>
<div id="section">
	<div id="article">
			<fieldset>
			<legend class="insertTitle">路線登録確認</legend>
			<ul>
				<li><spring:message code="busForm.rowNum"/>:<c:out value="${busForm.rowNum}"/></li>
				<li><spring:message code="busForm.columnNum"/>:<c:out value="${busForm.columnNum}"/></li>
				<li><spring:message code="busForm.numberPlace"/>:<c:out value="${busForm.numberPlace}"/></li>
				<li><spring:message code="busForm.numberDivision"/>:<c:out value="${busForm.numberDivision}"/></li>
				<li><spring:message code="busForm.numberKana"/>:<c:out value="${busForm.numberKana}"/></li>
				<li><spring:message code="busForm.numberFirstHalf"/>:<c:out value="${busForm.numberFirstHalf}"/></li>
				<li><spring:message code="busForm.numberLatterHalf"/>:<c:out value="${busForm.numberLatterHalf}"/></li>			
			</ul>
			</fieldset>
	</div>
	<form:form modelAttribute="busForm">
		<form:hidden path="rowNum"/>
		<form:hidden path="columnNum"/>
		<form:hidden path="numberPlace"/>
		<form:hidden path="numberDivision"/>
		<form:hidden path="numberKana"/>
		<form:hidden path="numberFirstHalf"/>
		<form:hidden path="numberLatterHalf"/>
		<input class="okButton" type="submit" value="ＯＫ" formaction="insert">
		<input class="returnButton" type="submit" value="戻る" formaction="input">
	</form:form>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
