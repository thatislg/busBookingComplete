<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"> 
<link rel="stylesheet" href="../css/normalize.css"> 
<link rel="stylesheet" href="../css/utility.css"> 
<link rel="stylesheet" href="../css/style.css"> 
<link rel="stylesheet" href="../css/responsive.css"> 
<title>VTI BUS</title>
</head>
<body>
	<!-- navbar -->
	<nav class ="navbar">
		<div class ="container flex">
			<a href = "" class = "site-brand">
				VTI<span>BUS</span>
			</a>
			
			<button type ="button" id = "navbar-show-btn" class = "flex">
				<i class = "fas fa-bars"></i>
			</button>
			<div id = "navbar-collapse">
				<button type = "button" id = "navbar-close-btn" class = "flex">
					<i class = "fas fa-times"></i>
				</button>
				<ul class = "navbar-nav">
					<li class = "nav-item">
						<a href = "/" class = "nav-link">ホーム</a>
					</li>
					<li class = "nav-item">
						<a href = "" class = "nav-link">会員登録</a>
					</li>
					<li class = "nav-item">
						<a href = "" class = "nav-link">ログイン</a>
					</li>	
				</ul>
			</div>
		</div>
	</nav>
	<!-- end of navbar -->
	
	<!-- header -->
	<header class = "flex">
		<div class = "container">
			<div class = "header-title">
				<h1>ENJOY YOUR JOURNEYS<br>ENJOY YOUR LIFE</h1>
				<p>心地良いバスに乗り、自分のツアーをより楽しくしよう！</p>
			</div>
			<div class = "header-form">
				<h2>路線検索結果</h2>
				<table id="routeSearchResult" class="content-table">
					<thead>
						<tr>
							<th>路線ID</th>
							<th>バスID</th>
							<th>出発</th>
							<th>到着</th>
							<th>出発日</th>
							<th>空席数</th>			
							<th>料金</th>
							<th>予約</th>
						</tr>
					 </thead>
					 <tbody>
					 	<c:choose>
		 					<c:when test="${not empty routeSearchResult}">
								<c:forEach items="${routeSearchResult}" var="route">
									<tr>
										<fmt:formatDate value="${route.scheduledDepartureTime}" pattern="HH:mm" var="sDTime"/>
										<fmt:formatDate value="${route.scheduledArrivalTime}" pattern="HH:mm" var="sATime"/>
										<td><c:out value="${route.routeId}"/></td>
										<td><c:out value="${route.busId}"/></td>
										<td><c:out value="${route.departureStationName}(${sDTime})"/></td>					
										<td><c:out value="${route.arrivalStationName}(${sATime})"/></td>
										<td>${param.departureDate}</td>
										<td>0</td>
										<td><c:out value="${route.price}"/></td>
										<td><a href="../route/reservationInput?busId=${route.busId}"><em class="fas fa-file-contract"></em></a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:when test="${empty routeSearchResult}">
								<style>.content-table{display: none;}</style>
		 						<span>検索結果はございません。</span>
		 					</c:when>
						</c:choose>
					</tbody>
				</table>	
			</div>
		</div>
	</header>
	<!-- header -->
	
	<!-- js -->
	<script src = "../js/script.js"></script>
	<!-- end of js -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
</body>
</html>
