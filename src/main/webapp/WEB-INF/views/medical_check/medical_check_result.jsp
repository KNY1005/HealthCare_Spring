<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=, initial-scale=1.0">
	<title>건강검진 예약확인</title>
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
		/*-----------------sub_nav_menu > start---------------*/

		.order_box{
				margin-left:50px;
		        width: 790px;
		        height: 110px;
		        display: flex;
		 		align-items: flex-end;
		        justify-content: center;
		      }    
		.order{
		        width: 600px;
		        display: flex;
		        flex-direction: row;
		        justify-content: space-evenly;
		        }
		.order li:nth-child(3){color:#ce8080;}


		/*-----------------sub_nav_menu > end---------------*/

		*{font-weight:bold;}
		
		
		main {
			width: 1320px;
			min-height:529px;
			margin: 100px auto;
		}
		
		main ul {
			padding-left: 0px;
		}

		main #commit {
			height: 500px;
			display: flex;
			flex-direction: column;
		}

		main #commit #finish h2 {
			text-align: center;
			font-size: 40px;
		}

		main #infor {
			margin-top: 40px;
			height: 170px;
			background-color: #FFEFEF;
			border-radius: 30px;
		}

		main #infor ul {
			display: flex;
			justify-content: space-around;
			padding: 10px;
			font-size: 25px;
		}

		main #infor ul li {
			font-size: 20px;
			width: 290px;
			text-align: center;
		}

		main #infor ul:nth-child(1) {
			margin-top: 31.25px;
		}

		main #guide {
			margin-top: 10px;
			font-size: 15px;
		}
		
		main #guide p:nth-child(2) {
			margin-top: 5px;
		}

		main #questionnaire {
			margin-top: 40px;
			height: 70px;
			background-color: #FFEFEF;
			border-radius: 40px;
			display: flex;
			align-items: center;
			font-size: 25px;
		}

		main #questionnaire p {
			margin-left: 100px;
		}

		main #questionnaire a {
			margin-left: 400px;
			color: blue;
		}

		main #question_guide p {
			margin-top: 10px;
		}

		main #faker {
			display: flex;
			justify-content: center;			
		}

		main #faker a {
			width: 210px;
			height: 70px;
			font-size: 25px;
			margin-top: 40px;
			background-color: #FFEFEF;
			border: #FFEFEF;
			border-radius: 40px;
			font-weight: bold;
			cursor: pointer;
		}
		
		main #faker p{
			margin-top:25px;
			margin-left:23px;
			}
		main #faker a:hover {
			background: #ffe7e7;
			transition: .2s;
			box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
			cursor: pointer
		}
	</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
		<div class="order_box">
		<ul class="order">
			<li>건강검진 유의사항</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 병원조회</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 예약하기</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 예약완료</li>
		</ul>
	</div>
	<main>
		<section id="commit">
			<div id="finish">
				<h2>예약이 완료되었습니다</h2>
			</div><!--//#finish-->
			<div id="infor">
				<ul>
					<li>병원명</li>
					<li>검진명</li>
					<li>날짜</li>
				</ul>
				<ul>
					<li>$${rvo.rhospital}</li>
					<li>일반건강검진</li>
					<li>${rvo.rdate }/${rvo.rtime }</li>
				</ul>
			</div><!--//#infor-->
			<div id="guide">
				<p>메시지 수신을 동의하신 경우 해당 날짜 전날 SMS 안내문자가 발송될 예정입니다.</p>
				<p>수신동의 설정 : 마이페이지 〉개인정보 수정 〉수신 유/무</p>
			</div><!--//#guide-->
			<div id="questionnaire">
				<p>문진표 PDF 다운로드</p>
				<a href="#">문진표.pdf</a>
			</div><!--//#questionnaire-->
			<div id="question_guide">
				<p>문진표 다운로드 후 미리 작성해 가시면 빠른 검진을 할 수 있습니다.</p>
			</div><!--//#question_guide-->
			<div id="faker">
				<a href="<%=request.getContextPath() %>/mypage2.do"><p>마이페이지 이동</p></a>
			</div><!--//#faker-->
		</section><!--//#commit-->
	</main>
		<%@include file="../includes/footer.jsp"%>






</body>
</html>
	