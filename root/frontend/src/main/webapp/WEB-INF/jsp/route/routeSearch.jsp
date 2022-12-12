<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="./css/style.css"> 
<title>路線検索</title>
	<div class = "routeSearch flex" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus6.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>路線検索</h1>
			</div>
			<div class = "search-form2">
				<form class = "flex" action = "../routeSearch/search" id="search-form">
					<input type = "text" class = "form-control" placeholder = "出発地（都道府県）" name="departurePrefecture" oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "text" onfocus="(this.type='date')" min="${today}" max="${nMonth}"  class = "form-control" placeholder = "出発日" name="departureDate" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "text" class = "form-control" placeholder = "到着地（都道府県）" name="arrivalPrefecture" oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<button type="submit" form="search-form" class="btn"><i class="fa-solid fa-magnifying-glass"> 検索</i></button>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
