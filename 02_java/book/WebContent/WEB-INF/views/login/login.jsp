<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Login</title>
	<style type="text/css">
		table, th, td {
			border: 1px solid black;
		}
	</style>
</head>
<body>
<h3>도서관리 시스템 로그인</h3>
<h4>로그인 된 사용자 아이디 : ${sessionScope.userId }</h4>
<form action="${contextPath }/main?action=login" method="post">
	<table>
		<tr>
			<th>관리자 아이디</th>
			<td>
				<input type="text" name="userId" required="required" />
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="password" required="required" />
			</td>
		</tr>
		<tr>
	 		<th colspan="2">
	 			<input type="reset" value="초기화" />
				<input type="submit" value="제출" />
	 		</th>
<!-- 			<td></td> -->
		</tr>
	</table>
</form>
</body>
</html>