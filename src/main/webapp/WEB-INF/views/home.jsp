<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <c:set var="path" value="${pageContext.request.contextPath}"/> <!-- 기준 경로 설정 -->
<html>
<head>
	<!-- 한글 설정  -->
	<meta charset="UTF-8"> <!-- 추가할부분 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 추가할부분 -->
	<meta http-equiv="X-UA-Compatible" content="ie=edge"> <!-- 추가할부분 -->
	<title>Home</title>
	<link href="${path}/resources/css/reset.css" rel="stylesheet"/> 
</head>
    
<body>
<%@include file="includes/header.jsp"  %>

  
<%@include file="includes/footer.jsp"  %>









</body>
</html>
