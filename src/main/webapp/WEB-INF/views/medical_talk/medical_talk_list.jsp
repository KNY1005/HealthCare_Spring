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
	<title>건강상담소 목록</title>
	<!--파비콘-->
	<link rel="icon" type="image/png" sizes="16x16"
		href="${path }/resources/image/favicon/favicon-16x16.png" />
	<link rel="manifest"
		href="${path }/resources/image/favicon/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage"
		content="${path }/resources/image/favicon/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
	<!--외부 스크립트 플러그인 연결-->
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	<style>
		/*-----------------sub_nav_menu > start---------------*/

		.sub_nav_menu ul {
			margin-left: 135px;
			margin-top: 20px;
		}

		.sub_nav_menu li {
			text-align: center;
			float: left;
			width: 100px;
			padding: 0 30px;
			/*글자길이 길어서 넘어가면 이거 늘리세요 */
			font-weight: bold;
			font-size: 20px;
		}

		.sub_nav_menu li:nth-child(2) {
			border-left: 1px solid #000;
			border-right: 1px solid #000;
		}

		.sub_nav_menu li:nth-child(3) {
			color: #9e0404;
		}

		/*-----------------sub_nav_menu > end---------------*/
		#height {
			height: 80px;
		}
		
		main {
			
			width: 1320px;
			height:1300px;
			margin: 200px auto 0;
			
		}

		main h2 {
			font-weight: bold;
			font-size: 40px;
			display: inline-block;
		}

		/*-----명예의전당시작-----*/
		main #rank {
			height: 280px;
		}

		main #rank h3 {
			font-size: 30px;
			font-weight: bold;
			text-align: center;
			margin-top: 30px;
		}

		main #rank h3 img {
			width: 30px;
			height: 30px;
		}

		main #rank #first {
			display: block;
			width: 100%;
			height: 100%;
			object-fit: cover;
			border: 2px solid rgb(63, 62, 62);
			width: 250px;
			height: 190px;
			border-radius: 30px;
		}

		main #rank #second {
			display: block;
			width: 100%;
			height: 100%;
			object-fit: cover;
			border: 2px solid rgb(63, 62, 62);
			width: 250px;
			height: 190px;
			border-radius: 30px;
		}

		main #rank #third {
			display: block;
			width: 100%;
			height: 100%;
			object-fit: cover;
			border: 2px solid rgb(63, 62, 62);
			width: 250px;
			height: 190px;
			border-radius: 30px;
		}

		main #rank #and {
			display: block;
			width: 100%;
			height: 100%;
			object-fit: cover;
			border: 2px solid rgb(63, 62, 62);
			width: 250px;
			height: 190px;
			border-radius: 30px;
		}


		main #rank #gold {
			margin-left: 5px;
			margin-top: 5px;
			position: absolute;
			border-radius: 100px;
			width: 60px;
			height: 60px;
			background: url("${path }/resources/image/gold.png")center no-repeat;
		}

		main #rank #silver {
			margin-left: 5px;
			margin-top: 5px;
			position: absolute;
			border-radius: 100px;
			width: 60px;
			height: 60px;
			background: url("${path }/resources/image/silver.png")center no-repeat;
		}

		main #rank #bronze {
			margin-left: 5px;
			margin-top: 5px;
			position: absolute;
			border-radius: 100px;
			width: 60px;
			height: 60px;
			background: url("${path }/resources/image/bronze.png")center no-repeat;
		}

		main #rank #other {
			margin-left: 20px;
			margin-top: 20px;
			position: absolute;
			border-radius: 100px;
			width: 40px;
			height: 40px;
			background: url("${path }/resources/image/tumb.png")center no-repeat;
		}

		main #rank p {
			position: relative;
			font-size: 22px;
			font-weight: bold;
			text-align: center;
			margin-top: 20px;
		}

		#rank h4 span {
			font-size: 35px;
		}

		main #rank h4 {
			font-size: 20px;
			margin-left: 50px;
			margin-top: 25px;
			font-weight: bold;
		}
		/*-----명예의전당 끝-----*/

		main h4 {
			font-weight: bold;
			font-size: 36px;
			display: inline-block;
		}

		main #head {
			position: relative;
		}

		main #search {
			bottom: 4px;
			font-weight: bold;
			font-size: 36px;
			vertical-align: top;
			position: absolute;
			right: 10px;
		}

		main input {
			display: inline-block;
		}

		main #search_n {
			position: absolute;
			left: -50px;
			top: 5px;
		}

		main input::-webkit-search-decoration,
		main input::-webkit-search-cancel-button,
		main input::-webkit-search-results-button,
		main input::-webkit-search-results-decoration {
			display: none;
		}

		/*search내의 요소 삭제*/
		main input {
			height: 40px;
			font-size: 20px;
			margin-left: 20px;
			border: 1px solid #000;
			border-radius: 10px;
			padding-right: 40px;
		}

		main #search div a {
			position: absolute;
			right: 5px;
			bottom: -2px;
		}

		main hr {
			height: 2px;
			border: 0;
			background: #ff7373;
		}

		main #glass:hover {
			cursor: pointer;
		}

		main table {
			border-collapse: separate;
			border-spacing: 0 20px;
		}

		/*tr간 간격*/
		main table tr {
			background: #ffe7e7;
		}

		main table tr:nth-child(1) {
			background: #fff;
		}

		main table td:first-child,
		main table th:first-child {
			border-radius: 10px 0 0 10px;
			width: 1000px;
		}

		/*td테두리 첫번쨰와 마지막만 둥글게 하기위해서*/
		main table td:first-child {
			text-align: left;
			padding-left: 20px;
		}

		main table #tit {
			font-size: 36px;
		}

		main table td:last-child,
		main table th:last-child {
			border-radius: 0 10px 10px 0;
		}

		main table th,
		main table td {
			width: 350px;
			font-weight: bold;
			font-size: 20px;
			text-align: center;
			vertical-align: middle;
			height: 73px;
		}

		main table td {
			padding: 10px 0;
		}

		main table tr:nth-child(n+2):hover {
			background: #fff;
			box-shadow: 0 0 0 3px #ff8f8f inset;
			border-radius: 10px;
			transition: .2s;
			cursor: pointer;
		}

		main button {
			border: 0;
			background: #ffe7e7;
			width: 180px;
			height: 45px;
			border-radius: 10px;
			font-size: 20px;
			font-weight: bold;
			float: right;
			margin-right: 20px;
		}

		main button:hover {
			border-radius: 10px;
			transition: .2s;
			box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
			cursor: pointer;
		}

		/* swiper start*/

		.swiper {
			width: 100%;
			height: 80%;
		}

		.swiper-slide {
			text-align: center;
			font-size: 18px;
			background: #fff;

			/* Center slide text vertically */
			display: -webkit-box;
			display: -ms-flexbox;
			display: -webkit-flex;
			display: flex;
			-webkit-box-pack: center;
			-ms-flex-pack: center;
			-webkit-justify-content: center;
			justify-content: center;
			-webkit-box-align: center;
			-ms-flex-align: center;
			-webkit-align-items: center;
			align-items: center;
		}
	</style>

	<script>
		window.onload = function () {
			var swiper = new Swiper(".mySwiper", {
				slidesPerView: 3,
				spaceBetween: 200,
				freeMode: true,
				autoplay: {//자동으로 슬라이드됨.
					delay: 10000,//현재슬라이드가 보여지는 시간(5000ms=5초)
					disableOnInteraction: false//상호작용후 다시 자동재생 실행
				},

			})
		}
	</script>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div id="height"></div>
	<div class="sub_nav_menu">
		<ul>
			<li><a href="notice1.do">공지사항</a></li>
			<li><a href="question/questionList.do">문의사항</a></li>
			<li><a href="medicallist.do">건강상담소</a></li>
		</ul>
	</div>
	<main>
		<div id="head">
			<h2>건강상담소</h2>
			<div id="search">
				<P id="search_n">검색</P>
				<div>
					<input type="search" name="search">
					<a href="#" id="glass"><i class="xi-search"></i></a>
				</div>
			</div><!--//#search-->
		</div><!--//#head-->
		<hr>
		<div id="rank">
			<h3><img src="${path }/resources/image/trophy.png">명예의 전당<img src="${path }/resources/image/trophy.png"></h3>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div id="first">
							<div id="gold"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#first-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="second">
							<div id="silver"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#second-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="third">
							<div id="bronze"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#third-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="and">
							<div id="other"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#and-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="and">
							<div id="other"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#and-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="and">
							<div id="other"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#and-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="and">
							<div id="other"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#and-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="and">
							<div id="other"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#and-->
					</div><!--//.swiper-slide-->
					<div class="swiper-slide">
						<div id="and">
							<div id="other"></div>
							<h4><span>김모모</span> 전문의</h4>
							<p><i class="xi-comment xi-1x"></i> 답변 200개</p>
							<p><i class="xi-thumbs-up xi-1x"></i> 추천 200개</p>
						</div><!--//#and-->
					</div><!--//.swiper-slide-->
				</div><!--//.swiper-wrapper-->
			</div><!--//.swiper mySwiper-->
		</div><!--//#rank-->
		<hr>
		<table>
			<tr onclick="location.href='medicalview.do'">
				<th>제목 및 내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>답변</th>
			</tr>
			<tr onclick="location.href='medicalview.do'">
				<td>
					<p id="tit">제목</p><br />
					<p>여기는 내용 입니다.</p>
				</td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr onclick="location.href='medicalview.do'">
				<td>
					<p id="tit">제목</p><br />
					<p>여기는 내용 입니다.</p>
				</td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr onclick="location.href='medicalview.do'">
				<td>
					<p id="tit">제목</p><br />
					<p>여기는 내용 입니다.</p>
				</td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr onclick="location.href='medicalview.do'">
				<td>
					<p id="tit">제목</p><br />
					<p>여기는 내용 입니다.</p>
				</td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr onclick="location.href='medicalview.do'">
				<td>
					<p id="tit">제목</p><br />
					<p>여기는 내용 입니다.</p>
				</td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
		</table>
		<button type="button" onclick="location.href='medicalwrite.do'">글쓰기</button>
	</main>	
	
	<%@include file="../includes/footer.jsp"%>

</body>
</html>