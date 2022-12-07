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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"> 
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">">
		<a class="navbar-brand" href="/login">
		<img src="../img/VTI BUS.png" alt="Avatar Logo" style="width: 60px;height: 50px;" class="rounded-pill" />
		</a>
		<div class="collapse navbar-collapse" id="mynavbar">
		<ul class="navbar-nav me-auto">
			<sec:authorize access="hasRole('ROLE_MANAGER')">
				<li class="nav-item"><a class="nav-link" href="/busList/index"><i class="fa-solid fa-bus" style="font-size:18px"></i>バス管理</a></li>
				<li class="nav-item"><a class="nav-link" href="/routeList/index"><i class="fa-solid fa-route" style="font-size:18px"></i> 路線管理</a></li>
				<li class="nav-item"><a class="nav-link" href="/memberList/index"><i class="fa-solid fa-user" style="font-size:18px"></i> 会員管理</a></li>
			</sec:authorize>
		</ul>
		<form class="d-flex" action="/login">
			<button type="submit" class="btn btn-outline-primary"><i class="fa-solid fa-right-from-bracket"></i>ログアウト</button>
		</form>
		</div>
	</div>
	</nav>
	<p style="margin: auto; width: 200px; color:red"><c:out value="${message}" /></p>
 </body>
	