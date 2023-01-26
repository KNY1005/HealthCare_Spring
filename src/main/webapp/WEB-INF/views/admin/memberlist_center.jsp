<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>시작하기</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
  </head>
  <body>
	<c:forEach var="mb" items="${list}">
	<input type="hidden" name="command"  value="updaterole">
	<input type="hidden" name="midx"  value="${mb.midx}">
	<h2 style="text-align: center;">회원목록</h2>
	<table border="1">
	<tr>
		<td>아이디</td>
		<td><c:out value="${mb.mid}"></c:out></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><c:out value="${mb.mpwd}"></c:out></td>
	
	<tr>
		<td>이름</td>
		<td><c:out value="${mb.mname}"></c:out></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><c:out value="${mb.memail}"></c:out></td>
	</tr>
	<tr>
		<td>등급</td>
		<td><c:out value="${mb.mgrade}"></c:out></td>
	</tr>
	<tr>
		<td>상태변경</td>	
		<td>
		<form action="">
			<select name="">
				<option>탈퇴</option>
				<option>강퇴</option>
				<option>정상</option>
				<option>휴면</option>
			</select>
		</form>
		</td>
	</tr>
	<tr>
		<td>등급변경</td>	
		<td>
		<form action="changeStotus.do" method="post">
		<input type="hidden" name="midx" value="${mb.midx }">
		<input type="hidden" name="page" value="${param.page }">
		<input type="hidden" name="parPageNum" value="${param.perPageNum }">
			<select name="stotus">
				<option ${(mb.mgrade == "G")?"selected":"" } >일반회원</option>
				<option ${(mb.mgrade == "D")?"selected":"" } >전문의회원</option>
				<option ${(mb.mgrade == "E")?"selected":"" } >예비전문의회원</option>
				<option ${(mb.mgrade == "A")?"selected":"" } >관리자</option>
			</select>
		<button>변경</button>
		</form>
		<a href="">상태변경</a>
		<a href="changeStotus.do">등급변경</a>
		</td>
	</tr>
</table>
<input type="button" value="메인으로" class="btn" onclick="location.href='/test/member/main'">

	</c:forEach>
  </body>
</html>
