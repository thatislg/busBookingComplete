<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/material-components-web/4.0.0/material-components-web.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.material.min.css"/>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/dataTables.material.min.js"></script>

<title>路線検索結果</title>
<body style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.jpg) center/cover no-repeat;">
	<header class = "flex">
		<div class = "container">
			<div class = "title">
				<h1>路線検索結果</h1>
			</div>
			<div class = "search-form">
				<form class = "flex" action = "../routeSearch/search" name="searchForm">
					<input type = "text" class = "form-control-2" value="${param.departureStationName}" name="departureStationName"  oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "date" class = "form-control-2" value="${param.departureDate}" name="departureDate" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "text" class = "form-control-2" value="${param.arrivalStationName}" name="arrivalStationName"  oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "submit" class = "btn" value = "検索"/>
				</form>
			</div>
			<br>
			<h2>路線選択</h2>
			<div class = "data-table-form">
				<table id="routeSearchResult" class="list-table">
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
																&searchedDepartureName=${inputedDepartureNameInfo}
																&searchedArrivalName=${inputedArrivalNameInfo}">
									<em class="fas fa-file-contract"></em></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
		</div>
	</header>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

