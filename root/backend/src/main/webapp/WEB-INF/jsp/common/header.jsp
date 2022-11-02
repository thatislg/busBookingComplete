<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" ></script>
 

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<a class="navbar-brand" href="/">
		<img src="https://www.tmc-creative.jp/works/images/bf64421e58f15749848583244cc66cbe85e7d73e.png" alt="Avatar Logo" style="width:70px;" class="rounded-pill" />
		</a>
		<div class="collapse navbar-collapse" id="mynavbar">
		<ul class="navbar-nav me-auto">
			<sec:authorize access="hasRole('ROLE_MANAGER')">
				<li class="nav-item"><a class="nav-link" href="/busList/index">バス管理</a></li>
				<li class="nav-item"><a class="nav-link" href="/routeList/index">路線管理</a></li>
				<li class="nav-item"><a class="nav-link" href="/memberList">会員管理</a></li>
			</sec:authorize>
		</ul>
		<form class="d-flex" action="/login">
		<input class="btn btn-outline-primary" type="submit" value="ログアウト">
		</form>
		</div>
	</div>
	</nav>
	<p style="margin: auto; width: 200px;"><c:out value="${message}" /></p>
 </body>
	