<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" ></script>
<link rel="stylesheet" type="text/css" href="/css/login.css">

<div id="wrapper">	
	<div class="container">
		<div>
			<div class="card card-container shadow-lg" >
				<img id="profile-img" class="profile-img-card" src="https://www.tmc-creative.jp/works/images/bf64421e58f15749848583244cc66cbe85e7d73e.png" />
					<form:form class="form-signin" modelAttribute="loginForm" action="auth">
						<form:errors path="*"/>
						${SPRING_SECURITY_LAST_EXCEPTION.message}
					   	<form:input path="username" type="text" id="loginId" name="loginId" placeholder="ログインID" value=""/>
						<form:password path="password" placeholder="パスワード" name="password" required="required"  value="" />
		 				<input  type="submit" class="btn btn-primary btn-block mt-4 mb-4" value="ログイン"/>
		 			</form:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>