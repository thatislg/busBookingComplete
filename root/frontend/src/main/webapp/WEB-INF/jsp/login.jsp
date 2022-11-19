<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<link rel="stylesheet" href="css/login.css"/>

<body>
	<div class="content">
		<div class="form">
			<form:form class="form-signin" modelAttribute="loginForm"
				action="auth">
				<h2>WELCOME TO VTI-BUS</h2>
				<div class="input-form">
					<span>LOGIN ID</span>
					<form:errors path="*" />
					${SPRING_SECURITY_LAST_EXCEPTION.message}
					<form:input path="username" type="text" id="loginId" name="loginId"
						placeholder="ログインID" value="" />
				</div>
				<div class="input-form">
					<span>PASSWORD</span>
					<form:password path="password" placeholder="パスワード" name="password"
						required="required" value="" />
				</div>
				<div class="input-form">
					<input type="submit" class="btn btn-primary btn-block mt-4 mb-4"
						value="ログイン" />
				</div>
			</form:form>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
</body>