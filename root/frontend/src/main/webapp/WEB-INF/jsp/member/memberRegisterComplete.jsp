<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"> 
<header class="complete flex" style="background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url(../img/bus7.jpeg) center/cover no-repeat;">
	<div class="container">
		<div class="title">
			<h1>ご登録ありがとうございます。</h1>
			<p>早速お気に入れのツアーを選び、一緒に楽しみましょう！</p>
		</div>
		<form:form class="btn-form">
			<input class="reserve-btn" type="submit" value="路線検索"
				formaction="/routeSearch/index">
			<input class="return-btn" type="submit" value="ホームページ"
				formaction="/">
		</form:form>

	</div>
</header>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>