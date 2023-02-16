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

		.order_box {
			width: 790px;
			height: 110px;
			display: flex;
			align-items: flex-end;
			justify-content: center;
		}
		
		.order {
			width: 500px;
			display: flex;
			flex-direction: row;
			justify-content: space-evenly;
		}

		/*-----------------sub_nav_menu > end---------------*/

		
		main {
			width: 1320px;
			margin: 100px auto;
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

		#head {
			display: flex;
			flex-direction: row;
		}

		#search {
			font-weight: bold;
			font-size: 25px;
			vertical-align: top;
			margin-left: 760px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		#search button {
			style: none;
		}
		
		#search input::-webkit-search-decoration, #search input::-webkit-search-cancel-button,
			#search input::-webkit-search-results-button, #search input::-webkit-search-results-decoration
			{
			display: none;
		} /*search내의 요소 삭제*/
		#search input {
			height: 36px;
			font-size: 20px;
			margin-left: -8px;
			border: 1px solid #000;
			border-left: none;
			border-right: none;
			margin-right: -8px;
			padding-left: 10px;
		}
		
		#search input:focus {
			outline: none;
			background: #fff;
		}
		
		.hr {
			height: 2px;
			border: 0;
			background: #ff7373;
		}
		
		.cate {
			-webkit-appearance: none; /* 네이티브 외형 감추기 */
			-moz-appearance: none;
			appearance: none;
			font-weight: bold;
			width: 100px;
			padding-left: 10px;
			height: 40px;
			border: 1px solid #000;
			border-radius: 10px 0 0 10px;
			outline: 0 none;
			font-size: 20px;
			background: url("${path }/resources/image/bottom_arrow.png") no-repeat
				95% 50%; /* 화살표 모양의 이미지 */
		}
		#glass {
			border: 1px solid #000;
			padding: 3px 10px 5px 10px;
			border-radius: 0 10px 10px 0;
			border-left: none;
			background: #fff;
			font-size: 20px;
			height: 40px;
		}
		
		
		#glass:hover {
			cursor: pointer;
		}
		
		#medical_list {
			border-collapse: separate;
			border-spacing: 0 20px;
		} /*tr간 간격*/
				




		main hr {
			height: 2px;
			border: 0;
			background: #ff7373;
		}

		#glass:hover {
			cursor: pointer;
		}

		.content {
			background: #ffe7e7;
		}
		
		.title {
			font-size: 30px;
		}
		
		.column {
			cursor: pointer;
			background: #fff;
		}
		
		.column th {
			width: 350px;
			font-weight: bold;
			font-size: 20px;
			text-align: center;
			vertical-align: middle;
			height: 73px;
		}
		
		.content td:first-child {
			border-radius: 10px 0 0 10px;
			width: 1000px;
			text-align: left;
			padding-left: 20px;
		} /*td테두리 첫번쨰와 마지막만 둥글게 하기위해서*/
		.content td:last-child {
			border-radius: 0 10px 10px 0;
		}
		
		.content td {
			width: 350px;
			font-weight: bold;
			font-size: 20px;
			text-align: center;
			vertical-align: middle;
			height: 73px;
			padding: 10px 0;
		}
		
		.content:hover {
			background: #fff;
			box-shadow: 0 0 0 3px #ff8f8f inset;
			border-radius: 10px;
			transition: .2s;
			cursor: pointer;
		}
		
		.button {
			border: 0;
			background: #ffe7e7;
			width: 180px;
			height: 45px;
			border-radius: 10px;
			font-size: 20px;
			font-weight: bold;
			display: inline-block;
			float: right;
			margin-right: 20px;
		}
		
		.button:hover {
			border-radius: 10px;
			transition: .2s;
			box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
			cursor: pointer;
		}
		
		#page_div {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		#page {
			display: flex;
		}
		
		#page li {
			margin: 0 10px 0;
		}


	
		#page li a {
			font-size: 20px;
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

</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="order_box">
		<ul class="order">
			<li>공지사항</li>
			<li>|</li>
			<li>문의사항</li>
			<li>|</li>
			<li style="color: #CE8080;">건강상담소</li>
		</ul>
	</div>
	<main>
		<div id="head">
			<h2>건강상담소</h2>
			<div id="search">
				<form action="medicalList.do" method="get">
				<select class="cate" name="searchType">
					<option value="btitle"
							<c:if test="${param.searchType eq 'btitle' }">selected</c:if>>제목</option>
						<option value="bcontent"
							<c:if test="${param.searchType eq 'bcontent' }">selected</c:if>>내용</option>

					</select> <input type="text" name="keyWord" placeholder="검색">
					<button id="glass">
						<i class="xi-search"></i>
					</button>
				</form>
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
		<hr class="hr">
		<table id="medical_list">
			<tr class="column">
				<th>제목 및 내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>답변</th>
			</tr>
			<c:forEach items="${list}" var="vo">
			<tr class="content"
				onclick="location.href='medicalView.do?bidx=${vo.bidx}'">
				<td>
					<p class="title">${vo.btitle}${vo.bidx }</p><br />
					<p>${vo.bcontent}</p>
				</td>
				<td>${vo.bwriter}</td>
				<td>${vo.bwdate}</td>
				<td>${vo.bhit}</td>
				<td>${vo.bstate}</td>
			</tr>
		</c:forEach>
		</table>
			<div id="page_div">
			<ul id="page">
				<c:if test="${page.prev}">
					<li><a
						href="medicalList.do?blist=H&page=${page.startPage - 1}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}"><i
							class="xi-angle-left"></i></a></li>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="vo">
					<li><a
						href="medicalList.do?blist=H&page=${vo}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}">${vo}</a></li>
				</c:forEach>
				<c:if test="${page.next && page.endPage > 0}">
					<li><a
						href="medicalList.do?blist=H&page=${page.endPage + 1}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}"><i
							class="xi-angle-right"></i></a></li>
				</c:if>
			</ul>
		</div>
		 <c:if test="${member!= null }"><button class="button" onclick="location.href='medicalWrite.do'">글쓰기</button></c:if>
	</main>	
	
	<%@include file="../includes/footer.jsp"%>
	<script src="${path}/resources/js/swiper.js"></script>

</body>
</html>