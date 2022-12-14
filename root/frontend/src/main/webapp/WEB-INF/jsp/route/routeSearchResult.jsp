<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:out value="/css/style.css"/>"/>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/material-components-web/4.0.0/material-components-web.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.material.min.css"/>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/dataTables.material.min.js"></script>
<script type="text/javascript" charset="utf8" src="<c:url value="/js/datatables.js"/>"></script>
<title>路線検索結果</title>
	<header class = "flex"  style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>路線検索結果</h1>			
			</div>
			<div class = "search-form">
				<form class = "flex" action = "../routeSearch/search" name="searchForm" id="search-form">
					<select class = "form-control-2" name="departurePrefecture" id="departurePrefecture-select" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required>
					    <option value="${param.departurePrefecture}">${param.departurePrefecture}</option>
					    <c:forEach items="${prefectureList}" var="pf">
					    	<option value="${pf.prefecture}"><c:out value="${pf.prefecture}"/></option>
					 	</c:forEach>
					</select>
					<input type = "date" class = "form-control-2" value="${param.departureDate}" min="${today}" max="${nMonth}" name="departureDate"/>
					<select class = "form-control-2" name="arrivalPrefecture" id="arrivalPrefecture-select" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required>
					    <option value="${param.arrivalPrefecture}">${param.arrivalPrefecture}</option>
					    <c:forEach items="${prefectureList}" var="pf">
					    	<option value="${pf.prefecture}"><c:out value="${pf.prefecture}"/></option>
					 	</c:forEach>
					</select>
					<button type="submit" form="search-form" class="btn"><i class="fa-solid fa-magnifying-glass"> 検索</i></button>
				</form>
			</div>
			<br>
			<h2>路線選択</h2>
			<div class = "data-table-form">
				<table id="dataTable" class="list-table">
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
																&searchedDepartureName=${route.departureStationName}
																&searchedArrivalName=${route.arrivalStationName}">
									<i class="fa-solid fa-file-contract"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
		</div>
	</header>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

