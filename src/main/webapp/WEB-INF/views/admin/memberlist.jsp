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
  <script type="text/javascript">
  	function updateRole(midx) {
		location.href="memberlist_center.do;
	}
  </script>
  <body>
<h2 style="text-align: center;">회원목록</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>등급</td>
		<td>등급변경</td>
	</tr>
	<c:forEach var="mb" items="${list}">
		<tr>
			<td><c:out value="${mb.mid}"></c:out></td>
			<td><c:out value="${mb.mpwd}"></c:out></td>
			<td><c:out value="${mb.mname}"></c:out></td>
			<td><c:out value="${mb.memail}"></c:out></td>
			<td><c:out value="${mb.mgrade}"></c:out></td>
			<td><button onclick="updateRole(${mb.midx});">변경</button></td>
		</tr>
	</c:forEach>
</table>
<input type="button" value="메인으로" class="btn" onclick="location.href='/test/member/main'">

  </body>
</html>
