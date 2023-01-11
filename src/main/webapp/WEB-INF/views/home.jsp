<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>Home</title>
<style>
	section{height:800px;}
	#height{height:200px;}
</style>
</head>

<body>
	<%@include file="includes/header.jsp"%>
	<section>
	
	</section>
	<a href="abc1.do">유의사항</a>
	<hr>
	<a href="abc2.do">예약2</a>
	<hr>
	<a href="abc3.do">예약3</a>
	<hr>
	<a href="abc4.do">예약4</a>
	<hr>
	<a href="abca.do">예약완료-무료</a>
	<hr>
	<a href="abcb.do">예약완료-결제</a>
	<hr>
	<a href="medicallist.do">건강상담소리스트</a>
	<hr>
	<a href="medicalview.do">건강상담소보기</a>
	<a href="notice1.do">공지1</a>
	<hr><a href="notice2.do">공지2</a>
	<hr><a href="notice3.do">공지3</a>
	<hr><a href="notice4.do">공지4</a>
	<hr>
	<%@include file="includes/footer.jsp"%>

</body>
</html>
