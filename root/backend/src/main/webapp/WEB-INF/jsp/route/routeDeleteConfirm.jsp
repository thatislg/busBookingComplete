<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<style>
.okButton{
margin-top: 20px;
}
.insertTitle{
font-size:30px ;
font-weight: bold;
}
#section{
width: 960px;
margin: 0 auto;
}
</style>
	
	<dl>
	  <dt>路線ID</dt>
	  	<dd><c:out value="${routeInfo.routeId}"/></dd>
	  <dt>出発停留所</dt>
	  	<dd><c:out value="${routeInfo.departureId}"/></dd>
	  <dt>到着停留所</dt>
	  	<dd><c:out value="${routeInfo.arrivalId}"/></dd>
	</dl>

	<form style="float:left">
	   <input type="hidden" name="routeId" value="${routeInfo.routeId}">
	   <input class="okButton" type="submit" value="ＯＫ" formaction="/routeDelete/delete">
	 &nbsp;
	</form>
	<form >
		<input class="okButton" type="submit" value="戻る" formaction="/routeList/index">
	</form>
		
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>