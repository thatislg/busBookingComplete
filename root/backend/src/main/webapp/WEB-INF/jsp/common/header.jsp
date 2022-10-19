<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="header">
		<h1>バス予約システム管理画面</h1>
	</div>
	<div id="nav">
		<ul>
		<sec:authorize access="hasRole('ROLE_MANAGER')">
			<li><a href="/">トップ</a></li>
			<li><a href="/busList/index">バス管理</a></li>
			<li><a href="/logout">ログアウト</a></li>
		</sec:authorize>
		</ul>
	</div>
    <p style="margin:auto;width:200px;"><c:out value="${message}"/></p>
