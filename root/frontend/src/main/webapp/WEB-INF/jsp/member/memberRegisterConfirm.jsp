<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/formLayout.css">

<div class="container mt-3">
	<div class="shadow-lg">
		<h1>会員登録確認</h1>
		<div>
			<div class="row g-3">
				<div class="col-md-4">
					<spring:message code="memberForm.memberName"/>:<c:out value="${memberForm.memberName}"/>
				</div>
				<div class="col-md-4">	
					<spring:message code="memberForm.phoneNumber"/>:<c:out value="${memberForm.phoneNumber}"/>
				</div>
			</div>
			<div class="row g-3">
		 		<div class="col-md-4">
					<spring:message code="memberForm.mailAddress"/>:<c:out value="${memberForm.mailAddress}"/>
				</div>
				<div class="col-md-4">
					<spring:message code="memberForm.loginId"/>:<c:out value="${memberForm.loginId}"/>
				</div>
			</div>
			<div class="row g-3">
				<div class="col-md-4">
					<spring:message code="memberForm.password"/>:<c:out value="${memberForm.password}"/>
				</div>
			</div>
			<form:form modelAttribute="memberForm">
				<form:hidden path="memberName"/>
				<form:hidden path="phoneNumber"/>
				<form:hidden path="mailAddress"/>
				<form:hidden path="loginId"/>
				<form:hidden path="password"/>
				<input class="btn btn-primary ms-5" type="submit" value="ＯＫ" formaction="insert">
				<input class="btn btn-dark" type="submit" value="戻る" formaction="input">
			</form:form>		
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
