<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
</head>
<body>
	<!-- /main?action=update&bookSeq=1 -->
	<form action="${contextPath }main" method="get">
		<table>
			<tr>
				<th colspan="2">도서 정보 상세 보기</th>
			</tr>
			<tr>
				<th>도서 일련번호</th>
				<!-- 이렇게 접근할 수 있는 이유는 request 속성을 준것과 겟세터때문임 -->
				<!-- 파라미터에 넘겨야 하는데 화면에 보이면 안되면 type을 hidden으로 주면 보이지 않게됨 -->
				<td>
					${requestScope.book.bookSeq }
					<input type="hidden" name="action" value="update" />
					<input type="hidden" name="bookSeq" value="${requestScope.book.bookSeq }" />
				</td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td>${book.isbn }</td>
			</tr>
			<tr>
				<th>도서명</th>
				<td>${book.title }</td>
			</tr>
			<tr>
				<th>저자</th>
				<td>${book.author }</td>
			</tr>
			<tr>
				<th>내용소개</th>
				<td>${book.content }</td>
			</tr>
			<tr>
				<th>출판사</th>
				<td>${book.company_nm }</td>
			</tr>
			<tr>
				<th>페이지 수</th>
				<td>${book.total_page }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${book.price }</td>
			</tr>
			<tr>
				<th>재고 수량</th>
				<td>${book.quantity }</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정하기" />
				</th>
			</tr>
		</table>
	</form>
</body>
</html>