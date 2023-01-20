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
   <%
//1. 로그인세션제어(관리자는 제외)
String id = (String) session.getAttribute("id");//다운캐스팅
if(id == null || !id.equals("admin")){ //순서바뀌면 에러발생하므로 항상 null 먼저 비교할 것
	response.sendRedirect("/test/member/main");
}
%>
<h2 style="text-align: center;">회원목록</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>회원가입일</td>
		<td>최근회원정보수정일</td>
	</tr>
	<c:forEach items="${memberList}" var="mb">	
		<tr>
			<td><c:out value="${mb.mid}"></c:out></td>
			<td><c:out value="${mb.mpwd}"></c:out></td>
			<td><c:out value="${mb.mname}"></c:out></td>
			<td><c:out value="${mb.memail}"></c:out></td>
			<td><c:out value="${mb.regdate}"></c:out></td>?
			<td><c:out value="${mb.updatedate}"></c:out></td>?
		</tr>
	</c:forEach>
</table>
<input type="button" value="메인으로" class="btn" onclick="location.href='/test/member/main'">

  </body>
</html>
