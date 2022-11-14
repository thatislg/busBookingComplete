<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"rel="stylesheet">
<link rel="stylesheet"href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<section>
<div class="img-bg">
     <img src="../img/VTI BUS.png" alt="Logo image">
</div>
<div>
<form:form class="form-signin" modelAttribute="loginForm" action="auth">
	<div class="input-form">
	<form:errors path="*" />
						${SPRING_SECURITY_LAST_EXCEPTION.message}
					   	<form:input path="username" type="text" id="loginId"
		name="loginId" placeholder="ログインID" value="" />
	<form:password path="password" placeholder="パスワード" name="password"
		required="required" value="" />
	<input type="submit" class="btn btn-primary btn-block mt-4 mb-4"
		value="ログイン" />
</form:form>
</div>

</section>
</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>