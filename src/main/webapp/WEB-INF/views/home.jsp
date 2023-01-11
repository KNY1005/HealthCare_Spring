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
	<div id="height"></div>
	<section>
	</section>

	<%@include file="includes/footer.jsp"%>









</body>
</html>
