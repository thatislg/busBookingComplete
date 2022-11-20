<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	  rel="stylesheet">
<!-- BEGIN  -->
Người đang đăng nhập là :<c:out value="${currentLoginId}"/>
<!-- END  -->
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>