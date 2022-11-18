<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
  <jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/normalize.css"> 
<link rel="stylesheet" href="../css/utility.css"> 
<link rel="stylesheet" href="/css/style2.css"> 
<link rel="stylesheet" href="../css/responsive.css"> 
<title>路線検索結果</title>
<body>
	
	<!-- header -->
	<header class = "flex">
		<div class = "container">
			<div class = "header-title">
				<h1>路線検索結果</h1>
			</div>
			<div class = "header-form">
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
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
</body>
</html>
