<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<img src="${pageContext.request.contextPath }/images/logo.png">
	<c:if test="${not empty sessionScope.userId }">
	<div id="result">${sessionScope.userId } 로그인 중</div>
	</c:if>
</body>
</html>