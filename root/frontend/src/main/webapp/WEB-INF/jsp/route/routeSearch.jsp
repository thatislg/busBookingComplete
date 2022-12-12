<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<!-- <link rel="stylesheet" href="./css/style.css">  -->
<link rel="stylesheet" href="http://localhost:9082/css/style.css"/>
<title>路線検索</title>
	<div class = "routeSearch flex" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>路線検索</h1>
			</div>
			<div class = "search-form2">
				<form class = "flex" action = "../routeSearch/search" id="search-form">
					<select class = "form-control" name="departurePrefecture" id="departurePrefecture-select" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required>
					    <option value="">--出発地--</option>
					    <c:forEach items="${prefectureList}" var="pf">
					    	<option value="${pf.prefecture}"><c:out value="${pf.prefecture}"/></option>
					 	</c:forEach>
					</select>
					<input type = "text" onfocus="(this.type='date')" min="${today}" max="${nMonth}" class = "form-control" placeholder = "出発日" name="departureDate" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required/>
					<select class = "form-control" name="arrivalPrefecture" id="arrivalPrefecture-select" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required>
					    <option value="">--到着地--</option>
					    <c:forEach items="${prefectureList}" var="pf">
					    	<option value="${pf.prefecture}"><c:out value="${pf.prefecture}"/></option>
					 	</c:forEach>
					</select>
					<button type="submit" form="search-form" class="btn"><i class="fa-solid fa-magnifying-glass"> 検索</i></button>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>