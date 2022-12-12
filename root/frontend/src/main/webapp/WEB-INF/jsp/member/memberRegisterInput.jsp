<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="./css/register.css"/> 
	<div class = "regist-container">
		<div class="content regist-content">
			<div class="form">
				<h2>会員登録</h2>
				<form:form class="form-signin" modelAttribute="memberForm">	
					<small><form:errors class="err" path="*" element="p"/></small>
					<div class="input-form">
				  	 	<label for="memberName" class="form-label"><spring:message code="memberForm.memberName"/></label>
				   		<form:input path="memberName" placeholder="氏名を入力" id="memberName"/>
					 </div>
					 <div class="input-form">	
						<label for="phoneNumber" class="form-label"><spring:message code="memberForm.phoneNumber"/></label>
					   	<form:input path="phoneNumber"  placeholder="電話番号を入力"/>
					 </div>
				 	<div class="input-form">				 	
					  	<label for="mailAddress" class="form-label"><spring:message code="memberForm.mailAddress"/></label>
					   	<form:input path="mailAddress" placeholder="メールを入力" />
					 </div>
				 	<div class="input-form">
				   		<label for="loginId" class="form-label"><spring:message code="memberForm.loginId"/></label>
				   		<form:input path="loginId"  placeholder="ログインIDを入力"/>
				 	</div>			 	
				 	<div class="input-form">
				   		<label for="password" class="form-label"><spring:message code="memberForm.password"/></label>
				   		<form:password path="password"  placeholder="パスワードを入力"/>
					 </div>
				 	<div class="input-form">
				   		<label for="confirmPassword" class="form-label"><spring:message code="memberForm.confirmPassword"/></label>
				   		<form:password path="confirmPassword"  placeholder="パスワードを入力(確認)"/>
				 	</div>
				 	<div class="btn-form">		 	
				 		<input class="regist-btn" type="submit" value="登録" formaction="confirm"/> 
				 		<input class="return-btn" type="submit" value="戻る" formaction="/"/>
				 	</div>
				</form:form>
			</div>
		</div> 
	</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

    