<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=, initial-scale=1.0">
	<title>건강검진 예약하기</title>
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

		.sub_nav_menu ul {
			margin-left: 165px;
			margin-top: 20px;
		}

		.sub_nav_menu li {
			text-align: center;
			float: left;
			/*글자길이 길어서 넘어가면 이거 늘리세요 */
			font-weight: bold;
			font-size: 20px;
		}

		.sub_nav_menu li:nth-child(1),
		.sub_nav_menu li:nth-child(3),
		.sub_nav_menu li:nth-child(5),
		.sub_nav_menu li:nth-child(7) {
			width: 180px;
		}

		.sub_nav_menu li:nth-child(2),
		.sub_nav_menu li:nth-child(4),
		.sub_nav_menu li:nth-child(6) {
			width: 20px;
		}

		.sub_nav_menu li:nth-child(5) {
			color: #9E0404;
		}

		/*-----------------sub_nav_menu > end---------------*/
		
		*{font-weight:bold;}
		
		#height {
			height: 80px;
		}
		
		main {
			margin-left: 300px;
			margin-top: 100px;
			width: 1320px;
			position: relative;
			height: 800px;
		}
		
		main h2 {
			font-size: 40px;
		}
		/*첫번째 백그라운드 핑크색박스*/
		main .medical {
			background-color: #FFE7E7;
			width: 1320px;
			height: 66px;
			border-radius: 10px;
			margin-top: 30px;
		}

		main .medical p {
			float: left;
			font-size: 22px;
			margin-top: 22px;
		}

		main .medical p:nth-child(1) {
			margin-left: 44.805px;
		}

		main .medical p:nth-child(2) {
			margin-left: 80px;
		}

		main .medical p:nth-child(3) {
			margin-left: 80px;
		}

		main .medical p:nth-child(4) {
			margin-left: 80px;
		}
		/*중간 핑크색 선*/
		main hr {
			margin-top: 30px;
			border: 1px solid #FF7373;
		}

		/*제일 크고 제일 아래있는 큰 연한 핑크색 박스*/
		main .timetable {
			border-radius: 40px;
			border: 3px solid#FDBFBF;
			height: 350px;
			width: 1290px;
			margin-top: 30px;
			display: flex;
			flex-direction:column;
			margin-left: 15px;
		}
		
		main .timetable #title{
			justify-content:center;
			margin-top:40px;
			font-size:22px;
			display:flex;
			}
		
		main .timetable #content{
			justify-content:center;
			margin-top:40px;
			font-size:22px;
			display:flex;
			}
		
		main .timetable #content p{
			width: 230px;
			height:50px;
			border:none;
			border-radius: 30px;
			text-align:center;
			background-color:#FFE7E7;}




		main .timetable  #content span {
			width: 250px;
			height: 40px;
			border: 1px solid#000;
			border-radius: 10px;
		}

		main .timetable #content span i {
					
			float: right;
		}



		main .timetable  #time {
			width: 300px;
			height: 200px;
			margin-top: 120px;
			margin-left: 640px;
		}

		main .timetable #content select {
			margin-top: 20px;
			font-size: 22px;
			margin-left: 130px;
			width: 150px;
		}
		/*예약 버튼*/
		main .timetable button {
			width: 130px;
			height: 50px;
			border-radius: 10px;
			background-color: #FF9797;
			color: #fff;
			font-size: 25px;
			margin-top: 40px;
			border: none;
		}
	</style>


</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div id="height"></div>
				<div class="sub_nav_menu">
				<ul>
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
		<h2>건강검진 예약</h2>
		<div class="medical">
			<p>땡땡 병원</p>
			<p>진료시간 : 00:00 ~ 00:00</p>
			<p>주소 : 전라북도 전주시 완산구 땡땡로 77</p>
			<p>연락처 : 063-222-0000</p>
		</div><!--//.medical-->
		<hr>
		<div class="timetable">
				<div id="title">
					<p>검진명</p>
					<p>날짜</p>
					<p>시간</p>
				</div><!--//#title-->				
				<div id="content">
					<p>일반건강검진</p>
					<span><a href="#"><i class="xi-calendar xi-2x"></i></a></span>
					<select>
						<option value='' selected>-- 선택 --</option>
						<option value='09시'>09시</option>
						<option value='10시'>10시</option>
						<option value='11시'>11시</option>
						<option value='12시'>12시</option>
						<option value='14시'>14시</option>
						<option value='15시'>15시</option>
						<option value='16시'>16시</option>
						<option value='17시'>17시</option>
					</select>
				</div>
			<button>예약</button>
		</div><!--//.timetable-->
	</main>
		<%@include file="../includes/footer.jsp"%>






</body>
</html>
	