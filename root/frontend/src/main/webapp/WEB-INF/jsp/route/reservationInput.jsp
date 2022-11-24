<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"/>
	  
<!-- BEGIN  -->
<body style="background:linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus3.jpg) center/cover no-repeat;">
	<header class = "flex">
		<div class = "">
			<div class = "title">
				<h1>座席指定</h1>
			</div>
			<div>
			<div class = "header-form">
				<form:form class = "flex" modelAttributes="seatMap">
					<table class="content-table">
						<tr>
							<th>日付</th>
							<fmt:formatDate value="${reservedDepartureDate}" pattern="yyyy-MM-dd" var="rDDate"/>
							<td>${rDDate}</td>
						</tr>
						<tr>
							<th>出発</th>
							<td>${departureStationName.busStationName}</td>
						</tr>
						<tr>
							<th>到着</th>
							<td>${arrivalStationName.busStationName}</td>
						</tr>
					</table>
				</form:form>
			</div>
			<br>
			<div class="header-form">
				<table class="content-table">
					<tr>
						<th>1席あたりの料金</th>
						<td>¥${routeInfo.price}</td>
					</tr>
				</table>
			</div>
			</div>
			<br>			
			<div>
				予約する席を選択して、予約ボタンを押下してください。
			</div>
			<div class = "header-form" >	
				<form:form method="POST">
					<h2>座席選択</h2>
					<table style="border=1;">
						<c:set var="totalNumberSeat" value="0"/>
						<c:forEach begin="1" end="${busInfo.columnNum}" step="1" var="i">
							<tr>
								<c:forEach begin="1" end="${busInfo.rowNum}" step="1" var="j">
									<c:set var="totalNumberSeat" value="${totalNumberSeat + 1}"/>
									<c:set var="flag" value="${0}"/>
									<c:forEach items="${seatList}" var="seat">
										<c:choose>
											<c:when test="${seat.seatNumber == totalNumberSeat}">
												<c:set var="flag" value="${flag + 1}"/>
											</c:when>
											<c:when test="${seat.seatNumber != totalNumberSeat}">
												<c:set var="flag" value="${flag + 0}"/>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${flag == 0}">
											<td>
												<div class="form-check">
			  										<input class="form-check-input" type="checkbox" value="${totalNumberSeat}" id="flexCheckDefault" name="currentReservedSeat" >
			  										<label class="form-check-label" for="flexCheckDefault">
												   		<b> <c:out value="${totalNumberSeat}" /> </b>   空席
												  </label>
												</div>
											</td>
										</c:when>
										<c:when test="${flag != 0}">
											<td>
												<div class="form-check">
			  										<input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked disabled>
			  										<label class="form-check-label" for="flexCheckCheckedDisabled">
			   											 <b><c:out value="${totalNumberSeat}"/> 予約済 </b>  
			  										</label>
												</div>
											</td>
										</c:when>
									</c:choose>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
						<div>
						<form:form method="POST">
							<!--  <input type="hidden" name="currentReservedSeat" value="${currentReservedSeat}"/>-->
							<input type="hidden" name="departureDate" value="${rDDate}"/>
							<input type="hidden" name="routeId" value="${routeInfo.routeId}"/>
							<input type="hidden" name="busId" value="${busInfo.busId}"/>
							<input type="submit" class="btn" value="予約" formaction="/reservation/confirm"/>
						</form:form>
						<form:form>
							<input type="hidden" name="departureStationName" value="${inputedDepartureNameInfo}"/>
							<input type="hidden" name="departureDate" value="${rDDate}"/>
							<input type="hidden" name="arrivalStationName" value="${inputedArrivalNameInfo}"/>
							<input type="submit" class="btn" value="戻る" formaction="../routeSearch/search"/>
						</form:form>
						</div>
				</form:form>
			</div>
		</div>
	</header>
<!-- END  -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>