<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
	<form action="${contextPath }main?action=update" method="post">
		<table>
			<tr>
				<th colspan="2">도서 정보 수정</th>
			</tr>
			<tr>
				<th>도서 일련번호</th>
				<!-- 이렇게 접근할 수 있는 이유는 request 속성을 준것과 겟세터때문임 -->
				<!-- 파라미터에 넘겨야 하는데 화면에 보이면 안되면 type을 hidden으로 주면 보이지 않게됨 -->
				<td>
					${requestScope.book.bookSeq }
					<input type="hidden" name="bookSeq" value="${requestScope.book.bookSeq }" />
				</td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td><input type="text" name="isbn" value="${book.isbn }" /></td>
			</tr>
			<tr>
				<th>도서명</th>
				<td><input type="text" name="title" value="${book.title }" /></td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" name="author" value="${book.author }" /></td>
			</tr>
			<tr>
				<th>내용소개</th>
				<td><textarea name="content" id="" cols="60" rows="15">${book.content }</textarea></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td>
					${book.companyCd }
				<c:forEach var="code" items="${codes }">
					<c:if test="${book.companyCd eq code.code }">
						<input type="radio" name="companyCd" value="${code.code }" id="${code.code }" checked/>
						<label for="${code.code }">${code.codeVal }</label>
					</c:if>
					<c:if test="${book.companyCd ne code.code }">
						<input type="radio" name="companyCd" value="${code.code }" id="${code.code }" />
						<label for="${code.code }">${code.codeVal }</label>
					</c:if>
				</c:forEach>
				<%-- <c:if test="${book.companyCd eq 1002 }">
					<input type="radio" name="companyCd" value="1002" id="1002" checked/>
					<label for="1002">더 스토리</label>
				</c:if>
				<c:if test="${book.companyCd ne 1002 }">
					<input type="radio" name="companyCd" value="1002" id="1002" />
					<label for="1002">더 스토리</label>
				</c:if>						
				<c:if test="${book.companyCd eq 1003 }">
					<input type="radio" name="companyCd" value="1003" id="1003" checked/>
					<label for="1003">위즈덤</label>
				</c:if>
				<c:if test="${book.companyCd ne 1003 }">
					<input type="radio" name="companyCd" value="1003" id="1003" />
					<label for="1003">위즈덤</label>
				</c:if>	
				<c:if test="${book.companyCd eq 1004 }">
					<input type="radio" name="companyCd" value="1004" id="1004" checked/>
					<label for="1004">흔</label>
				</c:if>
				<c:if test="${book.companyCd ne 1004 }">
					<input type="radio" name="companyCd" value="1004" id="1004" />
					<label for="1004">흔</label>
				</c:if>	
				<c:if test="${book.companyCd eq 1005 }">
					<input type="radio" name="companyCd" value="1005" id="1005" checked/>
					<label for="1005">북 하우스</label>
				</c:if>
				<c:if test="${book.companyCd ne 1005 }">
					<input type="radio" name="companyCd" value="1005" id="1005" />
					<label for="1005">북 하우스</label>
				</c:if>			 --%>		
									
				</td>
			</tr>
			<tr>
				<th>페이지 수</th>
				<td><input type="number" name="totalPage" value="${book.total_page }" /></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="price" value="${book.price }" /></td>
			</tr>
			<tr>
				<th>재고 수량</th>
				<td><input type="number" name="quantity" value="${book.quantity }" /></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="저장하기" />
					<input type="reset" value="초기화" />
				</th>
			</tr>
		</table>
	</form>
</body>
</html>