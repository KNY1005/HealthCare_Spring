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
<h2 style="text-align: center;">회원목록</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>이메일</td>
		<td>등급</td>
		<td>등급변경</td>
	</tr>
		<c:forEach var="mb" items="${list}">
	<tr>
			<td><c:out value="${mb.mid}"></c:out></td>
			<td><c:out value="${mb.mname}"></c:out></td>
			<td><c:out value="${mb.memail}"></c:out></td>
			<td><c:out value="${mb.mgrade}"></c:out></td>
	</tr>
		</c:forEach>
</table>
	<div id="page_div">
			<ul id="page">
				<c:if test="${page.prev}">
					<li><a
						href="list.do?page=${page.startPage - 1}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}"><i
							class="xi-angle-left"></i></a></li>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="vo">
					<li><a
						href="list.do?page=${vo}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}">${vo}</a></li>
				</c:forEach>
				<c:if test="${page.next && page.endPage > 0}">
					<li><a
						href="list.do?page=${page.endPage + 1}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}"><i
							class="xi-angle-right"></i></a></li>
				</c:if>
			</ul>
		</div>
<input type="button" value="메인으로" class="btn" onclick="location.href='home'">

  </body>
</html>
