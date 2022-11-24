<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"> 
<title>路線検索</title>
<body style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.tiff) center/cover no-repeat;">
	<div class = "routeSearch flex">
		<div class = "container">
			<div class = "title">
				<h1>路線検索</h1>
			</div>
			<div class = "search-form2">
				<h2>路線選択</h2>
				<form class = "flex" action = "../routeSearch/search">
					<input type = "text" class = "form-control" placeholder = "出発地" name="departureStationName" oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "date" class = "form-control" placeholder = "Date" name="departureDate" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "text" class = "form-control" placeholder = "到着地" name="arrivalStationName" oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "submit" class = "btn" value = "検索" />
				</form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
</body>