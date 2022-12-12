<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:out value="/css/style.css"/>"/>
	<header class = "flex" style="background:linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>座席指定</h1> 
			</div>
				<div class = "seat-infor">
				<h2>路線情報</h2>
					<form:form modelAttributes="seatMap">
						<table class="seat-info-table">
							<tr>
								<th>日付</th>
								<fmt:formatDate value="${searchResultForm.departureDate}" pattern="yyyy-MM-dd" var="rDDate"/>
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
							<tr>
								<th>1席あたりの料金</th>
								<td>¥${routeInfo.price}</td>
							</tr>
						</table>
					</form:form>
				</div>
			<br>			
			<h2>
				座席をご選択ください
			</h2>
			<div class = "seat-form">
			<h2>座席図</h2>	
				<form:form method="POST">
					<table  class="seat-check-table">
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
		  										<input class="form-check-input" type="checkbox" value="${totalNumberSeat}" id="flexCheckDefault${totalNumberSeat}" name="currentReservedSeat" >
		  										<label class="form-check-label" for="flexCheckDefault${totalNumberSeat}">
											   		 <c:out value="${totalNumberSeat}" />
											 	</label>
											</td>
										</c:when>
										<c:when test="${flag != 0}">
											<td>
		  										<input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked disabled/>
		  										<label class="form-check-label" for="flexCheckCheckedDisabled">
		   											 <c:out value="${totalNumberSeat}"/>  
		  										</label>												
											</td>
										</c:when>
									</c:choose>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
						<div class="btn-form">
						<form:form method="POST">
							<input type="submit" class="reserve-btn" value="予約" formaction="/reservation/confirm"/>
						</form:form>
						<form:form>
							<input type="hidden" name="departureDate" value="${rDDate}"/>
							<input type="hidden" name="departureStationName" value="${searchResultForm.searchedDepartureName}"/>
							<input type="hidden" name="arrivalStationName" value="${searchResultForm.searchedArrivalName}"/>
							<input type="submit" class="return-btn" value="戻る" formaction="../routeSearch/search"/>
						</form:form>
						</div>
				</form:form>
			</div>
		</div>
		
	</header>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>