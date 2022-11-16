<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VTI BUS</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/utility.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/login.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<sec:authorize access="hasRole('ROLE_MEMBER')">
	<!-- navbar -->
	<nav class="navbar">
		<div class="container flex">
			<a href="" class="site-brand"> VTI<span>BUS</span>
			</a>
			<button type="button" id="navbar-show-btn" class="flex">
				<i class="fas fa-bars"></i>
			</button>
			<div id="navbar-collapse">
				<button type="button" id="navbar-close-btn" class="flex">
					<i class="fas fa-times"></i>
				</button>
				<ul class="navbar-nav">
					<li class="nav-item"><a href="/" class="nav-link">ホーム</a></li>
					<li class="nav-item"><a href="reservation/index" class="nav-link">予約一覧</a></li>
					<li class="nav-item"><a href="/memberRegister/input" class="nav-link">路線検索</a></li>
					<li class="nav-item"><form:form action="/logout"
							name="logoutForm" id="logoutForm" style="display:inline-flex">
							<a href="javascript:logoutForm.submit()">ログアウト</a>
						</form:form></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- end of navbar -->
</sec:authorize>

<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<!-- navbar -->
	<nav class="navbar">
		<div class="container flex">
			<a href="" class="site-brand"> VTI<span>BUS</span>
			</a>
			<button type="button" id="navbar-show-btn" class="flex">
				<i class="fas fa-bars"></i>
			</button>
			<div id="navbar-collapse">
				<button type="button" id="navbar-close-btn" class="flex">
					<i class="fas fa-times"></i>
				</button>
				<ul class="navbar-nav">
					<li class="nav-item"><a href="/" class="nav-link">ホーム</a></li>
					<li class="nav-item"><a href="/memberRegister/input" class="nav-link">路線検索</a></li>
					<li class="nav-item"><a href="/memberRegister/input" class="nav-link">会員登録</a></li>
					<li class="nav-item"><a href="/login" class="nav-link">ログイン</a></li>
				
				</ul>
			</div>
		</div>
	</nav>
	<!-- end of navbar -->
</sec:authorize>
