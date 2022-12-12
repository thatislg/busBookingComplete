<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>VTI BUS</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<link rel="stylesheet" href="./css/normalize.css"/>
<link rel="stylesheet" href="./css/utility.css"/>

</head>
<body>
	<!-- navbar -->
	<nav class="navbar">
		<div class="container flex">
			<a href="/" class="site-brand"> VTI<span>BUS</span>
			</a>
			<ul class="navbar-nav">
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li class="nav-item"><a href="/" class="nav-link">ホーム</a></li>
					<li class="nav-item"><a href="/guideInfor" class="nav-link">ご利用案内</a></li>
					<li class="nav-item"><a href="/reservation/index" class="nav-link">予約一覧</a></li>		
					<li class="nav-item"><a href="/routeSearch/index" class="nav-link">路線検索</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout">
						<i class="userName"><b><sec:authentication property="principal.login.memberName"/></b></i>様  ログアウト</a>
					</li>
				</sec:authorize>
					
				<sec:authorize access="!hasRole('ROLE_MEMBER')">
					<li class="nav-item"><a href="/" class="nav-link">ホーム</a></li>
					<li class="nav-item"><a href="/guideInfor" class="nav-link">ご利用案内</a></li>
					<li class="nav-item"><a href="/routeSearch/index" class="nav-link">路線検索</a></li>
					<li class="nav-item"><a href="/memberRegister/input" class="nav-link">会員登録</a></li>
					<li class="nav-item"><a href="/login" class="nav-link">ログイン</a></li>
				</sec:authorize>
			</ul>
		</div>

	</nav>
	<!-- end of navbar -->
