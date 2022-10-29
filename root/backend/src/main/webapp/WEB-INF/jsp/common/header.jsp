<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#hu {
	text-align: center;
	margin:0;
}

.hl {
	display: inline-block;
	width: 222px;
	background-color: white;
	margin-left: 0.5em;
	border: 2px solid darkblue;
	text-align: center;
	border-radius: 15px;
	height: 2em;
	position: relative;
	bottom: 78px;
}

.loginButton, .insertButton, .deleteButton, .logoutButton, .returnButton,.okButton{
	border: 2px solid darkblue;
	background-color: #82c5eb;
	border-radius: 13px;
	width: 11em;
	height: 3.5em;
	font-weight: bold;
}

.logoutButton {
	position: relative;
	left: 115em;
}

.logoImg {
	width: 190px;
	border: 2px solid darkblue;
	border-radius: 15px;
}

#nav {
	margin-bottom: 2em;
	padding: 0;
	border-bottom: 2px dashed deepskyblue;
	background-color: lightblue;
}

#nav {
	
}

.logoLink {
	margin-left: 7em;
	position: relative;
	top: 16px;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<div id="nav">
		<form id="logout" action="/login">
		<input class="logoutButton" type="submit" value="ログアウト">
	</form>
		<a class="logoLink" href="/"><img class="logoImg"
			src="https://www.tmc-creative.jp/works/images/bf64421e58f15749848583244cc66cbe85e7d73e.png" /></a>
		<ul id="hu">
			<sec:authorize access="hasRole('ROLE_MANAGER')">
				<li class="hl"><a href="/busList/index">バス管理</a></li>
				<li class="hl"><a href="/routeList/index">路線管理</a></li>
				<li class="hl"><a href="/memberList">会員管理</a></li>
			</sec:authorize>
		</ul>
	</div>
	<p style="margin: auto; width: 200px;"><c:out value="${message}" /></p>