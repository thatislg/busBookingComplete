<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/register.css"/> 
<body>
	<div class="confirm-flex">
		<div class="content confirm-content">
			<div class="form">
				<h2>会員登録確認</h2>
				<table class="regist-confirm">
					<tr>
						<th><spring:message code="memberForm.memberName"/></th>
						<td><c:out value="${memberForm.memberName}"/></td>
					</tr>
					<tr>
						<th><spring:message code="memberForm.phoneNumber"/></th>
						<td><c:out value="${memberForm.phoneNumber}"/></td>
					</tr>
					<tr>
						<th><spring:message code="memberForm.mailAddress"/></th>
						<td><c:out value="${memberForm.mailAddress}"/></td>
					</tr>
					<tr>
						<th><spring:message code="memberForm.loginId"/></th>
						<td><c:out value="${memberForm.loginId}"/></td>
					</tr>
					<tr>
						<th><spring:message code="memberForm.password"/></th>
						<td><c:out value="${memberForm.password}"/></td>
					</tr>
				</table>	
				<div class="btn-form">
					<form:form modelAttribute="memberForm">
						<form:hidden path="memberName"/>
						<form:hidden path="phoneNumber"/>
						<form:hidden path="mailAddress"/>
						<form:hidden path="loginId"/>
						<form:hidden path="password"/>
						<input class="regist-btn" type="submit" value="登録確認" formaction="insert">
						<input class="return-btn" type="submit" value="戻る" formaction="input">
					</form:form>
				</div>
				
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>



