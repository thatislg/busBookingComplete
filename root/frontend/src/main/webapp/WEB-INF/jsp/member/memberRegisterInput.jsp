<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/register.css"/> 
    
<body>
	<div class="content">
		<div class="form">
			<c:out value="${message}"></c:out>
			<form:form class="form-signin" modelAttribute="memberForm">	
				<h2>会員登録</h2>
				<div class="input-form">
					<form:errors path="memberName" element="p"/>
			  	 	<label for="memberName" class="form-label"><spring:message code="memberForm.memberName"/></label>
			   		<form:input path="memberName" class="form-control" placeholder="氏名を入力"/>
				 </div>
				 <div class="input-form">	
			 		<form:errors path="phoneNumber" element="p"/>
					<label for="phoneNumber" class="form-label"><spring:message code="memberForm.phoneNumber"/></label>
				   	<form:input path="phoneNumber" class="form-control" placeholder="電話番号を入力"/>
				 </div>
			 	<div class="input-form">				 	
			 		<form:errors path="mailAddress" element="p"/>
				  	<label for="mailAddress" class="form-label"><spring:message code="memberForm.mailAddress"/></label>
				   	<form:input path="mailAddress" class="form-control" placeholder="メールを入力" />
				 </div>
			 	<div class="input-form">
			 		<form:errors path="loginId" element="p"/>
			 		<p><c:out value="${errMsg2 }"></c:out></p>
			   		<label for="loginId" class="form-label"><spring:message code="memberForm.loginId"/></label>
			   		<form:input path="loginId" class="form-control" placeholder="ログインIDを入力"/>
			 	</div>			 	
			 	<div class="input-form">
				 		<form:errors path="password" element="p"/>
				 		<p><c:out value="${errMsg }"></c:out></p>
				   		<label for="password" class="form-label"><spring:message code="memberForm.password"/></label>
				   		<form:password path="password" class="form-control" placeholder="パスワードを入力"/>
				 </div>
			 	<div class="input-form">
			 		<form:errors path="confirmPassword" element="p"/>
			   		<label for="confirmPassword" class="form-label"><spring:message code="memberForm.confirmPassword"/></label>
			   		<form:password path="confirmPassword" class="form-control" placeholder="パスワードを入力(確認)"/>
			 	</div>
			 	
			 		<input class="registBtn" type="submit" value="登録" formaction="confirm"/> 
			 		<input class="returnBtn" type="submit" value="戻る" formaction="/loginOrMemberRegister"/>
			 	
			</form:form>
		</div>
	</div> 
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

    