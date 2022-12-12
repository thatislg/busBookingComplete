<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:out value="/css/login.css"/>"/> 
	<div class = "login-container">
		<div class="content">
			<div class="form">
				<form:form class="form-signin" modelAttribute="loginForm" action="auth">
					<h2>VTI-BUSへようこそ！</h2>
					<p>${SPRING_SECURITY_LAST_EXCEPTION.message}<p>
					<div class="input-form">
						<span>ログインID</span>
						<form:input path="username" type="text" id="loginId" name="loginId"
							placeholder="ログインID" value="" />
					</div>
					<div class="input-form">
						<span>パスワード</span>
						<form:password path="password" placeholder="パスワード" name="password"
							oninvalid="this.setCustomValidity('パスワードをご入力ください。')" onchange="this.setCustomValidity('')" required="required" value="" />
					</div>
					<div class="submit-btn">
						<input type="submit" class="login-btn" value="ログイン" />
					</div>
				</form:form>
				<form:form class="form-regist" action="/memberRegister/input">
					<h3>--会員登録をお持ちでない方--</h3>	
					<div class="submit-btn">
							<input type="submit" class="regist-btn" value="会員登録" />
					</div>
				</form:form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>