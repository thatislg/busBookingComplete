<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" ></script>

 <style>
.card {
	background-color: #F7F7F7;
	padding: 46px 39px 45px;
	margin: 0 auto 30px;
	margin-top: 55px;
	border-radius: 60px;
}

.profile-img-card {
	width: 80%;
	margin: 0 auto 25px;
}

#wrapper {
	padding-bottom: 60px;
}

.form-signin #inputEmail, .form-signin #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 16px;
}

.form-signin input[type=email], .form-signin input[type=password],
	.form-signin input[type=text], .form-signin input[type=submit] {
	width: 100%;
	margin-bottom: 12px;
}

.container {
	max-width: 430px;
}
</style>
<div id="wrapper">	
	<div class="container">
		<div>
			<div class="card card-container" >
				<img id="profile-img" class="profile-img-card" src="https://www.tmc-creative.jp/works/images/bf64421e58f15749848583244cc66cbe85e7d73e.png" />
					<form:form class="form-signin" modelAttribute="loginForm" action="auth">
					<form:errors path="*"/>
					${SPRING_SECURITY_LAST_EXCEPTION.message}
				   	<form:input path="username" type="text" id="loginId" name="loginId" placeholder="ログインID" value=""/>
					<form:password path="password" placeholder="パスワード" name="password" required="required"  value="" />
			<div class="form-check d-flex justify-content-center mb-4">
			<input class="form-check-input me-2" type="checkbox" value="" checked />
		    <label class="form-check-label">
		    	I have read and agree to the terms
		    </label>
		 	</div>
		 	<input  type="submit" class="btn btn-primary btn-block mb-4" value="ログイン"/>
		 	</form:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>