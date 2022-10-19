<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<div id="section">
	<div id="article">
		<form:form modelAttribute="busForm">
			<dl>
				<dt><spring:message code="busForm.rowNum"/></dt>
				<dd>
					<form:errors path="rowNum" element="p"/>
					<form:input path="rowNum"/>
				</dd>
				<dt><spring:message code="busForm.columnNum"/></dt>
				<dd>
					<form:errors path="columnNum" element="p"/>
					<form:input path="columnNum"/>
				</dd>
				<dt><spring:message code="busForm.numberPlace"/></dt>
				<dd>
					<form:errors path="numberPlace" element="p"/>
					<form:input path="numberPlace"/>
				</dd>
				<dt><spring:message code="busForm.numberDivision"/></dt>
				<dd>
					<form:errors path="numberDivision" element="p"/>
					<form:input path="numberDivision"/>
				</dd>
				<dt><spring:message code="busForm.numberKana"/></dt>
				<dd>
					<form:errors path="numberKana" element="p"/>
					<form:input path="numberKana"/>
				</dd>
				<dt><spring:message code="busForm.numberFirstHalf"/></dt>
				<dd>
					<form:errors path="numberFirstHalf" element="p"/>
					<form:input path="numberFirstHalf"/>
				</dd>
				<dt><spring:message code="busForm.numberLatterHalf"/></dt>
				<dd>
					<form:errors path="numberLatterHalf" element="p"/>
					<form:input path="numberLatterHalf"/>
				</dd>
			</dl>
			<input type="submit" value="登録" formaction="confirm">
			<input type="submit" value="戻る" formaction="/busList/index">
		</form:form>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
