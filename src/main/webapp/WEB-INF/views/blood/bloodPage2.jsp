<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헌혈 전자문진</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<style>
#main {
	margin:100px auto;
	width: 1320px;	
	
}
.order_box{
        width: 790px;
        height: 110px;
        display: flex;
 		align-items: flex-end;
        justify-content: center;
      }    
.order{
        width: 500px;
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
        }
.order li:nth-child(3){color:#ce8080;}
#main h2 {
	font-size: 35px;
	font-weight: bold;
}

#main div {
	border: 1px solid #000;
	margin-top: 20px;
	border-radius: 10px;
	padding: 20px;
	overflow: auto;
	width: 1320px;
	height: 600px;
}

#warning span {
	font-size: 25px;
	font-weight: bold;
}

#warning p {
	font-size: 20px;
	line-height: 30px;
}

#main a {
	margin-top: 20px;
	position: relative;
	float: right;
	background-color: #FF9797;
	text-align: center;
	width: 230px;
	height: 40px;
	padding-top: 20px;
	border-radius: 10px;
	color: #fff;
	font-size: 20px;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	
	<div class="order_box">
		<ul class="order">
			<li>헌혈 유의사항</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 전자문진</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 예약</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 예약 완료</li>
		</ul>
	</div>
	
	<main id="main">
		<h2>헌혈 전자문진</h2>
		<hr>
			<iframe src="https://www.bloodinfo.net/emi2/go_emi4_login_page.do?lang=ko" style="height:1500px; width:1300px;"></iframe>

		<a href="page3.do">헌혈 예약하러가기</a>
	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>