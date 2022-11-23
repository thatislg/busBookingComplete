<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"> 

<title>路線検索</title>
<body style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus4.jpg) center/cover no-repeat;">
	
	<!-- header -->
	<header class = "flex">
		<div class = "container">
			<div class = "title">
				<h1>路線検索</h1>
			</div>
			<div class = "search-form">
				<h2>路線選択</h2>
				<form class = "flex" action = "../routeSearch/search" name="searchForm">
					<input type = "text" class = "form-control" value="${param.departureStationName}" name="departureStationName"  oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "date" class = "form-control" value="${param.departureDate}" name="departureDate" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "text" class = "form-control" value="${param.arrivalStationName}" name="arrivalStationName"  oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "submit" class = "btn" value = "検索"/>
				</form>
			</div>
			<br>
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
										<td><c:out value="${route.availableSeats}"/></td>
										<td><c:out value="${route.price}"/></td>
										<td><a href="../reservation/input?departureDate=${param.departureDate}
																		&routeId=${route.routeId}
																		&busId=${route.busId}
																		&inputedDepartureName=${inputedDepartureNameInfo}
																		&inputedArrivalName=${inputedArrivalNameInfo}">
											<em class="fas fa-file-contract"></em></a></td>
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

