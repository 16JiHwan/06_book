<%@page import="org.apache.jasper.tagplugins.jstl.core.Choose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 메인</title>
</head>
<body>
<!-- contextPath 경로 요청객체에 속성으로 추가 -->
<!-- 인클루드 방식은 요청객체를 계속 유지함 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" scope="request" />
<table border="1px">
	<tr>
		<td colspan="2">
			<jsp:include page="/header" />
		</td>
	</tr>
	<tr>
		<td>
			<jsp:include page="/menu" />
		</td>
		<td>
			<c:choose>
				<c:when test="${empty requestScope.content }">
					초기화 화면입니다.
				</c:when>
				<c:otherwise>
					<jsp:include page="${content }"></jsp:include>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="/footer" />
		</td>
	</tr>
</table>
</body>
</html>