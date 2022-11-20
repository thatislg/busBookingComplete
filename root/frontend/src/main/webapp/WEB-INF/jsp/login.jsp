<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/login.css"/> 
<body>
	<div class="content">
		<div class="form">
			<form:form class="form-signin" modelAttribute="loginForm" action="auth">
				<h2>VTI-BUSへようこそ！</h2>
				<div class="input-form">
					<span>ログインID</span>
					<form:errors path="*" />
					${SPRING_SECURITY_LAST_EXCEPTION.message}
					<form:input path="username" type="text" id="loginId" name="loginId"
						placeholder="ログインID" value="" />
				</div>
				<div class="input-form">
					<span>パスワード</span>
					<form:password path="password" placeholder="パスワード" name="password"
						required="required" value="" />
				</div>
				<div class="input-form">
					<input type="submit" class="loginBtn" value="ログイン" />
				</div>
			</form:form>
			<form:form action="/memberRegister/input">
				<h3>--会員ではない方--</h3>	
				<div class="input-form">
						<input type="submit" class="registBtn" value="会員登録" />
				</div>
			</form:form>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
</body>