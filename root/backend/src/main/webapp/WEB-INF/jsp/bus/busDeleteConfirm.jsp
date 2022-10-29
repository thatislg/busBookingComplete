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
	  <dt>シート列数</dt>
	  	<dd>$c:out value="${busInfo.rowNum}"/></dd>
	  <dt>１列あたりシート数</dt>
	  	<dd><c:out value="${busInfo.columnNum}"/></dd>
	  <dt>ナンバープレート</dt>
	  	<dd><c:out value="${busInfo.numberPlace}"/></dd>
	</dl>

	<form>
		<input class="okButton" type="submit" value="ＯＫ" formaction="/busDelete/delete?busId=${busId}">
		<input class="returnButton" type="submit" value="戻る" formaction="/busList/index">
	</form>


<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>