<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VTI BUS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/utility.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
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
					<li class="nav-item"><a href="/reservation/index" class="nav-link">予約一覧</a></li>
					<li class="nav-item"><a href="/routeSearch/search" class="nav-link">路線検索</a></li>
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
					<li class="nav-item"><a href="/routeSearch/index" class="nav-link">路線検索</a></li>
					<li class="nav-item"><a href="/memberRegister/input" class="nav-link">会員登録</a></li>
					<li class="nav-item"><a href="/login" class="nav-link">ログイン</a></li>
				
				</ul>
			</div>
		</div>
	</nav>
	<!-- end of navbar -->
</sec:authorize>
