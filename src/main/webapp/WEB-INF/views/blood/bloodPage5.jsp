<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헌혈예약완료</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<style>
body, h1, h2, h3, h4, h5, h6, li, p, #nav li a, #topbar, input, button,
	select, textarea, a, .wf-container>*, .widget-title, .dwqa-container,
	#wpmem_reg, #wpmem_login {
	font-family: "arita-light", "arita-sans-light" !important;
	color: #000;
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
.order li:nth-child(7){color:#ce8080;}
#commit {
	width: 1320px;
	height: 700px;
	margin: 100px auto;
}

#money {
	margin: 0 auto 0;
	font-size: 40px;
	text-align: center;
	font-weight: bold;
}

#infor {
	width: 1000px;
	height: 170px;
	background-color: #FFEFEF;
	margin: 40px auto 0;
	border-radius: 20px;
	text-align: center;
}

#infor ul {
	display: inline-block;
	font-weight: bold;
	margin: 10px 30px 0 30px;
}

#infor ul li {
	font-size: 20px;
	text-align: center;
	margin: 30px 0 30px 0;
}

#guide {
	font-size: 13px;
	font-weight: bold;
	width: 1000px;
	text-align: left;
	margin: 20px auto 0;
}

#button {
	width: 190px;
	padding: 15px;
	font-size: 25px;
	font-weight: bold;
	background-color: #FFEFEF;
	border: #FFEFEF;
	border-radius: 10px;
	display: inline-block;
	float: right;
}

#button:hover {
	background: #ffe7e7;
	border-radius: 10px;
	transition: .2s;
	box-shadow: inset 3px 3px 5px #c57171;
	cursor: pointer
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

	<section id="commit">
		<div id="height"></div>
		<div id="money">헌혈예약이 완료되었습니다.</div>
		<div id="infor">
			<ul>
				<li>헌혈의집명</li>
				<li>${rvo.rhospital}</li>
			</ul>
			<ul>
				<li>날짜</li>
				<li>${rvo.rdate }/${rvo.rtime }</li>
			</ul>
			<ul>
				<li>헌혈종류</li>
				<li>${rvo.rname }</li>
			</ul>

		</div>
		<div id="guide">
			메시지 수신을 동의하신 경우 해당 날짜 전날 SMS 안내문자가 발송될 예정입니다.<br /> 수신동의 설정 : 마이페이지 >
			개인정보 수정
			<button id="button">마이페이지</button>
		</div>
	</section>
	<%@include file="../includes/footer.jsp"%>
</body>