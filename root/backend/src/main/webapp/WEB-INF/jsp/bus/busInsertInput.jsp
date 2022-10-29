<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<style>
.insertButton{
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
		<form:form modelAttribute="busForm">	
			<fieldset>
			<legend class="insertTitle">バス登録</legend>
			<ul>
				<form:errors path="rowNum" element="p"/>
				<li><spring:message code="busForm.rowNum"/>:<form:input path="rowNum"/></li>
				<form:errors path="columnNum" element="p"/>
				<li><spring:message code="busForm.columnNum"/>:<form:input path="columnNum"/></li>
				<form:errors path="numberPlace" element="p"/>
				<li><spring:message code="busForm.numberPlace"/>:<form:input path="numberPlace"/></li>
				<form:errors path="numberDivision" element="p"/>
				<li><spring:message code="busForm.numberDivision"/>:<form:input path="numberDivision"/></li>
				<form:errors path="numberKana" element="p"/>
				<li><spring:message code="busForm.numberKana"/>:<form:input path="numberKana"/></li>
				<form:errors path="numberFirstHalf" element="p"/>
				<li><spring:message code="busForm.numberFirstHalf"/>:<form:input path="numberFirstHalf"/></li>
				<form:errors path="numberLatterHalf" element="p"/>
				<li><spring:message code="busForm.numberLatterHalf"/>:<form:input path="numberLatterHalf"/></li>			
			</ul>
			</fieldset>
			<input class="insertButton" type="submit" value="登録" formaction="confirm">
			<input class="returnButton" type="submit" value="戻る" formaction="/busList/index">
		</form:form>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

