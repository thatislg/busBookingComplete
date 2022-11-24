<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css" />

<header class="flex"
	style="background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url(../img/background9.jpg) center/cover no-repeat;">
	<div class="container">
		<div class="title">
			<h1>ご登録ありがとうございます。</h1>
			<p>心地良いバスに乗り、自分のツアーを最も楽しもう！</p>
		</div>
		<form:form>
			<input class="btn btn-primary ms-5" type="submit" value="路線検索"
				formaction="/routeSearch/index">
			<input class="btn btn-dark" type="submit" value="ホームページ"
				formaction="/">
		</form:form>

	</div>
</header>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>